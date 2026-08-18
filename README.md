# 🧠 AI-Detection Scorecard System

A rubric for judging a piece of writing or a talking-head video on **three
independent axes** — *who wrote it*, *how good it is*, and *whether it deserved
to exist* — without collapsing them into one misleading number. Ships with
`getytcc`, a small tool for pulling the YouTube transcripts you score.

> **The core idea:** "AI-generated" and "bad" are different questions, and
> conflating them produces junk verdicts. Sloppy ≠ synthetic. A human can write
> garbage; an AI can write cleanly. So the system scores authorship and craft
> on **separate axes**, with a gate between them.

---

## The three axes

| Axis | Name | Range | What it answers |
| --- | --- | --- | --- |
| **A** | **Provenance** | 1–10 · Human → AI | *Who wrote it?* Judged **first**, from authorship signals only. Low = Human, high = AI — **neither pole is inherently "good."** |
| **B** | **Craft & Rigor** | 0–10 · bad → good | *Is it any good, relative to its genre?* Where prose tells, sourcing, and derivativeness live — as **quality** feedback, not authorship evidence. |
| **C** | **Net Value** | 0 → −10 | *Did it deserve to exist?* Printed **only when negative** — a pure relay that leaves the viewer no better off than reading its own sources. When it fires, it becomes the headline verdict. |

Always print the pole label next to the number, e.g.:

```
Provenance 2/10 (Human) · Craft 7.5/10 (good)
```

The two axes run in **opposite directions** — Axis A is a *classification*
(low = Human), Axis B is a *quality* score (high = good). That trips people up;
label every number.

### Key gates (v2.5)

- **The Gate** — once Axis A lands confidently on "human," stylistic tells stop
  counting as authorship evidence and drop to Axis-B craft notes.
- **Embodiment Gate (v2.4)** — a transcript-only grader can't prove a real
  person did embodied, real-time work. Default is `UNVERIFIED`, which caps the
  human pole at **2**; a **1** requires outside corroboration.
- **Delivery-Medium Gate (v2.5)** — an AI avatar or TTS voicing a script is
  authorship-neutral. Attested synthetic narration is scored as *written prose*.
- **Companion-Source rule (v2.5)** — before calling a claim "fog," look for the
  paper, repo, or notes the piece distills, and score the substance against it.

The full rubric, scoring dials, worked examples, and the fill-in template live
in **[AI-Detection-Scorecard-System-V2.5.md](AI-Detection-Scorecard-System-V2.5.md)**.

---

## `getytcc` — transcript fetcher

Scoring a video starts with its transcript. `getytcc` fetches a YouTube video's
closed captions into the current folder as a clean `.txt` and a timestamped
`.srt`. Pure Python, one dependency, isolated in its own virtual environment.

```bash
getytcc "https://www.youtube.com/watch?v=RCSSgxV9qNw"
# → <title>_<videoId>.txt   (clean text for scoring)
# → <title>_<videoId>.srt   (timestamps for line references)
```

The `.srt` timestamps make it easy to give a line reference for every claim, as
the rubric requires.

> **Just want the subtitles?** `getytcc --srt-only "<url>"` writes only the
> `.srt` and skips the `.txt`. (Use `--txt-only` for the reverse.)

### Install

There is **one required setup step** — a dedicated venv with
`youtube-transcript-api`. The installer handles it:

```bash
./install.sh
```

Works on **WSL2 Kali Linux** and any other Unix/Linux system. Full instructions,
prerequisites, manual install, and troubleshooting are in
**[docs/INSTALL-getytcc.md](docs/INSTALL-getytcc.md)**.

---

## Repository layout

```
.
├── README.md                              ← you are here
├── AI-Detection-Scorecard-System-V2.5.md  ← the rubric (the main artifact)
├── getytcc                                ← the transcript-fetcher script
├── install.sh                             ← installs getytcc + its venv
├── requirements.txt                       ← getytcc's one dependency
└── docs/
    └── INSTALL-getytcc.md                 ← full install & usage guide
```

---

## Typical workflow

1. **Fetch the transcript:** `getytcc "<youtube-url>"` → `<title>_<id>.txt`
   (and a timestamped `.srt`).
2. **Capture the description:** open the YouTube video's description and copy the
   parts that matter for scoring — companion-source links (paper, repo, dataset,
   notes), any reviewer/user **attestation** of hands-on work, and any "AI voice /
   synthetic narration" **disclosure** — into a sibling file
   `<title>_<id>_DESCRIPTION.txt`. This isn't busywork: the Companion-Source rule,
   the Embodiment Gate, and the Delivery-Medium Gate all read the description, and
   **without it those gates can't fire** — well-sourced, human-led work can get
   wrongly convicted as AI slop.
3. **Hand it to a trusted AI:** give Claude (or another trusted assistant) the
   rubric — [AI-Detection-Scorecard-System-V2.5.md](AI-Detection-Scorecard-System-V2.5.md) —
   plus the transcript and description files, and ask it to score the content
   using that system. It scores **Axis A first**, applies the gates, then **Axis B**,
   then runs the Net-Value relay test for Axis C, giving a timestamp/line reference
   (from the `.srt`) for every claim.
4. **Save the scorecard** as `<title>_<id>_SCORE.txt` — plain text, because the
   output is designed to paste straight into a YouTube comment.

### File naming convention

Reuse the exact `<title>_<id>` base that `getytcc` produces, so every artifact
for one video sorts together in the folder:

| File | Source |
| --- | --- |
| `<title>_<id>.txt` | transcript (getytcc) |
| `<title>_<id>.srt` | subtitles / timestamps (getytcc) |
| `<title>_<id>_DESCRIPTION.txt` | the video description (you paste it) |
| `<title>_<id>_SCORE.txt` | the finished scorecard (the AI writes it) |

---

## License

[MIT](LICENSE) © [@LaughterOnWater](https://github.com/LaughterOnWater)
