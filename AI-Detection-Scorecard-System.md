# 🧠 AI-DETECTION SCORECARD SYSTEM v2.13

## What This Is

An AI-detection scorecard: a rubric for judging a piece of writing — or a talking-head video's transcript — on **five independent axes**, kept deliberately apart so one number never has to answer two different questions.

The mistake it exists to prevent is collapsing *who wrote it* and *whether it's any good* into a single "AI score." Those are different questions. The stylistic tells people treat as proof of AI — blandifiers, vague attribution, assert-without-mechanism — are *correlated* with AI, not *exclusive* to it; humans talking off the cuff do all of them. Once strong human signals are present (a named person, first-person ownership, spoken self-correction), counting those same tells toward an "AI score" is double-counting. **Sloppy ≠ synthetic.** A human can write garbage; an AI can write cleanly. And whether the author did original work or summarized someone else's is a *genre and value* judgment, not an authorship one — folding it into provenance punishes every honest explainer.

So the scorecard splits the work into five axes, with a gate between the first two:

- **Axis A — Provenance (who wrote it):** Human ↔ AI, judged **first**, from authorship signals only.
- **Axis B — Craft & Rigor (how good it is):** quality relative to genre — where prose tells, sourcing, and derivativeness live, as craft feedback rather than authorship evidence.
- **Axis E — Presentation & Production (is the finished artifact well made?):** a standing quality score like Craft, but for the *audiovisual execution* — the visuals, the narration as delivered, the on-screen text. Assessable only from watching the video (a transcript cannot license it) and scored as a holistic impression, not a per-moment tally; its floor (1–2, "broken") can take the headline when no graver axis fired.
- **Axis C — Net Value (did it deserve to exist):** conditional; runs 0 → −10 and prints only when negative, for a piece that merely relays what its own sources already say.
- **Axis D — Influence Gaming (is it honest about what it is):** conditional; runs 0 → −10 and prints only when negative, for a piece that reads as promotion wearing an independent creator's clothes. Unlike A–C it is an explicitly labeled **opinion** ("this comes across to me as…"). When it fires it leads the verdict, above Axis C.

Axes C and D are the two conditional, negative-only axes: you compute them but print them only when they go below zero, and most scorecards show neither. Axis E is a standing quality score like A and B, but it prints only on a card where the grader actually watched the video (a transcript cannot license it).

**The axes run in different directions — this trips people up.** Axis A is a *classification* (low = Human, high = AI; **neither pole is inherently "good"**). Axes B and E are *quality* scores (**high = good, low = bad**). Always print the pole label next to the number, e.g. `Provenance 2/10 (Human) · Craft 7.5/10 (good) · Production 3/10 (poor)`.

The Gate is the core move: once Axis A lands confidently on "human," the stylistic tells stop counting toward authorship and become Axis-B craft notes only. Report the axes separately; never collapse them into one number.

---

## How to Use

**Inputs (recommended workflow).** Run `getytcc <url>`, which now writes **both** files the scorer needs in one call: the timestamped `<title>_<id>.srt` and the video's full description as `<title>_<id>_DESCRIPTION.txt` (pulled from the same source as the captions — there is no longer a manual copy step). Keep each video's files in **their own folder** under `cc/` (e.g. `cc/NY-rats/`) so you can point the scorer at the folder instead of naming every file. If you want to leave a grader note (what you know about the delivery medium, an attestation, a hunch), add it **inside** the `_DESCRIPTION.txt` **after** fetching — `getytcc` will not overwrite an existing description file, so run it first, then annotate. Because the description now arrives whole, it already carries the signals the Companion-Source rule (v2.5), the Embodiment Gate (v2.4), and the Delivery-Medium Gate (v2.5) read; the scorer applies the usual Platform Exclusions to the promo/affiliate boilerplate around them. Then hand the scoring agent (Claude or another trusted AI) **this rubric plus the folder** and ask it to score using the system below. In your prompt, also say what you know directly: whether the video is a **real person speaking, an AI voice, or an AI avatar**, and — if you know a real person did the work shown — **how you know it** (you watched it, or someone who'd know vouches). Naming the delivery medium keeps an AI voice from being misread as AI *authorship*; an unbacked "trust me, it's real" stays UNVERIFIED and cannot earn a Provenance of 1.

1. Copy the template at the bottom. Fill in title, date, platform, and **genre** (see Genre Calibration).
2. **EXCLUDE platform-generated elements** (YouTube chapters, timestamps, auto-captions).
3. **IGNORE caption transcription errors** (misspelled names, garbled technical terms). Assess the *intended* wording.
4. **Score Axis A (Provenance) first**, using only the Provenance Signals. Record the delivery medium (Delivery-Medium Gate, v2.5) — attested synthetic narration is scored as written prose, so spoken-voice signals do not apply.
5. **Apply the Gate via the Two-Layer Read** (v2.9 — measure the AI-structural scaffold and the human hand independently, then compare; the gates are its regions), then the **Provenance Floor Gate** (v2.2), then the **Embodiment Gate** (v2.4), and the **Automation Gate** (v2.11). Decide whether the stylistic tells count toward Axis A or drop to Axis B; if the prose is structural AI with no human voice, floor Provenance at 9.5; and remember a score of 1 requires confirmation the work is a real person's embodied, real-time effort — default UNVERIFIED caps the human pole at 2. Its mirror at the AI pole: a score of 10 requires Automation Confirmation that no human hand touched any part of the artifact — default UNCONFIRMED caps the AI pole at 9.5.
6. **Score Axis B (Craft & Rigor)**, calibrated to the genre, then **apply the Prose-Revision Penalty Gate** (v2.1) to cap the Craft total if tell density is high, and the **Firehose Ceiling** (v2.12) to cap it if the piece skims breadth without depth (Final Craft = min of the raw total and every cap that fired). If you watched the video (or have an AV attestation), also score **Axis E — Presentation & Production** (v2.13): a holistic 1–10 impression of the visuals, the delivered narration, and the on-screen text; omit it on a transcript-only grade. Before scoring Sourcing, check for companion sources (Companion-Source rule, v2.5) — including an earlier episode in a series (v2.6) — not just the description. **If the genre is AI Art / Generative Media, use the dedicated "Scoring AI Art" section (v2.6) instead of the default reads: reinterpret the categories for the form and do NOT fire the prose gates or Cheat-Sheet tells on lyrics/visuals.**
7. **Apply the Net Value Gate (v2.3):** run the relay test — can you name and quote one thing the piece adds beyond its (available) sources? If yes, leave Axis C unscored. If no, the piece is a pure relay; score Axis C — Net Value — as a negative number using the severity dials, and let it become the headline verdict.
8. **Apply the Influence Gaming Gate (v2.10):** does the piece advance a specific commercial or ideological interest while disguising that function behind an independent-creator posture, and does it come across to you (or to the person requesting the score) as manufactured authenticity? If not, leave Axis D unscored. If so, score Axis D — Influence Gaming — as a negative number using the severity dials, **stated as an opinion and grounded in named signals**, and let it become the headline verdict (above Axis C if both fired). Never assert payment, ownership, or coordination as fact.
9. Provide a timestamp or line reference for every claim.
10. Report all scores (Axes C and D only if they fired) and a one-line verdict. Add the challenge to the creator.
11. **Save the finished scorecard** as a sibling file named `<title>_<id>_SCORE.txt`, reusing the exact `<title>_<id>` base from the transcript so all of a video's files sort together. Keep it **plain text** — the template output is designed to paste directly as a YouTube comment (see OUTPUT FORMAT below), so do not save it as markdown.

---

## Platform Exclusions

**DO NOT COUNT AGAINST THE CONTENT:**

| Element                         | Reason                                                    |
| ------------------------------- | --------------------------------------------------------- |
| YouTube chapter headers         | Auto-generated from timestamps, not the creator's prose   |
| Timestamp markers               | Platform requirement, not writing choice                  |
| Auto-generated captions         | Not the creator's wording                                 |
| Auto-caption misspellings       | Speech-to-text errors (e.g., "Entropic" instead of "Anthropic") |
| Truncated description URLs (`...`) | YouTube display artifact — the platform shortens shown links to deter scraping. If the source is named and datable, treat the link as real; do NOT ding Sourcing for the ellipsis. |
| Video description *boilerplate*  | Platform template / promo copy, not original content     |
| "Subscribe" buttons/end screens | Platform mechanics                                        |
| Intro/outro music               | Not writing                                               |

**ONLY COUNT THE ACTUAL SPOKEN/WRITTEN PROSE. IGNORE TRANSCRIPTION ERRORS.**

**BUT — creator-authored material is NOT boilerplate, even when it lives in the description.** Source links, citations, references, and notes the creator deliberately added **DO count** — toward **Axis B → Sourcing & Transparency**. A primary-source link in the description is a real citation; do not penalize a creator for "not naming sources" when the sources are linked below the video. Exclude only genuine platform template text (the channel's stock promo blurb, affiliate boilerplate, hashtag spam). When scoring Transparency, check the description before concluding a claim is attributed to fog.

**Companion sources count too (v2.5 — generalizing the description check).** A short piece is often the visible tip of deeper sourced work. Before scoring any claim as fog or any statistic as "floating," look beyond the piece itself for a companion source the creator produced or that the piece explicitly explains: a linked paper, a repo, a position document, show notes, a pinned comment. If such a source is provided (or attested, or reasonably findable) and the substance is genuinely sourced there, score the sourcing against it — the claims are traceable, not fog. What remains is a *transparency* shortfall: the piece did not surface its sources at the point of viewing. Dock Sourcing & Transparency partially for that packaging gap, but do not classify well-sourced-elsewhere claims as unsourced. Guardrail: do not invent a companion source. Absent one that is provided or genuinely available, floating stats stay floating.

**Series and prior-episode sources (v2.6 — the companion can be an earlier video).** When a piece is an explicit followup in a creator's series, the companion source often lives in an earlier episode: the setup video that documents the rig, the model, the harness, or the baseline runs this one builds on. A followup that points back to where it established its method ("same harness as last time," a named or linked prior video, a channel that plainly runs this as an ongoing series) has traceable substance — do NOT ding it for "missing sources" it already published earlier in the series. What remains is the same transparency/packaging shortfall: this episode did not re-surface the links for a first-time viewer, so dock Sourcing lightly for that, not for absence. Same guardrail: the prior-episode source must genuinely exist and be findable, not merely gestured at. And keep the distinction sharp — a description padded with promo, course, and cross-sell links is not sourcing; the credit is for the earlier episode that actually documents the method, not for the act of linking to oneself.

---

## Genre Calibration (set this before scoring Axis B)

Axis B is judged against what the genre can reasonably deliver. "No original testing" is a fatal flaw for a review and a non-issue for an explainer.

| Genre | What rigor looks like | What is NOT a defect |
| ----- | --------------------- | -------------------- |
| **Explainer / News** | Accurate synthesis, named primary sources, useful framing/analogies, clear caveats on what's unknown | Absence of original testing — especially when the subject is untestable (not yet released, no tooling) |
| **Review / Hands-on** | Firsthand use, reproducible results, screenshots/terminals, failures shown | Reliance on marketing numbers, no artifacts shown → this IS a defect here |
| **Original Research / Essay** | A thesis, evidence the author gathered, a traceable argument | — |
| **Tutorial / How-to** | Correct, runnable steps; stated prerequisites | Lack of opinion or novelty |
| **AI Art / Generative Media** | Disclosed tools, a human-authored layer (lyrics/script/storyboard), a coherent directed aesthetic, and — where a story is claimed — narrative told through both image and song | Being AI-generated (that is the genre, not a defect); absence of live human performance. See "Scoring AI Art" below. |

Name the genre in the scorecard header. If content mixes genres, score Axis B against the genre it is *claiming* to be.

---

## Scoring AI Art / Generative Media (v2.6)

Some work is openly, wholly built with generative tools — an AI music video, an AI image series, an AI short film — and presented as such. The two-axis machine was built for analytical prose and misfires here in two ways this section corrects. (Do not confuse this with the *undisclosed* case: work that hides the machine is still scored normally, and the transparency failure counts against it.)

**1. For disclosed AI art, a high-AI Provenance score is descriptive, not damning.** Axis A still reports the human/AI mix, but the usual moral valence drops away: the whole point of the genre is human+AI collaboration, and a piece that says so is being honest, not caught. Score the mix on the merits — human-authored layers (lyrics, script, storyboard, the curatorial eye) pull toward the human pole; AI-generated layers (voice, music, image, motion) pull toward the AI pole — and print the number with a one-line reminder that, for this genre, it *labels the collaboration rather than grading it*. The Provenance Floor Gate does not apply to song lyrics or other art forms; its structural-tell measure is a prose instrument. The Delivery-Medium Gate does the heavy lifting instead: an AI singing voice or narrator is authorship-neutral, so human-written words delivered by an AI voice are still human-written.
  - Worked anchor: human-written lyrics + human creative direction, executed through AI music/voice/visuals (all disclosed), lands around **4 — hybrid, leaning to a human-authored concept realized through AI.** Fully AI-generated words *and* execution with only prompt-level human input sits higher; a live-sung human vocal over AI backing sits lower.

**2. Axis B is judged on artistic craft, with the analytical categories reinterpreted — never mechanically applied.** The Prose-Revision Penalty Gate and the Cheat-Sheet tells are prose instruments and do NOT fire on lyrics, images, or motion. Reinterpret the five categories for the form, and say so in each note:
  - **Sourcing & Transparency → tool disclosure & authorship attribution.** Naming every generative tool and stating what the human wrote or directed is this genre's version of citation. Full disclosure scores high; hiding the machine scores low.
  - **Accuracy & Mechanism → does the artifact deliver what it claims** — a directed, coherent piece, not a pile of unrelated generations.
  - **Specificity → concreteness of image and craft** — particular, chosen imagery over generic uplift; a held aesthetic over chance.
  - **Value-Add → original artistic contribution** — the human layers built on top of the tools.
  - **Prose Craft → lyrical / compositional / audiovisual craft.**

**The narrative-vs-tableau ceiling.** The most common thing separating a strong AI music video from a top one is *story*. Compelling visuals that set a mood — beautiful figures moving through beautiful environments — make a **tableau**, and a tableau emotes; it does not narrate. When the song carries an actual arc (a beginning, a turn, a resolution) and the imagery only accompanies its feeling rather than dramatizing its events, cap the audiovisual-craft category short of the top and route the reason through Value-Add. This is a ceiling, not a floor: a beautifully made tableau still scores well (an 8 is a strong result), it just does not reach 9–10 while the pictures share only the feeling. **Genre exception:** a piece whose form *is* the mood — a dance video, a visualizer, an ambient loop — earns the tableau outright and is not docked for it. The test is whether the work is *claiming* to tell a story (lyrics with a plot, a titled narrative) and leaning on the pictures to carry only the feeling of it.

Axis C (Net Value) almost never fires on original art — a made song is the opposite of a relay. Do not fish for it here.

---

# AXIS A — PROVENANCE (Human ↔ AI)

**Question:** Who produced this text?

## Provenance Rubric

**Direction: a CLASSIFICATION, not a quality score. Low = Human · High = AI. Neither pole is "good."**

| Score | Meaning |
| ----- | ------- |
| 1     | Confirmed human. A real person is verified — from outside the text — to have produced the work through embodied, real-time effort. Requires Embodiment Confirmation (see the Embodiment Gate); unreachable on transcript evidence alone. |
| 2     | Textually human. Strong, hard-to-fake human signals dominate the words, but authorship is asserted from the text alone. The lowest a transcript-only grader may assign without out-of-band confirmation. |
| 3–4   | Human with light AI assistance (outline, grammar, tightening). Voice is still the person's. |
| 5–6   | Genuinely ambiguous / hybrid. Signals mixed. This is the band where stylistic tells legitimately count. |
| 7–8   | Mostly AI. Structural AI signals dominate; human touch limited to light editing. |
| 9–10  | Raw AI output. Little or no editing. 9.5 is the transcript-only ceiling; 10 requires Automation Confirmation (see the Automation Gate) that no human editorial hand touched any part of the artifact — unreachable on transcript evidence alone. |

## Provenance Signals

Score these **first**, before touching the Tell Cheat Sheet.

### Strong human signals — genuine voice, NOT mere first-person (v2.9.3)

**Classify tells first, and register-blind.** Before any sentence can count as a human signal it must survive the tell sweep (the Prose-Revision Penalty Gate's fixed set). A sentence that carries a structural tell CANNOT also be a human signal, and first-person register buys no exemption. The discriminator is **form, not person**: a profundity beat phrased "the line I trust most because it cost them something to say" is a profundity beat — it counts toward tell density like any other, and the "I" is a disguise, not a credit. Modern models emit owned opinion, anecdote, self-correction, and self-authored analogy natively; it is the default costume of a script told to "sound human." So the *presence* of first-person is near-zero evidence of a human author, and against a regular scaffold it corroborates AI rather than rebutting it.

A surviving (tell-free) line counts as genuine human voice only if it clears ONE bar:
- **Separable from the scaffold** — it leaves a seam: a register break, friction, a tangent the machine structure did not want. A real edit reads as *inserted into* the draft, not *generated with* it. Smooth, on-theme, equally-polished first-person is scaffold, not hand.
- **Checkable lived specificity** — idiosyncratic, verifiable detail a model could not get from the sources ("it crashed three times before it worked, on my 2019 laptop"). Checkable is not verified: it still caps at 2 without Embodiment Confirmation.

The markers that CAN clear those bars (then weighed pervasive vs. localized, per the Two-Layer Read) — each shown in its genuine, plainly-stated form, not its beat-dressed imitation:
- Spoken disfluency and self-correction ("the die will look... where right now we're just using pi as an example").
- First-person ownership of opinions with a personal stake ("I probably wouldn't advise people to switch").
- A specific, named identity and bio; personal anecdote.
- Register that drifts naturally; asides; conversational repair.
- Idiosyncratic, self-authored analogies introduced as the speaker's own ("is how I like to describe it").
- Natural contractions in a spoken or casual register ("doesn't," "you'd," "it's") — the sound of someone actually talking rather than reading a page aloud.
- **Embodied, real-time interaction with live software** — reacting to a UI as it renders, interrupting a running job, waiting out slow local generation, operating tools (a terminal, Blender, Godot) across a session, and calibrating against a body of prior work. NOTE (v2.4): from transcript alone these are only *narrated* and carry moderate weight — a script can describe them. They become strong, and can help unlock a 1, only under Embodiment Confirmation. This is NOT the de-credited "research/curation" signal below: that is desk work a model matches natively; this is costly real-time behavior a model cannot perform, only claim.

### NOT authorship signals (v2.2 — do NOT credit these as "human")
- **Research, sourcing, and curation** — finding primary sources, citing them, mapping claims to them, disavowing aggregators. AI does all of this natively.
- **Finding or articulating theoretical, mathematical, or conceptual distinctions** — catching a sign convention, disambiguating two estimates, steel-manning a counterargument. Current AI is as good as or better than most humans at this. It is NOT evidence of a human author.
- **Generic first-person accountability copy** — "I checked every source," "I will pin corrections." A model produces this on request. First-person in **profundity-beat form** ("the line I trust most because it cost them something to say") is a tell, not a credit: it counts toward tell density (v2.9.3). Only plainly-stated first-person with a *personal stake or lived specificity*, that survives the tell sweep and is separable or checkable, counts (see Strong human signals).

Good research means the *work* is good (that is Axis B). It says nothing about *who wrote the sentences* (Axis A). Do not launder substance into a human-provenance verdict — that was the mistake v2.2 closes.

### Strong AI signals (structural — hard to produce unconsciously)
- The colon-label header formula repeated at every level.
- Stacked rules-of-three / padded comprehensive lists as a habit.
- Mechanically balanced structure ("On the one hand… on the other hand…") with frictionless seams.
- Quote-introduce-a-term-then-explain-its-significance as a recurring pattern.
- Uniform paragraph shape and even em-dash cadence throughout.
- **No contractions in spoken/conversational content** — "does not / do not / will not / it is / here is" all the way through a script meant to be read aloud, where a speaker would say doesn't, don't, won't, it's, here's. People contract constantly when they talk; formal prose read verbatim does not. Beyond pointing at AI, the total absence is a *revision* tell: the writer never worked the draft toward how a person actually speaks.
  - Genre caveat: a deliberately formal essay may drop contractions by style, so weigh this only where a natural speaking voice is expected — narration, vlog, casual explainer — not a legal or academic register. Possessive apostrophes like "METR's" are not contractions; don't count them.
  - Delivery caveat (v2.5): if delivery is attested synthetic (an AI avatar or TTS), this signal is recalibrated to the written register and does not apply as speech — see the Delivery-Medium Gate.
  - **Co-occurrence gate (mechanical):** contraction-absence only counts when it travels with other tells. Measure structural tell density the same way the Prose-Revision Penalty Gate does — structural tells ÷ non-data sentences. **If that density is under ~10%, treat contraction-absence as an intentional register choice, not evidence: it does NOT move Provenance.** At 10% or above, it may corroborate the structural signals (it never leads on its own). Below the floor, the missing contractions are more likely discipline than a tell — Simplified Technical English (STE), writing for an international or ESL audience, accessibility and readability passes, and evergreen instructional or science content all drop contractions on purpose, for clarity and cleaner machine translation.

### Weak signals (BOTH humans and AI do these)
Blandifiers, throat-clearing, vague assertions, foggy attribution, corporate speak, assert-without-mechanism. **These do not move Axis A on their own.** They only nudge provenance when the strong signals are mixed or absent (the 5–6 band).

## The Gate (the core rule of v2.0)

1. Weigh the **strong** signals first and set a provisional Provenance band.
2. **If strong human signals dominate → Provenance is Human (1–4).** The weak tells from the Cheat Sheet are now **craft notes only**. Send them to Axis B. They may NOT raise the Provenance score.
3. **If strong AI-structural signals dominate → Provenance is AI (7–10).**
4. **If signals are mixed or thin → Provenance is ambiguous (5–6).** *Now* the weak tells from the Cheat Sheet earn their keep: use them to push the estimate toward AI.

The gate exists so that an obviously human speaker isn't convicted of being AI for the crime of talking loosely.

## The Two-Layer Read (v2.9)

Provenance has one job — who *produced* the text — but two hands can be in any piece: the **generative** hand that drafted the structure and the sentences, and the **editorial** hand that touched the draft afterward (inserted a line, fixed a name, added a personal aside). The original Gate collapses them: the moment it sees one genuine human voice-marker it routes to the human pole and demotes every structural tell to craft. That protects a loose human talker, but it has a blind spot that is now the common case — an AI draft with a few human edits dropped in. A single inserted anecdote is not authorship of the draft; it is the editorial hand.

**The method: measure the two layers independently, then compare.** Do NOT let a human marker close the read before the machine scaffold has been counted on its own.

1. **AI-structural scaffold.** Measure it first, on its own terms: the structural-tell density (the same non-data measure the Prose-Revision Penalty Gate uses) AND, decisively, whether the tells are *regularly placed* — at section seams, on every emotional beat, at each pivot. Regular placement is the machine's generative signature; irregular, event-driven tells are not. Report the density band and whether placement is regular.
2. **Human hand.** Measure it separately, and only from lines that SURVIVED the tell sweep (v2.9.3: a first-person profundity beat is a tell counted toward the scaffold, not a voice-marker; a surviving marker counts as human hand only if it is separable from the scaffold or carries checkable lived specificity): the Strong human signals (disfluency/self-correction, owned opinion with a personal stake, personal anecdote, drifting register, self-authored analogy). A scaffold whose only "human" lines are polished first-person beats has NO human hand. The question is not merely *present vs. absent* but *pervasive vs. localized* — does the human voice drive the whole text, or does it punctuate a scaffold with a few insertions?
3. **Compare.** The pairing sets the band:

| AI-structural scaffold | Human hand | → Provenance |
| ---------------------- | ---------- | ------------ |
| thin (<15%) | pervasive — drives the text | 2–4 (Human) — the original Gate's protected case |
| thin | localized | 3–5 (Human, lightly assisted) |
| moderate–heavy (15–50%), regular | **sparse / localized insertions** | **7–8 (AI, human-edited) — the Edited-AI signature** |
| roughly matched | present, not dominant | 5–6 (Hybrid — tells count, per the Gate) |
| total (>50%), regular | absent | 9.5 (raw AI — the Provenance Floor Gate) |

**The gates are regions of this one comparison.** The original Gate is the top-left (thin scaffold, human drives → human pole). The Provenance Floor Gate is the bottom-right (total scaffold, no hand → 9.5). The **Edited-AI** row is the case v2.9 adds: a pervasive, *regular* AI scaffold carrying only sparse, localized human insertions is an AI draft that a human briefed and lightly edited without catching the tells. Score it 7–8 — mostly AI, human touch limited to editing. The insertions keep it off 9–10 (not raw output); they do not make the draft human-authored. This also sharpens the Floor Gate's release clause: a lone voice-marker lifts the 9.5 floor but returns you to *this comparison*, not to the human pole — against a heavy scaffold, one marker lands at 7–8, not 2–4.

**"Dominate" means pervasiveness, not presence.** The original Gate's step 2 ("if strong human signals dominate → human") requires the human voice to *drive* the text, not merely appear in it. A few inserted anecdotes against a pervasive, regular AI scaffold do not dominate — that is the mistake the Two-Layer Read exists to stop.

**Guardrail — do not cry AI at a formulaic human.** A human writing to an internalized format (hook, signpost each section, punchy beat, mid-roll CTA) can also produce regularly-placed tells with no machine involved. Stay in the Hybrid band (5–6) on the text alone unless the tells are the *characteristic AI structural signatures* (the colon-label header, the "why this matters" signpost, the balanced flip, the glossary-quote) AND at least one corroborator holds: the same template repeating across the creator's catalogue (a pipeline signature), or grader knowledge of the workflow. Those corroborators are what license moving an ambiguous text-alone read onto the AI pole. This mirrors the asymmetry the system already keeps — the AI pole is text-licensable (the Floor Gate reads structure off the page), but a confident classification of an otherwise ambiguous case still wants evidence beyond one transcript.

This is authorship reasoning only; it never touches Axis B. A machine draft can carry excellent sourcing and a moving story — score that on Craft, independently, exactly as before.

## The Provenance Floor Gate (v2.2)

The mirror of the original Gate. That one protects a human who writes loosely; this one refuses to hand a human verdict to text that shows no human in it. Structural AI cadence with no distinctive human voice is, for scoring purposes, AI — and curation or correct facts do not rescue it (see NOT authorship signals).

**Trigger (BOTH must hold):**
1. Structural tell density **> 50%** of non-data sentences (same measure the Prose-Revision Penalty Gate uses), AND
2. **No distinctive human voice** anywhere in the delivered text — none of the Strong human signals (disfluency/self-correction, owned opinion with a personal stake, personal anecdote, drifting register, self-authored analogy). (v2.9.3: a first-person profundity beat is NOT a voice-marker — it is a tell that counts toward trigger 1's density, and it does not satisfy this condition.)

**Effect:** Provenance is **floored at 9.5/10** (raw AI). The burden flips: absent positive evidence of a human hand *in the prose*, the text cannot claim a more-human score on the strength of its research alone. A single genuine voice-marker (v2.9.3: one that survives the tell sweep and is separable or carries checkable specificity — never a mere first-person profundity beat) in the delivered text lifts the floor and returns you to the Two-Layer Read (v2.9) — not automatically to the human pole; against a heavy, regular scaffold, one marker lands at 7–8 (Edited-AI).

Rationale: you cannot prove a human was in the loop from facts and distinctions a model could have produced unaided. The only proof of human authorship is human voice; its total absence, under heavy AI-structural cadence, is the signature of raw or barely-touched AI output. The user's real failure is not bad research — it is never having worked the draft into a voice of their own.

## The Embodiment Gate (v2.4)

The counterpart to the Floor Gate at the *human* pole. The Floor Gate refuses a human verdict to text with no human voice; the Embodiment Gate refuses the *top* human verdict — a 1 — to any grader who cannot see past the text.

**Why 1 is special.** A 1 is a claim about the world: that a real person really performed the embodied work the piece depicts. A transcript/text-only grader cannot license that claim. Audio can be scripted and voiced; a transcript can narrate live testing, slow local generation, and multi-tool sessions that never happened. Strong *textual* human voice earns a 2 — the honest ceiling for text-alone analysis — and no more.

**How 1 is unlocked.** Embodiment Confirmation is corroboration from outside the text that a real person did the real work — an unedited-enough human presence (face, voice, and/or live screen capture) operating the tools in real time. It can arrive by either channel:
- a reviewer/user attestation, placed in the video description or given at the time the scoring is requested; or
- the grader's own viewing of the recording, where the grader has it.

**Default is UNVERIFIED → the human pole is capped at 2.** Print the status on its own line in the Axis A block:
- `Embodiment confirmation: UNVERIFIED — capped at 2`, or
- `Embodiment confirmation: CONFIRMED by [who / channel] — real-time human work verified → 1 unlocked`.

Confirmation only *unlocks* 1; the piece still has to earn it on the strength of its embodied/real-time signals. Absent them, a confirmed human with a flat, deskbound delivery may still sit at 2. The gate never pushes a score *toward* AI — it only governs whether the bottom rung of the human pole is reachable.

## The Delivery-Medium Gate (v2.5)

Provenance asks who wrote the words. It does not ask who — or what — read them aloud. Those are different questions, and conflating them produces a false positive: an AI avatar reading a human-written script has no disfluency, and that missing disfluency gets misread as evidence of a machine *author*. Voicing is authorship-neutral. An avatar can read human or AI text; a human can read AI text. The medium changes which tells are diagnostic, never the authorship verdict on its own.

**The field.** Record delivery in the Axis A block as one of:
- `live-human` — a person is speaking (vlog, live commentary, hands-on narration).
- `synthetic (attested)` — TTS or an avatar reads a prepared script, confirmed by the creator's attestation (in the description or at scoring time), or evident and attested.
- `unknown` — the default when nothing is attested.

**Attestation is required to claim synthetic.** Absent attestation, score narrated/spoken content as `live-human`: the spoken-voice signals (disfluency, natural contractions, register drift) apply under their normal rules. This mirrors the Embodiment Gate — the more favorable delivery read is unlocked by attestation, not assumed.

**Effect when synthetic is attested.** The script is WRITTEN prose synthesized to audio. Therefore:
- Absence of spoken disfluency and vocal inflection carries NO authorship weight — an avatar erases those regardless of author.
- The "no contractions in spoken content" AI signal recalibrates to the written register: a formal written briefing legitimately drops contractions (the existing genre caveat), so this does not move Provenance.
- Score the words as written prose against the normal signal set (structure, cadence, the Cheat-Sheet tells) — just do not credit or debit anything that only makes sense for a live human mouth.

**What it is NOT.** Synthetic delivery is not itself an AI-authorship signal, and it never pushes Provenance toward AI on its own. It is also independent of embodiment: a piece can show a real person's live screen work (embodiment present) yet be voiced by an avatar (delivery synthetic). Keep the two fields separate.

## The Automation Gate (v2.11)

The mirror of the Embodiment Gate at the *AI* pole. The Embodiment Gate refuses the *bottom* human verdict — a 1 — to a grader who cannot see past the text; the Automation Gate refuses the *top* AI verdict — a 10 — on the same logic. The two certainty poles are symmetric: each is a claim about the world a transcript alone cannot license.

**Why 10 is special.** A 10 says the *entire artifact* is machine-produced with no human editorial hand anywhere — not in the words, and not in whatever wraps them. Text can show the *prose* reads as raw AI; it cannot show that no human sequenced the images, wrote the description, cut the audio, or quietly fixed a line. Strong *textual* raw-AI signal earns a 9.5 — the honest ceiling for text-alone analysis — and no more. This is the exact mirror of the human pole capping at 2 without Embodiment Confirmation.

**How 10 is unlocked.** Automation Confirmation is corroboration from outside the text that the whole artifact is unedited machine output — no human hand across delivery, visuals, packaging, and prose. Like embodiment, it can arrive by either channel:
- a reviewer/user attestation, placed in the description or given at the time the scoring is requested; or
- the grader's own viewing of the video — e.g. synthetic narration over auto-placed stills with no art direction or consistent palette, an uncurated description, and wall-to-wall unrevised prose, together showing no editorial hand in any modality.

**Default is UNCONFIRMED → the AI pole is capped at 9.5.** Print the status on its own line in the Axis A block:
- `Automation confirmation: UNCONFIRMED — capped at 9.5`, or
- `Automation confirmation: CONFIRMED by [who / channel] — fully-automated artifact, no human hand → 10 unlocked`.

Confirmation only *unlocks* 10; the piece still has to earn it — a single genuine human touch in any modality (a curated image sequence, a hand-written description, one revised passage) holds it at 9.5. And the finding stays **rebuttable**: if the creator comes forward to attest a human hand, the 10 returns to the text-only read. The gate never pushes a score *toward* the human pole — it only governs whether the top rung of the AI pole is reachable.

**Relationship to the Provenance Floor Gate.** The Floor Gate (>50% structural density + no human voice) still floors Provenance at 9.5 from the text alone; 9.5 is now explicitly both that floor and the transcript-only ceiling. The Automation Gate is the only route above it, and only with out-of-band confirmation.

---

# AXIS B — CRAFT & RIGOR (genre-relative)

**Question:** Regardless of who wrote it, how good is it?

## Craft Rubric

**Direction: a QUALITY score. High = good · Low = bad.** (Opposite orientation from Axis A — mind the flip.)

| Score | Meaning |
| ----- | ------- |
| 8–10  | Excellent for its genre. Traceable claims, accurate, adds real value, tension left honest. |
| 5–7   | Competent. Some vague spots, a few unsourced leaps, but sound overall. |
| 3–4   | Weak. Padding, foggy sourcing, assertions without mechanism outweigh the substance. |
| 1–2   | Empty. Rephrased marketing, nothing traceable, no value added. |

## Craft Categories

| Category | Weight | What it measures |
| -------- | ------ | ---------------- |
| **Sourcing & Transparency** | 25% | Are claims traceable to *named* sources appropriate to the genre? Or attributed to fog ("experts say")? |
| **Accuracy & Mechanism** | 20% | Are claims walked through and correct, or asserted? Can the reader trace the conclusion back? |
| **Specificity** | 15% | Concrete numbers, names, examples — vs. vague intensifiers. |
| **Value-Add (genre-relative)** | 15% | Does it add framing, analysis, synthesis, or firsthand work *appropriate to its genre*? (Derivativeness is judged HERE, against genre — not as authorship evidence.) Breadth-without-depth — a skim that never develops any claim — is docked here; see the Firehose Ceiling (v2.12). |
| **Prose Craft** | 25% | Tightness and clarity, AND evidence the language was revised rather than shipped as raw machine output. The weak Cheat-Sheet tells are scored here as quality, not as AI proof. **v2.1: reweighted 10%→25% so unrevised prose actually bites.** |

Note: the same tell (say, a blandifier) is invisible to Axis A once the Gate has closed on "human," but still costs Prose Craft on Axis B. That is the intended, non-double-counting behavior.

Note (v2.4): distinguish *reactive gush* from *structural tells*. Repeated authentic astonishment ("best I've ever seen," fired each time a live result surprises the reviewer) is a mild deduction only where it *replaces* analysis — dock for thin analysis, never for enthusiasm itself. Meticulously placed throat-clearing at seams is the heavier tell, and the one Prose Craft is really pricing.

**v2.1 weighting rationale:** shipping unrevised AI prose is a failure of *effort*, and effort is what craft measures. At 10% the prose category could not register that failure (a document could floor Prose Craft and still score ~8). At 25% — plus the penalty gate below — lazy language carries real weight without letting a single style axis erase genuinely good research.

## The Prose-Revision Penalty Gate (v2.1)

Reweighting makes lazy prose *cost* more; the gate makes it *cap* the score. They work together: a document can ace every substance category and still be capped here if the language was shipped as raw machine output. Rationale — publishing unrevised AI prose is a craft failure that good sourcing does not buy back. And it is fair to doubt that someone who would not reread their own sentences reread their own sources; even where they did, the delivered work is still lazy.

**Step 1 — Measure tell density.** Over the *non-data* sentences only (exclude any sentence whose payload is a sourced figure or a direct quotation — that is substance, not prose), count the sentences carrying a structural/prose AI tell: the "It's not A. It's B." antithesis, the staccato profundity-fragment, meta-signpost throat-clearing, habitual rules-of-three, colon-label headers, the glossary-quote pattern. Count register-blind (v2.9.3): a structural tell phrased in the first person still counts — a profundity beat like "the line I trust most because it cost them something to say" is a profundity beat regardless of the "I," and first-person never exempts a sentence from the density.

**v2.4 — placement test (reactive vs. structural).** Before counting a tell, ask *where* it fires. A tell at a predictable structural seam — every section transition, a mechanically balanced pivot, an even cadence held throughout — is the machine signature: count it. A tell that fires at an irregular, event-driven spot — genuine surprise at a live result, a reaction to something on screen — is spontaneous human mess, not unrevised machine prose. In spoken / live-reaction genres, **exclude reactive filler from the density count**, the same exemption already granted to spoken hedges. Count structural tells, not reactive ones. Rule of thumb: human sloppiness is irregular and event-driven; AI "sloppiness" is regular and placed.

    density = tell-bearing non-data sentences ÷ total non-data sentences

**v2.9.2 — count it, don't eyeball it (consistency across reviews).** The density is one *measured* quantity, and it feeds two gates at once — the cap bands below AND the Provenance Floor Gate (>50%). Counting and reporting are different jobs, and only the first sets the score:
- **Counting is exhaustive.** Sweep the transcript once and tag every non-data sentence with any structural tell it carries from the fixed set in Step 1 (a sentence with one or more counts once toward density; note each tell for the tallies). Do NOT sample a few loud tells and estimate the rest — that is how the count drifts from one review to the next. Numbered / step scaffolds ("first… second… third…", "the first layer… the fourth layer…") count under habitual rules-of-three / over-listing; do not overlook them.
- **Reporting is selective.** The receipts block in the posted comment is capped at four lines, so *there* you pick the loudest few. That selection never changes the density — it only presents it.
- **Near a boundary, tally; inside a band, estimate.** When the ratio lands comfortably inside a band (say ~20% or ~60%), a careful estimate is fine. When it lands near a threshold (15 / 30 / 50%), where a few sentences flip the cap or trip the Floor Gate, do the literal per-sentence count instead of eyeballing a band. The thresholds are hard, so the measurement has to be too.

**Step 2 — Apply the cap.** Final Craft = **min(weighted total, cap)**:

| Tell density (non-data sentences) | Reading | Craft cap |
| --------------------------------- | ------- | --------- |
| < 15% | Occasional spice — normal | none |
| 15–30% | Habitual — a revision pass was skimped | 6.5 |
| 30–50% | Pervasive — prose leans on the device | 4.0 |
| > 50% | Structural — machine default shipped unrevised | 2.0 |

**v2.2:** the top-tier cap is now **2.0**, reaching into the "Empty" band, and the 30–50% tier drops to 4.0 to keep the curve monotone. This is deliberate. The cap scores the *delivered work product*, not its latent substance: unrevised machine prose is near-worthless as a finished piece even when the research under it is sound. The raw weighted total still records the substance — **report both** ("raw X.X → capped 2.0") so nothing is hidden — but the headline craft number reflects what was actually shipped. Good research does not buy back a refusal to revise.

**Interaction with Axis A:** the gate lives on Axis B only. It never touches Provenance. A human who habitually leans on these devices can be capped (lazy prose is lazy regardless of author), and an AI-drafted piece with a genuinely revised human voice pays no cap. The gate punishes *unrevised prose*, not *AI provenance* — keep them separate.

## The Firehose Ceiling (Breadth-Without-Depth) (v2.12)

The Penalty Gate prices *how* the prose reads; this ceiling prices what the piece is *doing to the viewer*. An explainer can be accurate, well-sourced, even genuinely synthesizing (so Axis C stays silent) and STILL leave the viewer with nothing to hold, because it maximizes claim throughput and never dwells on any of them. Facts arrive faster than anyone can weigh them, each gone before the next; the viewer finishes with the *sensation* of having learned and no reconstructable substance. That is a craft failure, and the tell-density measure cannot see it — clean, revised prose firehoses just as easily as machine prose.

**The mechanism — false authority by volume (the Gish-gallop asymmetry).** Asserting a claim is cheap; evaluating one is expensive. A monologue needs no opponent to exploit that gap: the viewer is put in the rebutter's seat, handed fifty claims in fifteen minutes, and can get purchase on none before the next arrives. Confident narration then banks trust that per-claim scrutiny would never have granted — the piece is believed *because* it cannot be checked in real time, not because it earned belief claim by claim. This pairs naturally with high-AI provenance (a model emits confident, correct-sounding facts at zero marginal cost, so breadth is its native output mode), but the ceiling is authorship-blind: a human who firehoses is capped the same. Craft only; it never touches Axis A.

**The test (breadth vs. dwell).** Two readings, compared:
1. **Throughput** — is the piece running a high rate of discrete factual claims, one after another?
2. **Dwell** — count the *landing points*: passages where the piece slows to develop ONE thing — walks a mechanism, sits inside a single scene, honours a caveat, follows one thread far enough that a viewer could reconstruct or question it. A landing point is where the viewer is invited to *identify with a moment*, not merely receive a fact.

High throughput with near-zero landing points across the whole runtime is a firehose. A **comprehensiveness claim in the framing** — "the ENTIRE history of X in N minutes," "everything about Y" — is a strong corroborator, not a requirement: when it is present the skim is the advertised product, and the ceiling bites harder.

**Effect — a ceiling, routed through Value-Add.** Like the narrative-vs-tableau ceiling, this caps the top; it does not zero the piece. A competent, accurate skim is still a competent, accurate skim — it simply cannot reach the "excellent for its genre" band while it refuses to develop anything. Dock **Value-Add** (the breadth without depth is the missing contribution) and hold the Craft total out of the top band:

| Dwell against throughput | Reading | Craft ceiling |
| ------------------------ | ------- | ------------- |
| develops its claims — real landing points throughout | normal explainer | none |
| skims but lands sometimes | partial firehose | 6.5 |
| near-zero dwell; breadth advertised as the product | firehose | 5.0 |

Final Craft = **min(weighted total, tell-density cap, firehose ceiling)** — all three are caps; take the lowest, and report which one bound ("raw X.X → firehose ceiling 5.0", or "→ Penalty-Gate cap 2.0, the lower"). Note the common case: when a piece is *also* unrevised, the tell cap is usually lower and binds first, so the ceiling changes no number — but you still name the firehose in the notes, because it is the deeper reason the piece is thin, and because for a piece with *clean* prose the ceiling is the only thing that catches it.

**Guardrails.**
- **Ceiling, not floor.** Do not use it to sink a competent piece into the empty band; that is the Penalty Gate's job when the prose is also unrevised. A clean, accurate skim lands at the ceiling (a competent 5–6.5), not at 2.
- **Genre exception (mirror of the tableau's mood-form exception).** A format whose honest form *is* rapid breadth — a "ten facts about X," a trivia reel, a highlights montage — earns it and is not docked. The test is whether the piece *promises understanding* (an explainer or documentary claiming to teach) and delivers only a skim. A list that is labelled a list keeps its ceiling.
- **Not Axis C.** The firehose still *adds* synthesis, so the relay test comes back non-empty and Net Value stays silent. This ceiling exists to name the thinness Axis C cannot reach — a piece that metabolizes its sources into a real frame yet still routes the viewer past every one of them at speed. If instead the piece adds nothing, that is Axis C (pure relay), not this.
- **Authorship-blind.** Never a Provenance signal. Firehosing is a pacing-and-depth choice, not a machine fingerprint.

---

# AXIS C — NET VALUE (did this deserve to exist?)

**Question:** Set authorship and craft aside. Did making this *add* something to the viewer, or *subtract* from them?

Axis A asks who wrote it. Axis B asks how good the craft is for its genre. Neither asks whether the piece had a reason to exist. A work can be cleanly AI-authored (Axis A high) and competently sourced (Axis B raw high) and *still* leave the viewer worse off than if it had never been made — because all it did was relay, at length, what its own sources already say. The viewer spends fifteen minutes arriving where the primary source would have put them in two, and walks away thinking they learned something when they were routed around the actual research. That is not low value. It is **negative** value, and A and B have no way to express it. Axis C exists to name that, and only that.

## Direction and reporting

**A one-sided quality score. 0 = broke even (or better) · −10 = actively misleading relay.** It is the only axis that can go negative, and the only one that is **conditional**: you compute it, but you **print it only when it is below zero**. When Net Value is 0 or positive, omit the axis entirely — the two axes already tell the whole story, and printing a "0" invites the reader to treat every ordinary piece as suspect. Most scorecards will not show Axis C at all.

**When it fires, it trumps.** Net Value becomes the headline; Provenance and Craft demote to supporting detail beneath it. They are not erased — the tragedy of a −8 is usually *good sources, wasted*, and the reader should see the sourcing was real. But the top line, and the posted verdict tag, lead with Net Value.

## The Gate (necessary condition — without this, Axis C does not fire)

Net Value can only go negative when the piece is a **pure relay of available sources**. All three must hold:

1. **Nothing added beyond the sources.** No firsthand result, no disagreement with a source, no reframing that changes the takeaway, no owned stake, no synthesis that combines scattered material into something none of the sources hold alone. The piece transmits; it does not metabolize.
2. **The sources are available to the viewer** — linked in the description, or public and easily found. This is what makes the relay pure overhead. If the creator surfaced something genuinely obscure or hard to assemble, that curation *is* value, even when derivative — the gate does not fire.
3. **The relay test comes back empty.** Operationalize condition 1 so it is not decided on vibes: **name one thing in the piece its sources do not already contain, and quote it.** If you can, Axis C does not fire — full stop, regardless of every other signal. If you genuinely cannot, the gate is met, and the scorecard must *show the failed search*, not merely assert it.

The gate is deliberately strict. "Worse than useless" is the harshest verdict this system issues, and a false positive on an honest accessible explainer is both wrong and cruel. An explainer that makes a dense source readable for people who would never open it **passes the gate** — the accessibility is the added thing. Axis C catches only the piece that adds neither new material *nor* the human service of digestion.

## Severity (how far below zero, once the gate is met)

The gate decides *whether*; these dials decide *how deep*. Net Value starts at 0 and each aggravating factor pushes it down. Mitigating factors can hold it near 0 — a relay that is genuinely well-crafted and human-voiced may net back to zero and therefore **never print**, because clarity delivered by a person is a contribution.

| Dial | Pushes Net Value DOWN when… | Holds it UP (toward 0) when… |
| ---- | --------------------------- | ---------------------------- |
| **Provenance** | high (toward 10) — automated relay runs at scale, flooding feeds | low — a human at least chose to show up |
| **Craft** | low (toward 1) — unrevised, no editorial care to offset the waste | high — real clarity/accessibility is itself the added value, and can lift the piece out of the negative band entirely |
| **Time cost** | long runtime for a payload the source delivers in a fraction of it | short — a brief relay wastes little |
| **False authority** | polished, confident narration that displaces the source instead of pointing to it | the piece openly signals it is a digest and sends you to the source |
| **False genre claim** | the piece claims a genre that *promises contribution* (Review, Hands-on, Teardown, Investigation) and then relays — misrepresentation stacked on emptiness | the claimed genre is honest (an Explainer that relays is at least labeled as one) |

Neither Provenance nor Craft is a *gate* here — a human-authored or well-crafted piece can still be worse than useless — but both steepen the fall, and their worst case (Provenance → 10, Craft → 1) is the deepest relay slop there is.

## Severity bands (graded label)

| Net Value | Label | Reading |
| --------- | ----- | ------- |
| 0 or positive | (not printed) | Broke even or better. The two axes tell the story. |
| −1 to −3 | thin / borderline waste | Adds almost nothing, but short or partly redeemed by craft. A caution, not a condemnation. |
| −4 to −7 | WORSE THAN USELESS — net time loss | A relay that costs the viewer more than it returns. |
| −8 to −10 | actively misleading relay | Pure relay, at length, wearing false authority and/or a false genre claim, displacing the very sources it drew from. |

## Interaction with A and B

Axis C reads the *outputs* of A and B as inputs to its severity, but it never changes them. Provenance stays whatever it was; Craft stays whatever it was, gates and all. Axis C sits on top and asks the one question those two cannot: given all of that, was the world better or worse for this being made. "Worse Than Useless" (Axis C fired) is a distinct verdict from "AI Slop" (AI + unrevised, but the piece still added *something* and so never tripped the gate). When Axis C fires, report all axes — A and B for the record, C for the verdict, and D above C if D also fired.

---

# AXIS D — INFLUENCE GAMING (is it honest about what it is?)

**Question:** Set aside who wrote it, how good it is, and whether it relayed its sources. Is the piece what it presents itself to be — or is it promotion (commercial or ideological) wearing an independent creator's clothes, engineered to borrow the trust that organic creators earn and to game the systems that reward that trust?

This is the integrity axis. Axis C asks whether a piece wasted the viewer's time; Axis D asks whether it lied to them about its own nature. A video can pass C (it genuinely synthesized something) and still be a covert advertisement — that is exactly the case D exists to catch, and the one Axis B's Sourcing & Transparency dock is too small to hold. **Undisclosed-but-honest promotion is a transparency ding on Axis B. A piece that manufactures an organic-creator persona to disguise a promotional or coordinated payload is a different and graver thing** — it exploits parasocial trust and the recommendation economy. That is what Axis D names, and why it outranks a craft note.

## This axis is a grounded OPINION — say so, every time

Axes A, B, and C are read from evidence. Axis D is not — it is the grader's judgment of *posture and intent*, which cannot be proven from a transcript. So D carries a different contract, and breaking it is a scoring error:

1. **State it as opinion, always.** Open every Axis-D read — in the working notes AND the posted comment — with "This comes across to me as…" / "reads to me like…". Never a bare assertion.
2. **Either channel can trigger it.** The grader's own impression fires it; so does a note from the person requesting the score. It is opinion either way, held to the same contract.
3. **Ground the opinion in named signals.** The *conclusion* is subjective; the *basis* must be concrete. List the specific impressions that produce the feeling (see below). Opinion is not a license to skip the receipts.
4. **Never assert the unprovable as fact.** Payment, ownership, and coordination are described as impressions ("gives the impression of," "reads as if the same hand made all three"), never as established. Absent proof, the hunch stays a labeled hunch — it fires D, it does not become a factual claim about a real person or company.
5. **The tag is opinion too.** The verdict tag prints as "Influence Farming (opinion)" so a reader never mistakes a gut read for a proven charge.

## The Gate (necessary conditions — without these, Axis D does not fire)

D can only fire when ALL of these hold:

1. **A promotional or persuasive function.** The piece works to advance a specific commercial or ideological interest — a product, a company, a position — not merely to inform.
2. **A disguise.** That function is hidden behind an independent-creator posture: no honest disclosure, an "organic explainer" persona, presented as the creator's own neutral curiosity.
3. **It comes across that way to the grader.** The opinion condition — the signals below add up, in the grader's judgment, to manufactured authenticity.

**Do NOT fire D on** (the disguise is the trigger, not the promotion):
- disclosed sponsorship ("this video is sponsored by X") — honest, however promotional;
- a brand's own openly-branded channel — it is not pretending to be an independent creator;
- a creator's genuine, uncompensated enthusiasm for something they chose to cover;
- content you simply dislike, or that is merely AI-made or promotional-but-transparent. Being AI or being an ad is not the trigger; the *disguise* is.

## Signals of manufactured authenticity (name the ones present)

- one company/product carried on overwhelmingly positive framing, dressed as neutral analysis;
- company marketing claims relayed as fact, with no independent verification;
- a manufactured-organic persona — first-person "just a curious explainer," and especially a **fake-skepticism beat** that exists to inoculate the viewer, then resolves back to the pitch;
- format engineered to farm algorithmic credibility — shock-claim title grammar, emotional hooks, a call to action that benefits the promoted interest;
- content-farm production signature — synthetic/anonymous narration at scale, high upload cadence, no accountable human;
- **coordination** — a shared template, voice, or cross-seeding across channels (a pipeline signature). Unprovable as common ownership; describe it as an impression.

## Severity (how far below zero, once the gate is met)

Influence Gaming starts at 0 and each factor pushes it down.

| Dial | Pushes DOWN when… | Holds UP (toward 0) when… |
| ---- | ----------------- | -------------------------- |
| **Coordination** | a multi-channel network / shared pipeline signature — the gravest form | a single channel acting alone |
| **Concealment effort** | fake balance, a manufactured persona, disclosure buried or absent | the promotional angle is half-visible / clumsy |
| **Influence-system gaming** | engineered to exploit recommendation and parasocial-trust mechanics | little algorithmic engineering |
| **Stakes** | health, financial, or political payload | a low-stakes consumer product |
| **Reach / scale** | automated content-farm cadence, built to flood | a one-off |

Single-channel inauthentic promotion fires at a base depth; coordination is what drives it toward the floor.

## Severity bands (graded label)

| Axis D | Label | Reading |
| ------ | ----- | ------- |
| 0 or positive | (not printed) | Reads as honest about what it is. |
| −1 to −3 | reads as lightly inauthentic | A promotional lean under a creator pose, but mild or half-disclosed. A caution. |
| −4 to −7 | reads as disguised promotion | Manufactured authenticity in service of a clear interest. |
| −8 to −10 | reads as a coordinated influence operation | Covert promotion across a manufactured network, engineered to game the trust economy at scale. |

## Direction, reporting, and interaction

**A one-sided opinion score. 0 = reads as honest · −10 = reads as a coordinated influence op.** Conditional, like Axis C: compute it, print it **only when below zero**, and omit it entirely otherwise (most scorecards will not show it).

**When it fires, it leads.** Axis D becomes the headline and the verdict tag ("Influence Farming (opinion)"), with A, B, and C demoted beneath it. **If Axis C also fired, D still leads** — deception about what a piece *is* outranks waste of the viewer's time — and C prints directly under it. D never changes A, B, or C; it reads their outputs (Provenance high, Craft low, a false genre claim) as inputs to its own severity, exactly as C does.

**It is independent of Axis C.** D fires on disguise; C fires on pure relay. A synthesizing explainer (C silent) can still read as covert promo (D fires) — do not force one axis to stand in for the other, and do not fold the disguise into an Axis-B transparency dock and call it handled.

---

# AXIS E — PRESENTATION & PRODUCTION (is the finished artifact well made?)

**Question:** Set aside who wrote it, how good the writing is, whether it relayed its sources, and whether it is honest about itself. Is the finished *audiovisual artifact* — the visuals, the narration as delivered, the on-screen text — competently produced, or does the production degrade or misinform on its own?

Axis A asks who produced the words. Axis B asks how good the words are. Neither hears the narration or sees the screen. A perfectly decent script can be shipped over mangled imagery, butchered pronunciation, broken visual continuity, and gibberish on-screen text — and at some point the production is so broken the artifact fails as communication no matter what the script said. Axis E names that.

## Direction

**A standing QUALITY score, 1–10. High = well made · Low = broken.** Same orientation as Craft (mind the flip from Provenance). It is the fifth axis and the third *always-on* one: **A, B, and E print on every card; C and D print only when they fire.**

## It requires viewing — and it is an impression, not a tally

Two things make Axis E unlike the others, and both are deliberate:

1. **Only assessable from the artifact itself.** Axis E cannot be scored from a transcript — it needs the actual video (or a requester's attestation about the visuals, audio, and on-screen text). This mirrors the Embodiment and Automation gates: a transcript cannot license a claim about how the thing was *made*. On a transcript-only grade with no AV attestation, print `Presentation: not assessed (transcript-only)` and omit the score. For a grader who watched, it prints every time.
2. **A holistic impression, not a per-moment count.** Axis B is *measured* — you tally tells sentence by sentence. Axis E is the opposite by design: a **viewing gestalt**, the general impression of the production as you scan through it. You do NOT owe a frame-by-frame audit or a timestamp for every flaw; a few representative examples carry it ("the on-screen hieroglyphs are gibberish, and one caption is real Chinese characters standing in for Egyptian script; the narrator's character flips between flat and 3D shot to shot"). Production quality is perceived holistically, and the honest evidence base is the watch-through, not a spreadsheet. This is the one axis scored on impression rather than count — say so when you score it.

## What it measures (name the ones present)

- **Narration / audio — delivery, not the words.** Mispronunciation of common words, unnatural pause timing, robotic or broken prosody, TTS artifacts. (The *words themselves* are Craft; how they are *delivered* is here.)
- **Visual fidelity.** AI-mangled or incoherent imagery; the subject drawn wrong so you cannot tell what you are looking at (a loom, a spindle, hands on fabric that do not work; flax that looks like corn).
- **Visual continuity.** Whether the look holds together — a character that flips between flat and 3D, mostly uncolored then suddenly colored for no reason, or becomes a different figure entirely; no held palette or style; no scene-to-scene consistency. Broken continuity is a loud "no human finishing pass" tell.
- **On-screen text integrity.** Garbled or fake glyphs; pseudo-hieroglyphs that are gibberish rather than real signs; the WRONG script entirely (real Chinese characters standing in for Egyptian hieroglyphs); nonsense baked into the art.
- **Human finishing / QA pass.** Whether anything shows a review of the finished cut — or whether errors a single watch-through would have caught were shipped as-is.

## Severity bands

| Axis E | Label | Reading |
| ------ | ----- | ------- |
| 8–10 | polished | Coherent art direction, clean delivery, real and consistent on-screen text. |
| 5–7 | competent → rough | Some weak visuals or stiff delivery, but you can follow it. |
| 3–4 | poor | Pervasive AV problems that get in the way of the content. |
| 1–2 | broken | Imagery so mangled you cannot tell what it is, delivery that loses the words, wrong-language or gibberish on-screen text, no continuity, no QA. Fails as communication regardless of the script. |

## The floor can take the headline

Axis E does not run negative, but its floor bites like the conditional axes. **A floored Axis E (1–2) is a headline-grade failure.** Verdict precedence is **D > C > E > the A+B story**: deception (D) and wasted time (C) still outrank a production failure, so when either fired it still leads and E prints as a supporting number beneath it. But when neither C nor D fired and Axis E is at the floor, **E becomes the verdict** and the tag is **"Badly Produced"** (or "Unwatchable" at a 1). A broken artifact you cannot follow is its own damning verdict, even when the writing underneath was fine and honestly made.

## Interaction and guardrails

- **Independent of Provenance.** A human can produce a slick video or a broken one; so can an AI. Production quality is NEVER an authorship signal and never moves Axis A. The same observations (mangled visuals, botched TTS) may *separately* serve as Automation Confirmation — but that answers a different question ("was a human hand involved?"), exactly as one tell can inform both A and B. Score the quality here; use the signal there. Not double-counting.
- **Independent of Craft.** Axis B scores the words; Axis E scores how they were made and shown. A beautiful script can be butchered in production, and elegant production can carry empty writing. Keep the boundary sharp: bad *wording* is Craft; bad *delivery of the wording* is Presentation.
- **A severity signal for D, not a substitute.** Clumsy, un-QA'd production is legitimate evidence that a piece is a low-effort farm (an Axis-D severity dial). Score the production quality here; let it inform D's severity there. Do not fold one into the other.
- **Not the AI-Art genre.** For openly-disclosed AI art, audiovisual craft is scored under the "Scoring AI Art" reinterpretation of Axis B, not here. Axis E is for ordinary videos whose production is incidental to the content, not the artwork itself.

---

## AI Tells Cheat Sheet (with Full Prose Evidence)

**How to use this in v2.0:** These are the *weak* signals. Under the Gate, they count toward **Axis A only when provenance is ambiguous (5–6)**. Otherwise they are **Axis-B Prose Craft** notes. Two of them — the colon-label header formula and stacked rules-of-three — double as *structural* signals and may inform Axis A directly (see Strong AI signals).

---

### Tell #1: "It's not X. It's Y." Template

> _"It's a fine move once as a spice. Readers who've seen a lot of AI text now read it as a tell. Rework these instances into a plain claim. 'It's not just a product, it's an experience.' (It's a toaster.)"_

- ❌ "It's not just a product, it's an experience."
- ✅ "It's a toaster that also plays music."

**Count:** Once is acceptable. Twice or more is a pattern.

---

### Tell #2: Throat-Clearing Phrases

> _"Remove nearly all throat clearing phrases. 'Let me be clear…', 'And here's the kicker…', 'It is important to highlight that…' Just… no. Cut all that AI cruft out."_

- ❌ "Let me be clear about what this means..."
- ❌ "It is important to highlight that..."
- ✅ Delete these entirely. State the claim.

**Count:** Any phrase that introduces a point rather than making it. Especially rhetorical questions used as transitions.

---

### Tell #3: Gobbledygook, Triteness, Corporate Speak

> _"'Game-changer', 'Circle back', 'Leveraging insights', 'Drill Down', 'Leveraging your synergies'"_

- ❌ "This is a total game-changer."
- ✅ "This changes what a local model can do."

**Count:** Overused business/tech jargon that adds nothing.

---

### Tell #4: Meaningless Modifiers (The "Blandifiers")

> _"'A plethora of', 'truly', 'simply', 'just', 'Very unique', 'A wide array of'"_

- ❌ "This is truly remarkable." / "A plethora of options."
- ✅ "You have 14 options to choose from."

**Count:** Intensifiers that assert importance instead of demonstrating it. NOTE: spoken hedges ("really," "pretty," "just") in casual speech are speech tics, not written blandifiers — weigh them lightly.

---

### Tell #5: Annoying Compound Offenders

> _"'Let's unpack this.', 'This begs the question…', 'At the end of the day…', 'In the grand scheme of things…'"_

- ❌ "At the end of the day, it's about privacy."
- ✅ "For developers, this means..."

---

### Tell #6: Stacking Rules of Three (or More) — *also a structural signal*

> _"Don't stack rules of three… Pick the two that matter. The padded series signals filler even when every item is real."_

- ❌ "Administrators, nutrition directors, facilities managers, custodial staff, teachers, and student groups."
- ✅ "Administrators and nutrition directors."

**Count:** Lists of 4+ where 2–3 would do. Habitual stacking is a *structural* AI signal (Axis A).

---

### Tell #7: Colon-Label Formula Headers — *also a structural signal*

> _"Don't use the colon-label formula at every level… Repeated at every scale, the alliterative-label-then-elaboration pattern is the single loudest AI tell there is."_

- ❌ "Pivots and Practicalities: Turning Strategy into Action"
- ✅ "Here's what you need to run it."

**Count:** One or two fine. Repeated throughout is a *structural* AI signal (Axis A). Exclude YouTube-generated chapter headers.

---

### Tell #8: Attribute to Fog

> _"'Studies show,' 'experts agree,' 'research suggests.' Name the source or drop the claim."_

- ❌ "Studies show that smaller models are catching up."
- ✅ "Semianalysis estimated Opus at 1.5 trillion parameters."

**Count:** Any claim attributed to an unnamed source. (Primarily an Axis-B Sourcing defect.)

---

### Tell #9: "That is what makes this" Framing

> _"Show, don't tell. Don't tell the reader a problem was serious; put them in the place and let them feel it."_

- ❌ "That is what makes this release different."
- ✅ "You can run it on one consumer GPU."

---

### Tell #10: The "Yes, But..." Seamless Transition

> _"Leave some tension unresolved. Real work is messy."_

- ❌ "That's the good news. However, there are still limitations."
- ✅ "That's the pitch. Here's the reality check."

**Count:** Frictionless positive→negative pivots. Habitual mechanical balance is a *structural* signal (Axis A).

---

### Tell #11: Introducing Terms in Quotes + Explaining Significance

> _"Don't introduce a term in quotes and then explain its significance… As a habit it reads like a textbook glossary."_

- ❌ "This is what we call a 'gateway project.' It opens doors to..."
- ✅ "This project opens doors to other integrations."

**Count:** Habitual use is a *structural* signal (Axis A).

---

### Tell #12: Assert Without Mechanism

> _"Don't assert without mechanism… A conclusion the reader can't trace back is a conclusion they won't trust."_

- ❌ "The model performs extremely well on coding tasks."
- ✅ "The model can open the terminal, run the project, read the error, and fix the file."

**Count:** Primarily an Axis-B Accuracy & Mechanism defect.

---

### Tell #13: No First-Person / Avoiding Accountability

> _"Have a point of view… Write to one reader. One person, across a table."_

- ❌ "The results are promising." (who says?)
- ✅ "I ran this model and it crashed three times before working."

**Count:** Absence of a person owning the judgment. NOTE: *presence* of natural first-person is a **strong human signal (Axis A)**.

---

### Tell #14: Over-Listing

> _"Don't over-list… If the items have a logic connecting them, that logic is the writing. When in doubt, write the paragraph."_

- ❌ "Supports Transformers, vLLM, SGLang, and TokenSpeed. Four-bit versions for llama.cpp, Ollama, and LM Studio."
- ✅ "Supports most major frameworks, including Transformers and vLLM."

---

### Tell #15: Em Dash Overuse

> _"Em dashes are appropriate for poetry quote author callouts… Find alternative punctuation."_

- ❌ "The model—which runs on a single GPU—can handle complex tasks."
- ✅ "The model runs on a single GPU. It handles complex tasks."

**Count:** One or two fine. Even em-dash cadence throughout written text is a *structural* signal (Axis A). (Note: irrelevant to pure speech transcripts.)

---

## Scorecard Template

**OUTPUT FORMAT — plain text only (v2.3).** The finished scorecard is posted as a YouTube comment: plain text, proportional font, no markdown rendering. So the template below uses **no markdown** — no `|` tables, no `#` headers, no `**bold**`, no backticks. Those render as literal punctuation, and tables in particular wrap into garbage at narrow widths. The rule that replaces them: **one label per line.** Every score, weight, and note lives on its own line and wraps harmlessly; nothing depends on columns lining up. Emphasis is CAPS; section rules are one repeated character (`━`), which reads as a divider at any width. Do NOT reintroduce tables or space-aligned ASCII columns — a proportional font will not hold their alignment. (The rubric/reference tables elsewhere in this document are read here in the spec and never posted, so they stay as tables.)

Copy from the first rule line to the last:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AI-DETECTION SCORECARD (v2.13)
 [Title of Content]
 [Date] · [Platform] · Genre: [Explainer/News · Review · Research · Tutorial]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROVENANCE (Axis A): [X]/10 — [Human / Hybrid / AI]
  scale: 1 = fully human … 10 = fully AI

CRAFT & RIGOR (Axis B): [X.X]/10 — [genre-relative quality]
  scale: 1 = lazy / AI tells … 10 = well-crafted for its genre
  if a gate fired, show it →  raw [X.X] capped to [X.X] by [gate name]

PRESENTATION & PRODUCTION (Axis E): [X]/10 — [polished / competent / poor / broken]
  scale: 1 = broken production … 10 = well made
  standing quality score; OMIT only if transcript-only (mark "not assessed"). A floor of 1–2 can LEAD the verdict when Axes C and D did not fire

NET VALUE (Axis C): [−X]/10 — [WORSE THAN USELESS / actively misleading relay / thin waste]
  scale: 0 = broke even … −10 = actively misleading relay
  OMIT THIS LINE ENTIRELY unless Net Value is below zero (it usually is not)

INFLUENCE GAMING (Axis D): [−X]/10 — [reads as disguised promotion / coordinated influence op] (opinion)
  scale: 0 = reads as honest … −10 = coordinated influence op
  OMIT THIS LINE ENTIRELY unless Axis D is below zero; when it fires it LEADS the verdict, above Axis C

VERDICT: [one line — led by Axis D if it fired, else Axis C, else a floored Axis E (1–2), else the A+B story]

Note: platform elements and caption errors excluded; only intended prose scored.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AXIS A · PROVENANCE — [X]/10
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Strong human signals:
  - [signal] ([timestamp])          (or: none found)

Strong AI (structural) signals:
  - [signal] ([timestamp])          (or: none found)

Distinctive human voice: [present — quote it / ABSENT — name what is missing]

Delivery: [live-human / synthetic (attested) — score script as written prose / unknown (default)]

Embodiment confirmation: [UNVERIFIED — capped at 2 / CONFIRMED by (who / channel) — real-time human work verified → 1 unlocked]

Gate decision: [normal Gate result; note if the Provenance Floor Gate, Embodiment Gate, or Delivery-Medium Gate applied]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AXIS B · CRAFT & RIGOR — [X.X]/10 · Genre: [___]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Each line reads →  category — score/10 · weight · note

  - Sourcing & Transparency — [_]/10 · 25% · [note]
  - Accuracy & Mechanism — [_]/10 · 20% · [note]
  - Specificity — [_]/10 · 15% · [note]
  - Value-Add (genre) — [_]/10 · 15% · [note]
  - Prose Craft — [_]/10 · 25% · [note]

Weighted raw total: [X.X]
Prose-Revision Penalty Gate: tell density [_]% of non-data sentences → cap [_]
Final Craft = min(raw, cap) = [X.X]

Prose-craft tells (Axis B only — NOT authorship evidence):
  - [tell] ×[count] — "[example quote]" ([timestamp])

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AXIS C · NET VALUE — [−X]/10     (INCLUDE THIS SECTION ONLY IF IT FIRED)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Net Value Gate: [FIRED / not triggered — if not triggered, delete this whole section]

Relay test — name one thing the piece adds beyond its sources:
  - [quote the added thing → Axis C does NOT fire]  OR  [nothing found — searched X, Y, Z]
Sources available to viewer: [yes — linked/public / no]

Severity dials:
  - Provenance: [X]/10 (toward 10 = worse)
  - Craft: [X.X]/10 (toward 1 = worse)
  - Time cost: [runtime vs. the payload the source delivers]
  - False authority: [present / absent]
  - False genre claim: claimed [genre] vs delivered [genre] — [amplifier if false / honest]

Net Value = [−X]/10 — [thin/borderline waste | worse than useless — net time loss | actively misleading relay]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AXIS D · INFLUENCE GAMING — [−X]/10     (INCLUDE THIS SECTION ONLY IF IT FIRED)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

This reads to me as: [the opinion, in the grader's own voice — "manufactured-organic promotion for X" / "a coordinated influence channel"]

Influence Gaming Gate: [FIRED / not triggered — if not triggered, delete this whole section]
  - Promotional/persuasive function: [the interest it advances]
  - Disguise: [the independent-creator posture hiding it]
  - Comes across that way: [yes — opinion]

Signals I am reading (opinion grounded in these):
  - [signal] ([timestamp])

Severity dials:
  - Coordination: [single channel / multi-channel pipeline signature — describe as impression, not proven]
  - Concealment effort: [fake balance / manufactured persona / disclosure absent]
  - Influence-system gaming: [present / absent]
  - Stakes: [health / financial / political / low-stakes product]
  - Reach / scale: [content-farm cadence / one-off]

Not asserted as fact: [payment / ownership / coordination remain impressions, unproven]

Axis D = [−X]/10 — [reads as lightly inauthentic | reads as disguised promotion | reads as a coordinated influence operation] (opinion)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AXIS E · PRESENTATION & PRODUCTION — [X]/10     (OMIT ONLY IF TRANSCRIPT-ONLY / NOT ASSESSED)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Basis: [assessed from viewing / requester's AV attestation] — a holistic impression, not a per-moment tally

Production impression: [polished / competent / rough / poor / broken]

Signals I am reading (a few representative examples, not exhaustive):
  - Narration / audio (delivery): [mispronunciations, dead pauses, robotic prosody / clean]
  - Visual fidelity: [subject drawn wrong, can't tell what it is / coherent]
  - Visual continuity: [character / style / color flips shot to shot / consistent]
  - On-screen text: [gibberish or wrong-script glyphs / real and correct]
  - QA / finishing pass: [none evident / present]

Axis E = [X]/10 — [label]. [If 1–2 and neither C nor D fired: LEADS the verdict, tag "Badly Produced" / "Unwatchable".]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 EVIDENCE LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Each line reads →  ([timestamp]) claim — source — note

  - ([00:00]) [claim] — [source] — [note]

Creator citations in description (count toward Sourcing):
  - [source or "none"] — [URL]
  - Excluded as boilerplate: [hashtags, promo copy, upload date]

Caption errors noted (excluded):
  - ([timestamp]) [said] → [caption showed]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 BOTTOM LINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Summary tying both axes together.]

Key weaknesses (craft):
  1. …

What would improve this:
  1. …

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 CHALLENGE TO THE CREATOR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Custom challenge.]

Provenance reads [Human/Hybrid/AI] at [X]/10; craft scores [X.X]/10 for its genre.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 Scorecard generated using AI-DETECTION SCORECARD SYSTEM v2.13
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 COPY / PASTE — POST THIS  (everything above is working notes)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

This is the ONLY part actually posted. Lead with the HEADER block so the comment
identifies itself (see HEADER below — it is a fixed template, like P1), then write
four short paragraphs of plain prose (plus one extra opinion/relay paragraph when Axis C
or Axis D fired — the P-CD slot below). The paragraphs
are judged by this same rubric, so they have to pass it: no "not X, it's Y", no
staccato profundity fragments, no stacked triples, no throat-clearing, no em-dash
cadence. Keep it specific, and vary the sentence shapes.

Spoken register — contractions (required): write the comment the way a person
actually talks. Use contractions naturally (it's, you're, isn't, didn't, here's,
that's); you do NOT have to contract every time, and you should NOT — hold the full
form where a speaker would lean on it for emphasis (a flat "there is no rig, no
terminal, no raw clip" lands harder than the contracted version). The failure mode
to avoid is the opposite extreme: shipping straight uncontracted prose reads as
Simplified Technical English, which is the very machine register this system flags
as the "no contractions in spoken content" tell (see Strong AI signals). The mix is
the point — mostly contracted, a few deliberate full forms for stress. NOTE: this
governs only the voice of the *posted comment*; how the scored piece itself handles
contractions stays a separate Axis-A question under the Delivery-Medium and
co-occurrence rules.

Voice and addressee (v2.7): write the comment as the person publishing it, speaking
directly to the video's creator. First person "I" is the poster; second person "you"
is the creator (the youtuber). The comment must stand on its own as a viewer's note —
never refer to the grading assistant, to "the user," or to how the score was
requested, and never surface anything said only in the grading conversation. An
attested delivery medium becomes an observation ("the voiceover is clearly
synthetic"), NOT a reference to the exchange ("you told me it's synthetic").

Emphasis: YouTube renders `*word*` as BOLD and `_word_` as italic (and nothing
else — no tables, headers, or backticks). Light emphasis on the axis names is fine;
do not lean on it.

  HEADER — the FIXED title block, and it always leads the posted comment (before P1).
       Paste it verbatim from the top of the working-notes card so the two never drift:
       the rule line, "AI-DETECTION SCORECARD (vX.Y)", the [Title], then
       "[Date] · [Platform] · Genre: [___]", and the closing rule line. Fill the four
       fields (title, date, platform, genre) with the SAME values already used in the
       working-notes header — in particular use ONE genre label in both places, do not
       re-word it per block. Like the P1 opener, it is templated, not re-authored per
       video; only the four fields and the version number change.
  P1 — the FIXED method opener, pasted verbatim (see FIXED P1 OPENERS below). Use the
       two-axis version by default; use the extended version when Axis C and/or Axis D fired. Do
       NOT rewrite it per video — it is invariant across videos and pre-vetted for tells.
  P2 — Provenance: the number and label, plus one or two worst offenders with timestamps.
  P3 — Craft: the number (and "raw X.X, capped to Y" if a gate fired), plus one or two worst offenders.
       When the Penalty Gate cap applied, explain it in plain terms, e.g.:
       "If you throw out every sentence that's just reporting a fact, and more than
       half of what's left is the same rhetorical gimmick, the writing is judged
       unrevised AI. Unfortunately for this segment, that hard-caps the craft score
       at [Y]."
  RECEIPTS — a short labeled tell block, shown when tell density drove the Craft cap
       OR pushed Provenance toward the AI pole on structural signals (skip it for a
       clean human piece with nothing to show). It exists so the reader can see the
       number was counted, not guessed. Rules:
       - One tell per line, at most FOUR lines. More than four turns the receipts
         into the very over-listing they indict, and pads the comment — pick the
         loudest few.
       - Reader-facing aliases, not spec jargon: "balanced flip" (not "Tell #1"),
         "profundity beat" (not "staccato profundity-fragment"), "stacked triple,"
         "numbered scaffold," "throat-clearing."
       - Each line: the alias in *bold*, the count, then ONE quoted example with a
         timestamp. No em dashes; use a colon or parentheses as the separator.
       - Close with the density in plain words ("about one in three of every sentence
         that is not just a number") so the block ties back to the cap.
       - Quote the creator's words; never paraphrase a tell into your own voice. This
         block QUOTES tells as evidence, so it is the one exemption to the "no triples,
         no profundity fragments" self-check above — the surrounding prose still obeys it.
       Format (label-led):
         Where the craft number comes from, a few of the patterns I counted:
         *Numbered scaffold* (6x): "..." (from [ts])
         *Balanced flip* (4x): "..." ([ts])
         *Profundity beat* (8x): "..." ([ts])
         That is about one in three of every sentence that is not just a number.
  P-CD — a short paragraph, added ONLY when Axis C and/or Axis D fired, placed just before P4.
       If Axis C fired: explain the relay in plain terms. If Axis D fired: use the P-CD AXIS-D
       SKELETON below — a FIXED frame (the opener, the not-asserted-as-fact disclaimer, and the
       lead-in clause) wrapped around a per-video slot for the named signals. It is NOT pasted
       verbatim the way P1 is: the frame is fixed so it holds the opinion contract and stays
       tell-free, but the signal list is ALWAYS bespoke, because Axis D is an opinion grounded in
       THIS video's named signals and a verbatim paragraph would strip the very receipts that
       legitimize it. However filled, it MUST open with "This comes across to me as…", name the
       signals behind the opinion, and never assert payment, ownership, or coordination as fact.
       If both fired, lead this paragraph with the Axis-D opinion (it is the headline), then the
       Axis-C relay beneath it.
  P-PROD — a short production paragraph, added when Axis E was assessed and is notably low (roughly ≤4),
       placed after P3 (Craft). Describe the visual, audio, and on-screen-text problems in plain language
       with a couple of representative examples — it is an impression, so no timestamp receipts are owed.
       When Axis E is floored (1–2) and it leads the card, this paragraph carries the headline reasoning.
  P4 — open with a bold one-line score strip, then the bottom line and challenge:
       *Final Scores:* *Provenance* [X] | *Craft* [X.X] | *[verdict tag, e.g. Lazy User - AI Slop]*
       If Net Value fired (Axis C below zero), lead the strip with it and make it the tag:
       *Final Scores:* *Net Value* [−X] | *Provenance* [X] | *Craft* [X.X] | *Worse Than Useless*
       If Influence Gaming fired (Axis D below zero), lead the strip with it and make it the tag —
       it OUTRANKS Net Value, so when both fired D leads and C follows:
       *Final Scores:* *Influence* [−X] | *Net Value* [−X] | *Provenance* [X] | *Craft* [X.X] | *Influence Farming (opinion)*
       Keep the "(opinion)" marker on the Axis-D tag; it is a judgment, not a proven charge.
       Reserve "AI Slop" for the AI + unrevised case that still added something (Axes C and D did NOT fire).
       Presentation (Axis E) prints in the strip whenever it was assessed, as a plain number after Craft,
       e.g. *Production* [X]. When Axis E is floored (1–2) and NEITHER C nor D fired, lead the strip with
       it and make it the tag:
       *Final Scores:* *Production* [X] | *Provenance* [X] | *Craft* [X.X] | *Badly Produced*
       When D or C led, Production stays a plain number in the strip, not the tag.

  P-CD AXIS-D SKELETON (v2.12.1 — a fixed frame with a per-video slot; NOT full-verbatim like P1).
  The bracketed [slots] are filled per video; the surrounding sentences are the fixed frame,
  pre-vetted for tells and carrying the opinion contract — the "This comes across to me as…" opener
  and the not-asserted-as-fact disclaimer live here so a grader cannot forget them:

    This comes across to me as [the read, in the grader's own words — e.g. "a template being run at
    scale rather than one creator's project"]. [The named signals, bespoke to this video — what you
    are actually reading: the persona, the format, any cross-channel / pipeline pattern, the
    narration, the title and CTA grammar.] I can't prove [ownership / coordination / payment] and
    I'm not claiming that, it's the impression the pattern leaves. That impression is what puts
    influence gaming at the top of this card.

  Keep the disclaimer clause even when the impression is strong: it is the line between a labeled
  hunch (which fires D) and an asserted charge (which the axis forbids). Vary the wording of the
  fixed sentences if a phrasing repeats too often across your cards — the REQUIREMENTS are the
  opener, the disclaimer, and the lead-in, not their exact words. If Axis C also fired, the Axis-C
  relay explanation follows this paragraph, beneath the Axis-D opinion.

  FIXED P1 OPENERS (paste P1 verbatim — do NOT rewrite it per video; each version has
  already passed the self-check, and re-deriving it only risks introducing tells). Use the
  default opener when neither Axis C nor Axis D fired; use the extended opener when EITHER
  Axis C (Net Value) or Axis D (Influence Gaming) fired, because the default wording is
  wrong once a negative axis is on the card. Both openers describe production (Axis E); if
  the grade is transcript-only and Presentation was NOT assessed, drop the one production
  sentence from whichever opener you use. The extended opener describes both conditional
  axes and is correct whether C fired, D fired, or both.

  Default (use when neither Axis C nor Axis D fired):
    For your score card, I use a few scores on different axes. Provenance is 1 to 10,
    where a 1 means the writing reads as fully human and a 10 means it reads as fully
    machine. Neither end is good or bad on its own, since it's only a call about who or
    what actually wrote the words. Craft is also 1 to 10, where a 1 is lazy or padded and a
    10 is genuinely well crafted for its genre. And when I've actually watched the video, I
    add production, again 1 to 10, for how well the thing is made, the visuals, the
    narration as it's spoken, and the on-screen text, which is separate from whether the
    writing itself is any good. These are independent, since a script can read very human
    and still be awful, and a sharp script can be buried under terrible production.

  Extended (use when Axis C and/or Axis D fired — describes both conditional axes):
    For your score card, I use a few scores on different axes. Provenance is 1 to 10,
    where a 1 means the writing reads as fully human and a 10 means it reads as fully
    machine. Neither end is good or bad on its own, since it's only a call about who or
    what actually wrote the words. Craft is also 1 to 10, where a 1 is lazy or padded and a
    10 is genuinely well crafted for its genre. And when I've watched the video, I add
    production, again 1 to 10, for how well it's made, the visuals, the spoken narration,
    and the on-screen text, separate from whether the writing is any good. The last two
    scores only show up when a video comes out negative on them. Net value runs from 0 down to −10 and fires
    when a piece mostly relays what its own sources already say, so you'd have been better
    off going straight to those sources. Influence gaming also runs from 0 down to −10, and
    it's the one opinion score here: it fires when the video comes across to me as promotion
    wearing an independent creator's clothes, built to borrow the trust that real creators
    earn. Whichever of those two is on the card becomes the headline, and if both show up,
    influence gaming leads.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AI-DETECTION SCORECARD (v2.13)
 [Title of Content]
 [Date] · [Platform] · Genre: [___]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[paragraph 1 — FIXED opener, pasted verbatim: two-axis by default, extended opener if Axis C and/or Axis D fired]

[paragraph 2]

[paragraph 3]

[receipts block — 3 to 4 labeled tell lines + density line; omit if nothing to show]

[P-CD paragraph — ONLY if Axis C and/or Axis D fired; if D fired it opens "This comes across to me as…"]

[paragraph 4]
```

---

## Worked Example (two-axis, genre-aware)

This example is in the v2.2 plain-text output format — copy-ready for a YouTube comment. Note it shows the case where the Penalty Gate does NOT bind (tell density under the 30% band), contrasting with a wall-to-wall structural case where it would.

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AI-DETECTION SCORECARD (v2.3)
 Qwen 3.8 27B vs Claude Opus Transcript
 2026-08-16 · YouTube · Genre: Review / Hands-on (claimed)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROVENANCE (Axis A): 6/10 — Hybrid (ambiguous)
  scale: 1 = fully human … 10 = fully AI

CRAFT & RIGOR (Axis B): 4.4/10 — weak for a review
  scale: 1 = lazy / AI tells … 10 = well-crafted for its genre

VERDICT: Reads as a lightly-edited script; as a review it never touches the model.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AXIS A · PROVENANCE — 6/10
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Strong human signals:
  - thin — no self-correction, no personal anecdote, no owned opinion.

Strong AI (structural) signals:
  - mechanical "yes-but" balance ([timestamp]).
  - "that is what makes this" framing, repeated ([timestamp]).

Distinctive human voice: none found — but not wall-to-wall AI cadence either.

Gate decision: signals MIXED → ambiguous band (5–6). Weak tells (blandifiers, fog, assert-without-mechanism) therefore DO count toward Axis A and push it toward AI → 6. Provenance Floor Gate NOT triggered (tell density under 50%).

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AXIS B · CRAFT & RIGOR — 4.4/10 · Genre: Review
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  - Sourcing & Transparency — 4/10 · 25% · all numbers from Qwen's own benchmark table; "some estimates" unnamed.
  - Accuracy & Mechanism — 4/10 · 20% · "performs extremely well" asserted, never shown.
  - Specificity — 7/10 · 15% · real numbers (27B, 73 vs 78.2, 262K context).
  - Value-Add (genre) — 2/10 · 15% · as a REVIEW, zero firsthand testing is a genre failure.
  - Prose Craft — 5/10 · 25% · several tells, but not wall-to-wall.

Weighted raw total: 4.4
Prose-Revision Penalty Gate: tell density ~25% of non-data sentences → cap 6.5 (not binding, raw is already below it)
Final Craft = min(4.4, 6.5) = 4.4

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 BOTTOM LINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Not a review — a rephrase of Qwen's marketing. The genre it claims (hands-on) is exactly what it fails to deliver. Contrast: an explainer summarizing the same benchmarks would not be penalized on Value-Add the same way.
```

Note how the same behaviors that would be *forgiven* in an explainer are *fatal* in a claimed review — and how the ambiguous provenance is what licenses the tells to count. That is the v2.0 machinery working.

**v2.3 note:** this example would also trip **Axis C — Net Value**. Run the relay test: everything in it is Qwen's own benchmark table restated, with zero firsthand testing, and the model card is public — nothing added beyond the source. Gate met. Severity is steep, because it claims a Review/Hands-on genre (a promise of contribution) and delivers a relay of vendor marketing — a **false genre claim**. Net Value would land around −6 (worse than useless), and the headline verdict would flip from the Axis-B note to "Worse Than Useless," with Provenance 6 and Craft 4.4 demoted beneath it. The example predates Axis C, so the block above does not print it; a fresh v2.3 scoring would.

---

## Changelog

**v2.13 (2026-09-19)** — Added Axis E — Presentation & Production: a fifth axis and the third always-on quality score (A, B, and E print on every card; C and D stay conditional). It scores the finished AUDIOVISUAL artifact — the visuals, the narration as delivered, the on-screen text — on 1–10 (high = well made), separate from the words (Craft) and from who wrote them (Provenance). Two deliberate differences from the other axes: it is assessable ONLY from watching the video or an AV attestation (a transcript cannot license it — it prints "not assessed" and is omitted on a transcript-only grade, mirroring the Embodiment/Automation logic), and it is scored as a HOLISTIC IMPRESSION, not a per-moment tally (a viewing gestalt with a few representative examples, no timestamp receipts owed — the honest counterpart to Craft's rigor). It does not run negative, but its floor bites: a floored Axis E (1–2 — mangled imagery you can't read, delivery that loses the words, wrong-script or gibberish on-screen text, broken continuity, no QA) is a headline-grade failure. Verdict precedence is D > C > E > the A+B story: a floored E leads and tags "Badly Produced" only when neither C nor D fired; otherwise it prints as a supporting number. Independent of Provenance (production is never an authorship signal, though the same observations may separately serve as Automation Confirmation) and of Craft (bad wording is Craft; bad delivery of the wording is Presentation); clumsy production is also a legitimate Axis-D severity signal. Added the Axis-E summary line, working-notes block, score-strip marker, the P-PROD paragraph slot, and production sentences in both P1 openers; bumped every live version string to v2.13. Triggered by the nileside-stories "clothes" grading, where an attested-AI explainer paired an empty script with a broken production — flax that looks like corn, looms and spindles drawn wrong, characters flipping flat/3D and uncolored/colored with no continuity, real Chinese characters and gibberish standing in for hieroglyphs, and botched TTS — a disaster Craft (a prose axis) had no clean way to score. No change to Axis A, B, C, or D mechanics.

**v2.12.1 (2026-09-19)** — Enumerated the P-CD Axis-D paragraph as a first-class template element with its own fixed frame, parallel to how v2.9.1 restored the HEADER. The Axis-D paragraph is now specified as a SKELETON: a fixed frame (the "This comes across to me as…" opener, the "I can't prove … and I'm not claiming that" disclaimer, and the "that impression is what puts influence gaming at the top of this card" lead-in) wrapped around a per-video slot for the named signals. It is deliberately NOT full-verbatim like P1 — Axis D is an opinion grounded in the specific video's signals, so a verbatim paragraph would strip the receipts that legitimize it; the frame is fixed to hold the opinion contract and stay tell-free, the signal list stays bespoke. The mandatory disclaimer clause is now anchored in the skeleton so a grader cannot omit it (the line between a labeled hunch, which fires D, and an asserted charge, which the axis forbids). Documentation only — no scoring-logic change to any axis or gate, and the live version strings stay v2.12; nothing scored under v2.12 needs rescoring.

**v2.12 (2026-09-19)** — Added the Firehose Ceiling (Breadth-Without-Depth) to Axis B: a craft ceiling (not a floor), routed through Value-Add, for an explainer that maximizes claim throughput and never dwells — accurate, sourced, even synthesizing, yet leaving the viewer with the sensation of learning and no reconstructable substance, a thing the tell-density measure cannot see. Names the mechanism as false authority by volume / the Gish-gallop asymmetry: assertion is cheap and evaluation expensive, so confident narration banks trust that per-claim scrutiny would deny. Measured by breadth vs. dwell (claim throughput against landing points — passages that develop one thing), with a comprehensiveness claim in the framing ("the ENTIRE history in N minutes") as a corroborator; ceilings 6.5 / 5.0, and Final Craft = min(weighted total, tell-density cap, firehose ceiling). Ceiling-not-floor; authorship-blind (a human can firehose — never an Axis-A signal); distinct from Axis C (the firehose still adds synthesis, so Net Value stays silent — this names the thinness the relay test cannot reach); genre exception for formats whose honest form is rapid breadth (a labelled list, a trivia reel). Bumped every live version string to v2.12. Triggered by the Egypt (histinmin/egypt) grading, where an accurate, well-sourced documentary skimmed 5,000 years with nothing to land on; the Penalty Gate's tell cap (2.0) already bound there, so the ceiling changed no number, but it is what catches the same failure in a piece whose prose is clean. No change to Axis A, C, or D mechanics.

**v2.11 (2026-09-15)** — Added the Automation Gate, the mirror of the Embodiment Gate at the AI pole. A 10 (a fully-automated artifact with no human editorial hand anywhere) is a claim about the world a transcript cannot license, so text alone now caps the AI pole at 9.5 — made explicit as both the Provenance Floor Gate's floor and the transcript-only ceiling. Reaching 10 requires Automation Confirmation: corroboration from outside the text (a user attestation or the grader's own viewing) that no human hand touched delivery, visuals, packaging, or prose. Like embodiment it only unlocks the pole — one genuine human touch in any modality holds the score at 9.5 — and it stays rebuttable by creator attestation. New Axis-A field: Automation confirmation, UNCONFIRMED (default, capped 9.5) or CONFIRMED (10 unlocked). Bumped every live version string to v2.11. Triggered by the medieval-alehouse (Medieval Way) grading, where the grader's own viewing confirmed a synthetic voice, auto-placed un-art-directed AI stills, an uncurated description, and wall-to-wall unrevised prose — no human hand in any modality — which the 9.5 text-only ceiling could not express. No change to Axis A below the ceiling, or to B, C, or D mechanics.

**v2.10 (2026-09-11)** — Added Axis D — Influence Gaming: a fourth axis, conditional and negative-only like Axis C (0 → −10, prints only when it fires), that catches promotion wearing an independent creator's clothes — a piece engineered to borrow the parasocial trust organic creators earn and to game the recommendation system. Unlike A/B/C it is an explicitly labeled OPINION ("This comes across to me as…"), grounded in named signals but never asserting payment, ownership, or coordination as fact; either the grader's own read or the requester's note can trigger it, and the carve-outs spare disclosed sponsorship, openly-branded channels, and genuine enthusiasm. The trigger is the disguise, not the promotion — which is what makes it graver than an Axis-B Sourcing/Transparency dock. Coordination across channels is the deepest severity dial. When it fires it leads the verdict, above Axis C (deception about what a piece is outranks waste of the viewer's time). Added the extended (four-axis) P1 opener, the P-CD paragraph slot, the working-notes Axis-D block, and the "Influence Farming (opinion)" tag; bumped every version string to v2.10. Triggered by the like-milk (Asahi) grading, where a synthesizing explainer cleared Axis C yet read as covert single-vendor promotion. No change to A, B, or C mechanics.

**v2.9.3 (2026-09-11)** — Closed the first-person-texture loophole in Axis A. Tell-classification now runs FIRST and register-blind: a sentence carrying a structural tell cannot also be a human signal, and first-person grants no exemption — a profundity beat phrased "the line I trust most because it cost them something to say" is a profundity beat, counted toward tell density like any other (it no longer sits in the human-hand column, and it now counts toward the >50% Floor-Gate trigger). The discriminator is **form, not person**. A tell-free line counts as genuine human voice only if it is *separable from the scaffold* (leaves a seam) or carries *checkable lived specificity*; smooth, equally-polished first-person is scaffold, not hand. Retitled the "Strong human signals (hard to fake)" list — the label conflated human-*characteristic* with hard-to-*fake*, and its own examples were written as beats — tightened the NOT-authorship entry, and rewrote the Two-Layer Read human-hand step plus the Floor-Gate condition and release clause to match. Triggered by the Cloud Codes "33 lines" grading, where first-person asides wrongly held Provenance at 8 off the 9.5 floor. Scoring-logic change: a piece whose human pole rested on first-person beats may need rescoring.

**v2.9.2 (2026-09-09)** — Spelled out how to *count* structural-tell density so reviews are reproducible. The density is one measured ratio that feeds both the Penalty Gate cap bands and the Provenance Floor Gate (>50%), so the count must be an exhaustive one-sweep tally over the fixed tell set (data sentences excluded, placement test applied), NOT a chase of whichever tells surface loudest. Distinguished counting (exhaustive — sets the score) from reporting (the four-line receipts block, which selects the loudest few and never changes the density), and added the rule: near a band threshold (15/30/50%), do the literal per-sentence count instead of estimating a band. Noted that numbered/step scaffolds count under rules-of-three / over-listing. Triggered by the spelt/Medieval Way grading, where triples were undercounted (~6 vs ~16) and the eyeballed density sat just under 50%; a real count put it over, firing the Floor Gate (Provenance 9→9.5) and dropping the cap (4.0→2.0). No change to the gates, thresholds, or axes — only to how their shared input is measured.

**v2.9.1 (2026-09-09)** — Restored the posted-comment HEADER as a first-class template element. The copy/paste comment must lead with the same scorecard header block that tops the working notes — the rule line, "AI-DETECTION SCORECARD" plus version, the Title, then Date · Platform · Genre, and the closing rule line — before the FIXED P1 opener, pasted from the working-notes card so the two never drift (in particular, one genre label in both). This had always been shown in the paste skeleton and mentioned in passing, but it was never enumerated alongside P1–P4, and recent revisions let graders re-type it and drift it (e.g. "History explainer" in the posted block vs. "Explainer / Food History" in the working notes). Now enumerated as HEADER, parallel to the fixed P1 opener. Documentation only — no scoring-logic change to any axis or gate; nothing scored under v2.9 needs rescoring.

**v2.9 (2026-09-08)** — Added the Two-Layer Read to Axis A: score the AI-structural scaffold (tell density AND regularity of placement) and the human hand (voice markers, weighed pervasive vs. localized) *independently*, then compare — so a few human insertions can no longer close the read on "human" before the machine scaffold is counted. Names the Edited-AI signature: a pervasive, regularly-placed AI scaffold carrying only sparse, localized human insertions is an AI draft that a human briefed and lightly edited without catching the tells → Provenance 7–8 (mostly AI, human touch limited to editing), not the human pole. Recast the original Gate, the Provenance Floor Gate, and this new case as regions of one comparison; clarified that "dominate" in the Gate means pervasiveness, not mere presence; sharpened the Floor Gate's release clause (a lone voice-marker returns you to the comparison, not to the human pole). Guardrail retained against convicting a formulaic human: stay Hybrid (5–6) on text alone unless the tells are the characteristic AI signatures AND a corroborator holds (catalogue-wide template, or known workflow). Triggered by the newfiestick "German torpedo" grading, where sparse but genuine human touches had wrongly pulled an AI-drafted, human-edited script to the human pole (2, then 3); corrected to 7. No change to Axis B or Axis C mechanics.

**v2.8 (2026-09-08)** — Fixed the copy-paste P1 opener as verbatim boilerplate: the method explanation (the two/three axes and their 1–10 directions) is invariant across videos, so it is now pasted, not re-authored each time — removing a recurring spot where re-derivation could introduce tells. Two versions are defined under the copy-paste spec: a two-axis default and a three-axis variant used ONLY when Axis C (Net Value) fired, since the two-axis wording is wrong once a third score is on the card. Per-video paragraphs (P2–P4) and the receipts block are unchanged. No scoring-logic change.

**v2.7 (2026-08-30)** — `getytcc` now writes the full description (`<base>_DESCRIPTION.txt`) alongside the `.srt` from the same InnerTube response (no manual copy step; won't overwrite an existing description file; default output is `.srt` + `_DESCRIPTION.txt`, with `--only-srt`/`--only-txt`/`--only-desc`). Recommended layout: one folder per video under `cc/`. Pinned the posted-comment voice: the poster speaks directly to the creator ("I" = poster, "you" = youtuber) and never leaks the grading conversation — triggered by a leak seen in real gradings. No scoring-logic change from v2.6; rubric file is now version-agnostically named (version lives inside). Addendum (2026-09-08): added the RECEIPTS block to the copy/paste comment — a short labeled tell list (at most four lines, reader-facing aliases, count + one quoted example + timestamp each, closing with the plain-words density) shown when tell density drove the Craft cap or pushed Provenance toward AI, so the reader can see the number was counted, not guessed. It is the one exemption to the comment's no-triples/no-profundity self-check because it quotes tells as evidence rather than committing them. Still no scoring-logic change: receipts only surface counts already computed by the Prose-Revision Penalty Gate. Also added a spoken-register requirement for the posted comment: write it with natural contractions (not every time; hold the full form for emphasis), because straight uncontracted prose reads as the STE / "no contractions in spoken content" machine register the system itself flags — a comment-voice rule only, independent of the scored piece's Axis-A contraction analysis.

**v2.6 (2026-08-17)** — Added the AI Art / Generative Media genre and "Scoring AI Art" section: for disclosed AI art, Provenance labels the human/AI mix without moral valence, Axis B is reinterpreted for artistic craft, the prose gates and Cheat-Sheet tells do not fire on lyrics/visuals, and the **narrative-vs-tableau ceiling** caps a mood-only tableau short of 9–10 (genre exception for work whose form *is* the mood). Triggered by disclosed generative work breaking the two-axis machine. Extended the Companion-Source rule across a series — the companion can be an earlier episode that documented the method.

**v2.5 (2026-08-17)** — Added the Delivery-Medium Gate: voicing is authorship-neutral, so an AI voice/avatar reading a human script is still human-written; new Axis-A field (live-human / synthetic (attested) / unknown), and claiming synthetic requires attestation, else scored live-human. Generalized the description-check into the Companion-Source rule (sourced-elsewhere claims are traceable, not fog; don't invent a companion). Both triggered by a large false-positive "AI Slop" on an avatar-read, companion-sourced human explainer.

**v2.4 (2026-08-17)** — Split the human pole and added the Embodiment Gate: 1 = confirmed human, unlocked only by out-of-band confirmation; 2 = textually human, the transcript-only ceiling; default UNVERIFIED caps the human pole at 2 (a 1 is a claim about the world a text-bound grader can't license). Added the embodied / real-time human signal (costly behavior a model can only claim, not perform). Added the reactive-vs-structural placement test to the Penalty Gate — only structurally placed tells count; reactive filler in live genres is excluded.

**v2.3 (2026-08-17)** — Added Axis C — Net Value: conditional, scale 0 → −10, printed only when below zero. Gate is a pure relay of *available* sources that fails the "name one thing it adds" test; when it fires it trumps both axes as the headline "Worse Than Useless." Distinguished "Worse Than Useless" (Axis C fired) from "AI Slop" (AI + unrevised, but still added something). Gate is strict by design — a false positive on an honest accessible explainer is the worst error this system can make.

**v2.2 (2026-08-17)** — Added the Provenance Floor Gate (>50% structural tell density + no human voice → floored at 9.5). Reclassified research / curation / finding-distinctions as NOT authorship signals (closes a laundering path where good research inflated human provenance). Lowered the Penalty Gate top-tier cap 4.0 → 2.0 (30–50% tier 5.0 → 4.0). Rebuilt the output template as plain text, no markdown (YouTube comments wrap tables unpredictably). Added the COPY / PASTE condensed comment. Added the contraction signal (genre-gated and co-occurrence-gated; below ~10% tell density it reads as register choice, not evidence).

**v2.1 (2026-08-17)** — Reweighted Craft categories so unrevised prose bites: Prose Craft 10%→25%; Sourcing 30%→25%, Accuracy 25%→20%, Specificity 20%→15% (Value-Add unchanged). Added the Prose-Revision Penalty Gate: a tell-density cap on the Craft total (6.5 / 5.0 / 4.0 by band), Axis-B only and independent of provenance — it punishes unrevised prose, not AI authorship.

**v2.0 (2026-08-17)**

- Split scoring into two independent axes: **Provenance** (Human↔AI) and **Craft & Rigor** (genre-relative).
- Added **the Gate**: stylistic tells count toward Provenance only when authorship is ambiguous; otherwise they are craft notes.
- Reclassified **Originality** as genre-relative "Value-Add" under Craft — no longer an authorship signal, no longer 35% of an AI score.
- Added **Genre Calibration** table so rigor is judged against what the genre can deliver.
- Separated tells into **strong human / strong AI (structural) / weak (both)** signal classes.
- Clarified Platform Exclusions: creator-authored **citations/source links in the description count** toward Sourcing & Transparency; only genuine platform boilerplate is excluded.
- Rewrote template and worked example for two axes.

**v1.3 (2026-08-16)** — Expanded Cheat Sheet to 15 tells with full prose evidence; added tell-tracking table.
**v1.2 (2026-08-16)** — Added auto-caption misspelling exclusion.
**v1.1 (2026-08-16)** — Added platform exclusions.
**v1.0 (2026-08-16)** — Initial release.

---

## License

This system is free to use, modify, and share. If you improve it, send it back.
