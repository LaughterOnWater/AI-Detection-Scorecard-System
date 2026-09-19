# 🧠 AI-Detection Scorecard System

A rubric for judging a piece of writing or a talking-head video on **five
independent axes** — *who wrote it*, *how good the writing is*, *how well it's
produced*, *whether it deserved to exist*, and *whether it's honest about what
it is* — without collapsing them into one misleading number. Ships with `getytcc`, a small tool for pulling the
YouTube transcripts you score.

> **The core idea:** "AI-generated" and "bad" are different questions, and
> conflating them produces junk verdicts. Sloppy ≠ synthetic. A human can write
> garbage; an AI can write cleanly. So the system scores authorship and craft
> on **separate axes**, with a gate between them.

---

## The five axes

| Axis | Name | Range | What it answers |
| --- | --- | --- | --- |
| **A** | **Provenance** | 1–10 · Human → AI | *Who wrote it?* Judged **first**, from authorship signals only. Low = Human, high = AI — **neither pole is inherently "good."** |
| **B** | **Craft & Rigor** | 1–10 · bad → good | *Is it any good, relative to its genre?* Where prose tells, sourcing, and derivativeness live — as **quality** feedback, not authorship evidence. |
| **E** | **Presentation & Production** | 1–10 · bad → good | *Is the finished video well made?* The audiovisual execution — visuals, delivered narration, on-screen text — scored separately from the writing. A **standing** score like A and B, but assessable **only from watching** (omitted on a transcript-only grade) and scored as a **holistic impression**, not a tally. Its floor (**1–2, broken**) can take the headline when no graver axis fired. |
| **C** | **Net Value** | 0 → −10 | *Did it deserve to exist?* Printed **only when negative** — a pure relay that leaves the viewer no better off than reading its own sources. When it fires it becomes the headline verdict (unless Axis D also fired). |
| **D** | **Influence Gaming** | 0 → −10 · *opinion* | *Is it honest about what it is?* Printed **only when negative** — promotion wearing an independent creator's clothes, built to borrow the trust real creators earn and to game the systems that reward it. An explicitly labeled **opinion** ("this comes across to me as…"), grounded in named signals but never asserting payment, ownership, or coordination as fact. When it fires it **leads the verdict, above Axis C**. |

Always print the pole label next to the number, e.g.:

```
Provenance 2/10 (Human) · Craft 7.5/10 (good) · Production 3/10 (poor)
```

The axes run in **different directions** — Axis A is a *classification*
(low = Human), while Axes B and E are *quality* scores (high = good). That trips
people up; label every number. Axes **C and D are conditional** — computed but
printed only when they go below zero, and most scorecards show neither — and
**Axis E prints only on a card where the grader actually watched the video.**

### Key gates

- **The Gate** — once Axis A lands confidently on "human," stylistic tells stop
  counting as authorship evidence and drop to Axis-B craft notes.
- **Embodiment Gate (v2.4)** — a transcript-only grader can't prove a real
  person did embodied, real-time work. Default is `UNVERIFIED`, which caps the
  human pole at **2**; a **1** requires outside corroboration.
- **Delivery-Medium Gate (v2.5)** — an AI avatar or TTS voicing a script is
  authorship-neutral. Attested synthetic narration is scored as *written prose*.
- **Companion-Source rule (v2.5, extended v2.6)** — before calling a claim "fog,"
  look for the paper, repo, or notes the piece distills — including an earlier
  episode in a creator's series — and score the substance against it.
- **AI Art / Generative Media (v2.6)** — for *disclosed* generative work (an AI
  music video, image series, or short film), a high-AI Provenance **describes the
  collaboration rather than grading it**; Axis B is judged on artistic craft with
  the categories reinterpreted, and a **narrative-vs-tableau ceiling** separates a
  moving mood-piece from a story actually told in image and song.
- **Influence Gaming Gate (v2.10)** — Axis D. Fires when a piece advances a
  commercial or ideological interest while disguising that function behind an
  independent-creator posture, and it reads that way to the grader. The **trigger
  is the disguise, not the promotion** — disclosed sponsorship and openly-branded
  channels are spared. It is a labeled **opinion**, so payment, ownership, and
  coordination are named as impressions, never asserted as fact.
- **Automation Gate (v2.11)** — the mirror of the Embodiment Gate at the AI pole.
  A **10** (a fully-automated artifact, no human hand anywhere) is a claim a
  transcript can't license, so text alone caps the AI pole at **9.5**; reaching 10
  needs Automation Confirmation from outside the text, and it stays rebuttable.
- **Firehose Ceiling (v2.12)** — an Axis-B craft ceiling for an explainer that
  maximises claim throughput and never dwells: accurate, even synthesising, yet
  leaving nothing to hold. Names *false authority by volume* (the Gish-gallop
  asymmetry); routed through Value-Add, a ceiling not a floor.
- **Presentation & Production (v2.13)** — Axis E (above). Scores the audiovisual
  execution as a holistic viewing impression; its **1–2 "broken"** floor (mangled
  imagery, wrong-script or gibberish on-screen text, botched delivery, no
  continuity) can headline as **"Badly Produced"** when no graver axis fired.

The full rubric, scoring dials, worked examples, and the fill-in template live
in **[AI-Detection-Scorecard-System.md](AI-Detection-Scorecard-System.md)** (the
current version is stated inside the file; it is **v2.13** as of this writing).

---

## `getytcc` — transcript fetcher

Scoring a video starts with its files. By default `getytcc` fetches **both** of
them into the current folder: a timestamped `.srt` and the video's full
description. Pure Python, one dependency, isolated in its own virtual environment.

```bash
getytcc "https://www.youtube.com/watch?v=RCSSgxV9qNw"
# → <title>_<videoId>.srt              (timestamps for line references)
# → <title>_<videoId>_DESCRIPTION.txt  (the full description, for the gates)
```

The `.srt` timestamps make it easy to give a line reference for every claim, as
the rubric requires. The description is read from the same source as the
captions (no manual copy), and an existing `_DESCRIPTION.txt` is never
overwritten — so run `getytcc` first, then add any grader notes inside it.

> **Want just one file?** `getytcc --only-srt "<url>"` writes only the `.srt`;
> `--only-desc` only the description; `--only-txt` the clean no-timestamp text.
> (The older `--srt-only` / `--txt-only` still work.)

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
├── AI-Detection-Scorecard-System.md       ← the rubric (the main artifact; version inside)
├── getytcc                                ← the transcript-fetcher script
├── install.sh                             ← installs getytcc + its venv
├── requirements.txt                       ← getytcc's one dependency
└── docs/
    └── INSTALL-getytcc.md                 ← full install & usage guide
```

---

## Typical workflow

1. **Fetch the files:** `getytcc "<youtube-url>"` → a timestamped `<title>_<id>.srt`
   **and** the full `<title>_<id>_DESCRIPTION.txt`, in one call. Keep each video's
   files in their own folder (e.g. `cc/NY-rats/`). The description feeds the
   Companion-Source rule, the Embodiment Gate, and the Delivery-Medium Gate — the
   gates that keep well-sourced, human-led work from being wrongly convicted.
2. **Add any notes (optional):** drop a grader note inside `_DESCRIPTION.txt` after
   fetching — what you know about the delivery medium, an attestation, a hunch.
   `getytcc` won't overwrite the file, so run it first, then annotate.
3. **Hand it to a trusted AI:** give Claude (or another trusted assistant) the
   rubric — [AI-Detection-Scorecard-System.md](AI-Detection-Scorecard-System.md) —
   plus the video's folder, and ask it to score using that system. It scores
   **Axis A first**, applies the gates, then **Axis B** (plus its production
   companion **Axis E** when the video was watched), then runs the Net-Value
   relay test for Axis C and the Influence-Gaming check for Axis D, giving a
   timestamp/line reference (from the `.srt`) for every claim.
4. **Save the scorecard** as `<title>_<id>_SCORE.txt` in the same folder — plain
   text, because the output is designed to paste straight into a YouTube comment.

> **Tell the scorer what you know.** In your prompt, say whether the video is a
> **real person speaking, an AI voice, or an AI avatar** — this keeps an AI voice
> from being mistaken for AI *writing* (a different thing). And if you know a real
> person actually did the work shown, say **how you know it** — you watched it, or
> someone who'd know vouches for it. A plain "trust me, it's real" can't be fully
> confirmed; the scorer needs a source.

### File naming convention

Reuse the exact `<title>_<id>` base that `getytcc` produces, so every artifact
for one video sorts together in the folder:

| File | Source |
| --- | --- |
| `<title>_<id>.srt` | subtitles / timestamps (getytcc, default) |
| `<title>_<id>_DESCRIPTION.txt` | the video description (getytcc, default; you may annotate) |
| `<title>_<id>.txt` | clean no-timestamp transcript (getytcc `--only-txt`) |
| `<title>_<id>_SCORE.txt` | the finished scorecard (the AI writes it) |

---

## License

[MIT](LICENSE) © [@LaughterOnWater](https://github.com/LaughterOnWater)
