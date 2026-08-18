# Installing `getytcc`

`getytcc` fetches a YouTube video's closed-caption transcript into the current
folder as a clean `.txt` and a timestamped `.srt`. It is a small, pure-Python
tool with **one dependency** — [`youtube-transcript-api`](https://pypi.org/project/youtube-transcript-api/) —
and it runs from a dedicated virtual environment so it never touches your
system Python.

This guide covers **WSL2 Kali Linux** and **any other Unix/Linux system**
(Debian, Ubuntu, Fedora, Arch, macOS, …).

---

## What gets installed

| Path | What it is |
| --- | --- |
| `~/.local/share/getytcc/venv/` | A dedicated Python virtual environment holding `youtube-transcript-api`. |
| `~/bin/getytcc` | The command itself. Its shebang is rewritten to point at the venv's Python, so it always runs with the right interpreter. |

Nothing is installed globally. To uninstall, delete those two paths.

---

## Prerequisites

You need **Python 3.9+** with the `venv` module and `pip`.

### Debian / Ubuntu / **Kali (incl. WSL2)**

```bash
sudo apt update
sudo apt install -y python3 python3-venv python3-pip
```

> On a fresh WSL2 Kali install, `python3-venv` is often missing even when
> `python3` is present. Installing it is the single most common fix if the
> installer fails.

### Fedora / RHEL

```bash
sudo dnf install -y python3 python3-pip
```

### Arch

```bash
sudo pacman -S --needed python
```

### macOS

```bash
brew install python
```

---

## Install (recommended: the script)

From the repository folder:

```bash
./install.sh
```

The installer will:

1. Create the venv at `~/.local/share/getytcc/venv`.
2. Install `youtube-transcript-api` into it.
3. Copy the `getytcc` script to `~/bin/getytcc` and rewrite its shebang to the
   venv's Python.
4. Tell you whether `~/bin` is on your `PATH`, and how to add it if not.

Re-running `./install.sh` is safe — it upgrades the dependency and refreshes
the command.

### Install somewhere other than `~/bin`

```bash
PREFIX="$HOME/.local/bin" ./install.sh
```

---

## Put `~/bin` on your PATH (if it isn't already)

If the installer warns that `~/bin` is not on your `PATH`, add it:

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Using zsh? Use `~/.zshrc` instead of `~/.bashrc`.

Check it worked:

```bash
command -v getytcc     # should print /home/<you>/bin/getytcc
```

---

## Manual install (no script)

If you'd rather do it by hand — or need to see exactly what the script does:

```bash
# 1. Create the venv and install the dependency
python3 -m venv ~/.local/share/getytcc/venv
~/.local/share/getytcc/venv/bin/python3 -m pip install --upgrade pip
~/.local/share/getytcc/venv/bin/python3 -m pip install youtube-transcript-api

# 2. Install the command with a shebang pointing at that venv
mkdir -p ~/bin
{ echo "#!$HOME/.local/share/getytcc/venv/bin/python3"; tail -n +2 getytcc; } > ~/bin/getytcc
chmod +x ~/bin/getytcc
```

---

## Verify

```bash
getytcc --help
```

Then try a real video:

```bash
cd /path/to/where/you/want/the/files
getytcc "https://www.youtube.com/watch?v=RCSSgxV9qNw"
```

You should get two files in the current folder:

```
<sanitized-title>_<videoId>.txt
<sanitized-title>_<videoId>.srt
```

---

## Usage

```
getytcc <youtube video url> [-l en,de] [-o DIR] [--txt-only | --srt-only]
```

| Flag | Meaning |
| --- | --- |
| `-l`, `--lang` | Comma-separated language preference (default `en,en-US,en-GB`). Falls back to the first available transcript. |
| `-o`, `--outdir` | Directory to write into (default: current folder). |
| `--txt-only` | Write only the `.txt`. |
| `--srt-only` | Write only the `.srt`. |

Accepted URL forms: `watch?v=…`, `youtu.be/…`, `/shorts/…`, `/embed/…`,
`/live/…` on any YouTube host.

---

## Troubleshooting

| Symptom | Fix |
| --- | --- |
| `ERROR: no python3 with the 'venv' module was found.` | Install it: `sudo apt install -y python3-venv` (Debian/Kali/Ubuntu). |
| `getytcc: command not found` | `~/bin` isn't on your `PATH` — see the PATH section above, or run it with the full path `~/bin/getytcc`. |
| `ERROR: youtube-transcript-api is not installed.` | The command's shebang isn't pointing at the venv. Re-run `./install.sh`. |
| `Could not retrieve a transcript…` | The video has no captions available, or they're disabled. Try `-l` with another language code. |
| YouTube blocks/ratelimits requests | YouTube occasionally throttles transcript fetches from cloud/VPN IPs. Retry later or from a residential connection. |

---

## Uninstall

```bash
rm -f ~/bin/getytcc
rm -rf ~/.local/share/getytcc
```
