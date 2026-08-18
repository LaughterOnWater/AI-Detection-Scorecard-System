#!/usr/bin/env bash
#
# install.sh — set up the `getytcc` command on any Unix/Linux system
# (including WSL2 Kali Linux).
#
# What it does:
#   1. Creates a dedicated Python virtual environment at
#        ~/.local/share/getytcc/venv
#   2. Installs the only dependency, `youtube-transcript-api`, into it.
#   3. Installs the `getytcc` script to ~/bin/getytcc and rewrites its
#      shebang to point at the venv's python, so it always runs with the
#      right interpreter and dependency — no system-wide pip install.
#
# Re-running this script is safe; it upgrades the dependency and refreshes
# the installed command.
#
# Usage:
#   ./install.sh            # install / update
#   PREFIX=~/.bin ./install.sh   # install the command somewhere other than ~/bin

set -euo pipefail

# --- Configuration (override with env vars if you like) --------------------
VENV_DIR="${GETYTCC_VENV:-$HOME/.local/share/getytcc/venv}"
BIN_DIR="${PREFIX:-$HOME/bin}"
TARGET="$BIN_DIR/getytcc"

# Resolve the directory this script lives in, so it can find the source file.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/getytcc"

# --- Sanity checks ---------------------------------------------------------
if [ ! -f "$SOURCE" ]; then
    echo "ERROR: cannot find the getytcc script next to this installer:" >&2
    echo "       expected at $SOURCE" >&2
    exit 1
fi

# Find a python3 with the venv module available.
PYTHON=""
for candidate in python3 python; do
    if command -v "$candidate" >/dev/null 2>&1; then
        if "$candidate" -c "import venv" >/dev/null 2>&1; then
            PYTHON="$candidate"
            break
        fi
    fi
done

if [ -z "$PYTHON" ]; then
    echo "ERROR: no python3 with the 'venv' module was found." >&2
    echo "       On Debian/Kali/Ubuntu install it with:" >&2
    echo "         sudo apt update && sudo apt install -y python3 python3-venv" >&2
    exit 1
fi

echo "==> Using interpreter: $("$PYTHON" --version 2>&1) ($(command -v "$PYTHON"))"

# --- 1. Create / reuse the virtual environment -----------------------------
if [ ! -d "$VENV_DIR" ]; then
    echo "==> Creating virtual environment at $VENV_DIR"
    mkdir -p "$(dirname "$VENV_DIR")"
    "$PYTHON" -m venv "$VENV_DIR"
else
    echo "==> Reusing existing virtual environment at $VENV_DIR"
fi

VENV_PY="$VENV_DIR/bin/python3"
[ -x "$VENV_PY" ] || VENV_PY="$VENV_DIR/bin/python"

# --- 2. Install the dependency --------------------------------------------
echo "==> Installing dependency: youtube-transcript-api"
"$VENV_PY" -m pip install --upgrade pip >/dev/null
"$VENV_PY" -m pip install --upgrade youtube-transcript-api

# --- 3. Install the command ------------------------------------------------
echo "==> Installing command to $TARGET"
mkdir -p "$BIN_DIR"
# Copy the script, then rewrite line 1 (the shebang) to the venv interpreter.
{
    echo "#!$VENV_PY"
    tail -n +2 "$SOURCE"
} > "$TARGET"
chmod +x "$TARGET"

# --- Done ------------------------------------------------------------------
echo
echo "==> Installed successfully."
echo "    Command : $TARGET"
echo "    Venv    : $VENV_DIR"
echo

# PATH check — warn if BIN_DIR isn't on PATH.
case ":$PATH:" in
    *":$BIN_DIR:"*)
        echo "You can now run:  getytcc <youtube-url>"
        ;;
    *)
        echo "NOTE: $BIN_DIR is not on your PATH yet."
        echo "      Add it by appending this line to ~/.bashrc (or ~/.zshrc):"
        echo
        echo "        export PATH=\"$BIN_DIR:\$PATH\""
        echo
        echo "      Then reload your shell:  source ~/.bashrc"
        echo "      Until then, run it with the full path:  $TARGET <youtube-url>"
        ;;
esac
