# 🧠 AI-DETECTION SCORECARD SYSTEM v2.5

## What Changed and Why (read this first)

v1.x produced a single 1–10 "AI-generation" score. That conflated two questions that must be kept apart:

1. **Who wrote it?** (human, hybrid, or AI)
2. **Is it any good?** (craft and rigor)

Two problems followed from blending them:

- **The tells were treated as unconditional proof of AI.** Blandifiers, vague assertions, foggy attribution, and "assert without mechanism" are *correlated* with AI, not *exclusive* to it. Humans — especially people talking off the cuff — do all of them. Once you've already established strong human signals (a named person, first-person ownership, spoken self-correction), counting those same tells toward an "AI score" is double-counting. **Sloppy ≠ synthetic.**
- **"Originality" was miscategorized and overweighted.** "Original research vs. summary of others' work" is a *genre/value* judgment, not an *authorship* judgment. A human can write an excellent derivative explainer; an AI can fabricate fake "hands-on testing." Weighting it 35% of an authorship score structurally punished every explainer, regardless of who wrote it — and punished it hardest on topics that are *impossible* to test firsthand.

**v2.0 fixes both by scoring on two independent axes with a gate between them.**

- **Axis A — Provenance:** Human ↔ AI. Assessed *first*, only from authorship signals.
- **Axis B — Craft & Rigor:** How good the work is, judged *relative to its genre*. This is where prose tells, sourcing, and derivativeness live — as quality feedback, not as authorship evidence.
- **The Gate:** Once Axis A lands confidently on "human," the stylistic tells stop counting toward Axis A and become Axis-B craft notes only. The tells regain authorship weight *only* when provenance is genuinely ambiguous.

Do not collapse the two axes into one number. Report both.

**⚠️ The two axes run in opposite directions — this trips people up.** Axis A is a *classification* (low = Human, high = AI; **neither pole is inherently "good"** — a human can write garbage, an AI can write cleanly). Axis B is a *quality* score (**high = good, low = bad**). Always print the pole label next to the number, e.g. `Provenance 2/10 (Human) · Craft 7.5/10 (good)`.

**v2.3 adds a third, conditional axis — Net Value.** A and B between them still cannot say one thing that matters: whether the piece *deserved to exist*. A work can be cleanly AI-authored and competently sourced and **still** leave the viewer worse off than if it had never been made — when all it does is relay, at length, what its own linked sources already say. That is not low value; it is *negative* value. Axis C (Net Value) exists to name that and only that. It runs 0 → −10, is **printed only when it is below zero**, and when it fires it **trumps** the other two as the headline verdict. Most scorecards will never show it. See AXIS C — NET VALUE below.

**v2.4 splits the human pole of Provenance and adds the Embodiment Gate.** The old rubric could never award a 1: a transcript-only grader cannot prove that a real person did the embodied work a video depicts — audio can be scripted and voiced, and a transcript can *narrate* live testing that never happened. So the human pole now separates *textually human* (score 2 — the honest ceiling for text-alone analysis) from *confirmed human* (score 1), the latter reachable only when embodiment is corroborated from outside the text: a reviewer/user attestation (placed in the video description or given at the time scoring is requested) or the grader's own viewing of the recording. Default is UNVERIFIED, which caps the human pole at 2. Two companion changes follow: a new *embodied / real-time* human signal, and a *reactive-vs-structural placement test* that stops genuine in-the-moment human mess from being counted as unrevised machine prose. See PROVENANCE and the Embodiment Gate below.

**v2.5 adds two delivery-and-sourcing corrections.** The Delivery-Medium Gate stops synthetic narration (an AI avatar or TTS reading a script) from being misread as machine *authorship* — voicing is authorship-neutral, and when synthetic delivery is attested the script is judged as written prose, not speech. The Companion-Source rule generalizes the description check: before calling a claim fog, look for the paper, repo, or notes the piece distills, and score the substance against it. Both close blind spots that can otherwise convict human-led, well-sourced work of being AI slop.

---

## How to Use

**Inputs (recommended workflow).** Fetch the transcript with `getytcc`, which writes `<title>_<id>.txt` (plus a timestamped `.srt`). Then **manually copy the relevant parts of the video's description** into a sibling file named `<title>_<id>_DESCRIPTION.txt` — specifically: companion-source links (the paper, repo, dataset, or notes the piece distills), any reviewer/user **attestation** of embodied work, and any "AI voice / synthetic narration" **disclosure**. These are exactly the signals the Companion-Source rule (v2.5), the Embodiment Gate (v2.4), and the Delivery-Medium Gate (v2.5) read; without the description those gates cannot fire and human-led, well-sourced work can be wrongly convicted. Then hand the scoring agent (Claude or another trusted AI) **this rubric plus both files** and ask it to score using the system below.

1. Copy the template at the bottom. Fill in title, date, platform, and **genre** (see Genre Calibration).
2. **EXCLUDE platform-generated elements** (YouTube chapters, timestamps, auto-captions).
3. **IGNORE caption transcription errors** (misspelled names, garbled technical terms). Assess the *intended* wording.
4. **Score Axis A (Provenance) first**, using only the Provenance Signals. Record the delivery medium (Delivery-Medium Gate, v2.5) — attested synthetic narration is scored as written prose, so spoken-voice signals do not apply.
5. **Apply the Gate**, then the **Provenance Floor Gate** (v2.2), then the **Embodiment Gate** (v2.4). Decide whether the stylistic tells count toward Axis A or drop to Axis B; if the prose is structural AI with no human voice, floor Provenance at 9.5; and remember a score of 1 requires confirmation the work is a real person's embodied, real-time effort — default UNVERIFIED caps the human pole at 2.
6. **Score Axis B (Craft & Rigor)**, calibrated to the genre, then **apply the Prose-Revision Penalty Gate** (v2.1) to cap the Craft total if tell density is high. Before scoring Sourcing, check for companion sources (Companion-Source rule, v2.5), not just the description.
7. **Apply the Net Value Gate (v2.3):** run the relay test — can you name and quote one thing the piece adds beyond its (available) sources? If yes, leave Axis C unscored. If no, the piece is a pure relay; score Axis C — Net Value — as a negative number using the severity dials, and let it become the headline verdict.
8. Provide a timestamp or line reference for every claim.
9. Report all scores (Axis C only if it fired) and a one-line verdict. Add the challenge to the creator.
10. **Save the finished scorecard** as a sibling file named `<title>_<id>_SCORE.txt`, reusing the exact `<title>_<id>` base from the transcript so all of a video's files sort together. Keep it **plain text** — the template output is designed to paste directly as a YouTube comment (see OUTPUT FORMAT below), so do not save it as markdown.

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

---

## Genre Calibration (set this before scoring Axis B)

Axis B is judged against what the genre can reasonably deliver. "No original testing" is a fatal flaw for a review and a non-issue for an explainer.

| Genre | What rigor looks like | What is NOT a defect |
| ----- | --------------------- | -------------------- |
| **Explainer / News** | Accurate synthesis, named primary sources, useful framing/analogies, clear caveats on what's unknown | Absence of original testing — especially when the subject is untestable (not yet released, no tooling) |
| **Review / Hands-on** | Firsthand use, reproducible results, screenshots/terminals, failures shown | Reliance on marketing numbers, no artifacts shown → this IS a defect here |
| **Original Research / Essay** | A thesis, evidence the author gathered, a traceable argument | — |
| **Tutorial / How-to** | Correct, runnable steps; stated prerequisites | Lack of opinion or novelty |

Name the genre in the scorecard header. If content mixes genres, score Axis B against the genre it is *claiming* to be.

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
| 9–10  | Raw AI output. Little or no editing. |

## Provenance Signals

Score these **first**, before touching the Tell Cheat Sheet.

### Strong human signals (hard to fake)
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
- **Generic first-person accountability copy** — "I checked every source," "I will pin corrections." A model produces this on request. Only first-person with a *personal stake or lived specificity* counts (see Strong human signals).

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

## The Provenance Floor Gate (v2.2)

The mirror of the original Gate. That one protects a human who writes loosely; this one refuses to hand a human verdict to text that shows no human in it. Structural AI cadence with no distinctive human voice is, for scoring purposes, AI — and curation or correct facts do not rescue it (see NOT authorship signals).

**Trigger (BOTH must hold):**
1. Structural tell density **> 50%** of non-data sentences (same measure the Prose-Revision Penalty Gate uses), AND
2. **No distinctive human voice** anywhere in the delivered text — none of the Strong human signals (disfluency/self-correction, owned opinion with a personal stake, personal anecdote, drifting register, self-authored analogy).

**Effect:** Provenance is **floored at 9.5/10** (raw AI). The burden flips: absent positive evidence of a human hand *in the prose*, the text cannot claim a more-human score on the strength of its research alone. A single genuine voice-marker in the delivered text lifts the floor and returns you to normal Gate scoring.

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
| **Value-Add (genre-relative)** | 15% | Does it add framing, analysis, synthesis, or firsthand work *appropriate to its genre*? (Derivativeness is judged HERE, against genre — not as authorship evidence.) |
| **Prose Craft** | 25% | Tightness and clarity, AND evidence the language was revised rather than shipped as raw machine output. The weak Cheat-Sheet tells are scored here as quality, not as AI proof. **v2.1: reweighted 10%→25% so unrevised prose actually bites.** |

Note: the same tell (say, a blandifier) is invisible to Axis A once the Gate has closed on "human," but still costs Prose Craft on Axis B. That is the intended, non-double-counting behavior.

Note (v2.4): distinguish *reactive gush* from *structural tells*. Repeated authentic astonishment ("best I've ever seen," fired each time a live result surprises the reviewer) is a mild deduction only where it *replaces* analysis — dock for thin analysis, never for enthusiasm itself. Meticulously placed throat-clearing at seams is the heavier tell, and the one Prose Craft is really pricing.

**v2.1 weighting rationale:** shipping unrevised AI prose is a failure of *effort*, and effort is what craft measures. At 10% the prose category could not register that failure (a document could floor Prose Craft and still score ~8). At 25% — plus the penalty gate below — lazy language carries real weight without letting a single style axis erase genuinely good research.

## The Prose-Revision Penalty Gate (v2.1)

Reweighting makes lazy prose *cost* more; the gate makes it *cap* the score. They work together: a document can ace every substance category and still be capped here if the language was shipped as raw machine output. Rationale — publishing unrevised AI prose is a craft failure that good sourcing does not buy back. And it is fair to doubt that someone who would not reread their own sentences reread their own sources; even where they did, the delivered work is still lazy.

**Step 1 — Measure tell density.** Over the *non-data* sentences only (exclude any sentence whose payload is a sourced figure or a direct quotation — that is substance, not prose), count the sentences carrying a structural/prose AI tell: the "It's not A. It's B." antithesis, the staccato profundity-fragment, meta-signpost throat-clearing, habitual rules-of-three, colon-label headers, the glossary-quote pattern.

**v2.4 — placement test (reactive vs. structural).** Before counting a tell, ask *where* it fires. A tell at a predictable structural seam — every section transition, a mechanically balanced pivot, an even cadence held throughout — is the machine signature: count it. A tell that fires at an irregular, event-driven spot — genuine surprise at a live result, a reaction to something on screen — is spontaneous human mess, not unrevised machine prose. In spoken / live-reaction genres, **exclude reactive filler from the density count**, the same exemption already granted to spoken hedges. Count structural tells, not reactive ones. Rule of thumb: human sloppiness is irregular and event-driven; AI "sloppiness" is regular and placed.

    density = tell-bearing non-data sentences ÷ total non-data sentences

**Step 2 — Apply the cap.** Final Craft = **min(weighted total, cap)**:

| Tell density (non-data sentences) | Reading | Craft cap |
| --------------------------------- | ------- | --------- |
| < 15% | Occasional spice — normal | none |
| 15–30% | Habitual — a revision pass was skimped | 6.5 |
| 30–50% | Pervasive — prose leans on the device | 4.0 |
| > 50% | Structural — machine default shipped unrevised | 2.0 |

**v2.2:** the top-tier cap is now **2.0**, reaching into the "Empty" band, and the 30–50% tier drops to 4.0 to keep the curve monotone. This is deliberate. The cap scores the *delivered work product*, not its latent substance: unrevised machine prose is near-worthless as a finished piece even when the research under it is sound. The raw weighted total still records the substance — **report both** ("raw X.X → capped 2.0") so nothing is hidden — but the headline craft number reflects what was actually shipped. Good research does not buy back a refusal to revise.

**Interaction with Axis A:** the gate lives on Axis B only. It never touches Provenance. A human who habitually leans on these devices can be capped (lazy prose is lazy regardless of author), and an AI-drafted piece with a genuinely revised human voice pays no cap. The gate punishes *unrevised prose*, not *AI provenance* — keep them separate.

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

Axis C reads the *outputs* of A and B as inputs to its severity, but it never changes them. Provenance stays whatever it was; Craft stays whatever it was, gates and all. Axis C sits on top and asks the one question those two cannot: given all of that, was the world better or worse for this being made. "Worse Than Useless" (Axis C fired) is a distinct verdict from "AI Slop" (AI + unrevised, but the piece still added *something* and so never tripped the gate). When Axis C fires, report all three — A and B for the record, C for the verdict.

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
 AI-DETECTION SCORECARD (v2.5)
 [Title of Content]
 [Date] · [Platform] · Genre: [Explainer/News · Review · Research · Tutorial]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PROVENANCE (Axis A): [X]/10 — [Human / Hybrid / AI]
  scale: 1 = fully human … 10 = fully AI

CRAFT & RIGOR (Axis B): [X.X]/10 — [genre-relative quality]
  scale: 1 = lazy / AI tells … 10 = well-crafted for its genre
  if a gate fired, show it →  raw [X.X] capped to [X.X] by [gate name]

NET VALUE (Axis C): [−X]/10 — [WORSE THAN USELESS / actively misleading relay / thin waste]
  scale: 0 = broke even … −10 = actively misleading relay
  OMIT THIS LINE ENTIRELY unless Net Value is below zero (it usually is not)

VERDICT: [one line]

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
 Scorecard generated using AI-DETECTION SCORECARD SYSTEM v2.5
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 COPY / PASTE — POST THIS  (everything above is working notes)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

This is the ONLY part actually posted. Repeat the header block so the comment
identifies itself, then write four short paragraphs of plain prose. The paragraphs
are judged by this same rubric, so they have to pass it: no "not X, it's Y", no
staccato profundity fragments, no stacked triples, no throat-clearing, no em-dash
cadence. Write to one reader in second person, keep it specific, and vary the
sentence shapes.

Emphasis: YouTube renders `*word*` as BOLD and `_word_` as italic (and nothing
else — no tables, headers, or backticks). Light emphasis on the axis names is fine;
do not lean on it.

  P1 — what the two scores mean, including the 1–10 direction of each axis.
  P2 — Provenance: the number and label, plus one or two worst offenders with timestamps.
  P3 — Craft: the number (and "raw X.X, capped to Y" if a gate fired), plus one or two worst offenders.
       When the Penalty Gate cap applied, explain it in plain terms, e.g.:
       "If you throw out every sentence that's just reporting a fact, and more than
       half of what's left is the same rhetorical gimmick, the writing is judged
       unrevised AI. Unfortunately for this segment, that hard-caps the craft score
       at [Y]."
  P4 — open with a bold one-line score strip, then the bottom line and challenge:
       *Final Scores:* *Provenance* [X] | *Craft* [X.X] | *[verdict tag, e.g. Lazy User - AI Slop]*
       If Net Value fired (Axis C below zero), lead the strip with it and make it the tag:
       *Final Scores:* *Net Value* [−X] | *Provenance* [X] | *Craft* [X.X] | *Worse Than Useless*
       Reserve "AI Slop" for the AI + unrevised case that still added something (Axis C did NOT fire).

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 AI-DETECTION SCORECARD (v2.5)
 [Title of Content]
 [Date] · [Platform] · Genre: [___]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[paragraph 1]

[paragraph 2]

[paragraph 3]

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

**v2.5 (2026-08-17)**

- **Added the Delivery-Medium Gate.** Voicing is authorship-neutral: an AI avatar or TTS reading a human-written script has no disfluency, and that absence must not be read as evidence of a machine author. New Axis-A field — live-human / synthetic (attested) / unknown (default). Claiming synthetic requires attestation (mirror of the Embodiment Gate); absent it, narrated content is scored as live-human. When synthetic is attested, the script is scored as WRITTEN prose: absence of spoken disfluency/inflection carries no authorship weight, and the no-contractions-in-speech signal recalibrates to the written register. Synthetic delivery is never itself an AI signal and is independent of embodiment.
- **Generalized the description-check into the Companion-Source rule.** Before scoring a claim as fog, look for a companion source the creator produced or that the piece explains (paper, repo, position doc, show notes). If the substance is sourced there, the claims are traceable; missing on-screen sourcing becomes a transparency/packaging ding, not a sourcing failure. Guardrail: do not invent a companion.
- Rationale: both close blind spots that produced a large false-positive "AI Slop" verdict on a human-led, expert-reviewed explainer whose narration was avatar-read and whose sourcing lived in a companion position paper.

**v2.4 (2026-08-17)**

- **Split the human pole of Provenance and added the Embodiment Gate.** Score 1 was previously unreachable. It now means *confirmed human* — a real person verified from outside the text to have done the embodied, real-time work the piece depicts — and unlocks only under Embodiment Confirmation (a reviewer/user attestation in the description or at scoring time, or the grader's own viewing). Score 2 is *textually human*, the honest ceiling for transcript-only analysis. Default UNVERIFIED caps the human pole at 2. Rationale: a 1 is a claim about the world, not the prose, and a text-bound grader cannot license it — audio can be scripted, and a transcript can narrate live work that never happened. Mirror of the Provenance Floor Gate at the opposite pole.
- **Added an embodied / real-time human signal.** Reacting to live software, interrupting running jobs, waiting out slow local generation, operating tools across a session, calibrating against a prior body of work — costly real-time behavior a model cannot perform, only claim. Distinct from the de-credited research/curation signal (desk work a model matches natively). Moderate weight from transcript alone (narrated), strong only under Embodiment Confirmation.
- **Added the reactive-vs-structural placement test to the Prose-Revision Penalty Gate.** Human sloppiness is irregular and event-driven; AI "sloppiness" is regular and placed at seams. Reactive filler in spoken/live-reaction genres is now excluded from the tell-density count (as spoken hedges already are); only structurally placed tells count. Prose Craft docks reactive gush only where it *replaces* analysis, not enthusiasm itself.

**v2.3 (2026-08-17)**

- **Added Axis C — Net Value.** A third, conditional axis answering whether the piece deserved to exist. Scale 0 → −10, printed ONLY when below zero (most scorecards never show it). Gate (necessary): a pure relay of *available* sources that fails the "name one thing it adds" test. Severity dials, once the gate is met: Provenance toward 10, Craft toward 1, time cost, false authority, and a false genre claim. When it fires it **trumps** both other axes as the headline verdict, and the posted tag becomes "Worse Than Useless." Rationale: a piece can be AI-authored (A high) and well-sourced (B raw high) and still leave the viewer worse off than not watching, by relaying at length what its own linked sources already say — Axes A and B could not express negative value.
- **Distinguished "Worse Than Useless" (Axis C fired) from "AI Slop" (AI + unrevised, but the piece still added something).** The two tags now mean different things.
- Provenance and Craft feed Axis C's *severity* but are never changed by it; the gate is strict by design, because a false positive on an honest accessible explainer is the worst error this system can make. Accessibility (making a dense source readable) counts as an added thing and passes the gate.
- Added How-to step 7 (the Net Value Gate), a conditional header line, a conditional working-notes section, and copy/paste tag guidance. Worked example annotated to show Axis C firing on a claimed-review relay.

**v2.2 (2026-08-17)**

- **Added the Provenance Floor Gate:** structural tell density >50% + no distinctive human voice → Provenance floored at 9.5/10. Mirror of the original Gate — refuses to award a human verdict to text with no human voice in it.
- **Reclassified research/curation/finding-distinctions as NOT authorship signals.** Current AI matches or beats humans at sourcing and at drawing theoretical/mathematical distinctions, so these can no longer be credited as evidence of a human author. Closes a laundering path where good research inflated a human provenance score.
- **Lowered the Prose-Revision Penalty Gate top-tier cap 4.0 → 2.0** (and 30–50% tier 5.0 → 4.0). Unrevised machine prose can now score into the "Empty" band; the cap scores delivered craft, with the raw total still reported alongside.
- **Rebuilt the output template as plain text (no markdown).** YouTube comments are plain text in a proportional font, where markdown tables and space-aligned columns wrap unpredictably. Replaced all tables with a one-label-per-line format; dropped `#`/`**`/backticks in favor of CAPS and single-character rules. Reference tables inside this spec (read, never posted) are unchanged. Worked example reformatted and recomputed under v2.2 weights.
- **Added the COPY / PASTE condensed comment.** The full scorecard is working notes; the actual posted comment is four short prose paragraphs (metrics, Axis A with examples, Axis B with examples, bottom line + challenge). It must itself pass this rubric — clean prose, no tells — since a detector that writes like AI has no standing.
- **Added the contraction signal.** Natural contractions in a spoken/casual register are a mild human signal; their near-total absence in content meant to be spoken is an AI and revision tell (the draft was never worked toward how a person talks). Genre-gated (only where a speaking voice is expected) and co-occurrence-gated on a mechanical threshold: if structural tell density (tells ÷ non-data sentences, as the Penalty Gate measures) is under ~10%, missing contractions read as an intentional register choice (e.g. Simplified Technical English for international audiences), not evidence — they must not move Provenance. At 10%+ they corroborate but never lead.

**v2.1 (2026-08-17)**

- **Reweighted Craft categories** so unrevised prose carries real weight: Prose Craft 10%→25%; Sourcing 30%→25%, Accuracy 25%→20%, Specificity 20%→15% (Value-Add unchanged at 15%).
- **Added the Prose-Revision Penalty Gate:** a tell-density measure over non-data sentences that *caps* the Craft total (6.5 / 5.0 / 4.0 by density band), floored at 4.0. Lets lazy prose override otherwise-strong substance without double-counting into the substance categories.
- Clarified that the gate is Axis-B only and independent of Axis-A provenance: it punishes unrevised prose, not AI authorship.

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
