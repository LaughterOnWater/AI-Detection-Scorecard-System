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

1. Fetch the transcript: `getytcc "<youtube-url>"`.
2. Open the rubric and copy the template at the bottom of
   [AI-Detection-Scorecard-System-V2.5.md](AI-Detection-Scorecard-System-V2.5.md).
3. Score **Axis A first**, then apply the gates, then **Axis B**, then run the
   Net-Value relay test for Axis C.
4. Give a timestamp or line reference (from the `.srt`) for every claim.
5. Report all scores and a one-line verdict.

---

## License

[MIT](LICENSE) © [@LaughterOnWater](https://github.com/LaughterOnWater)
