# AI Tell Index

A single list of every tell class the AI-Detection Scorecard System uses, with the plain name
we use in posted comments, how each one is counted, and when a human does the same thing
for honest reasons.

**This index is a guide. The rubric governs.** Every live entry links back to where the
[rubric](../AI-Detection-Scorecard-System.md) defines it. If the two ever disagree, the rubric
wins and this file needs fixing.

- **Matches rubric:** v2.14 (index added in v2.13.1)
- **Examples:** invented for illustration. None are quoted from scored videos.

---

## How to read the tiers

| Tier | Meaning |
|---|---|
| **Structural** | A strong AI signal. Habitual use can move Provenance (Axis A) directly. See [Strong AI signals][strong]. |
| **Weak** | Humans and AI both do it. A Craft (Axis B) note; it touches Provenance only when the read is ambiguous (5–6). See [Weak signals][weak]. |
| **Candidate** | Proposed, not yet in the rubric. **Do not count it in a score** until it is adopted. |
| **Whole-piece read** | An impression of the piece as a whole, never counted sentence by sentence. See [Whole-piece reads](#whole-piece-reads). |

**Density** means the tell is in the fixed counting set of the
[Prose-Revision Penalty Gate, Step 1][density]. Only those tells go into the tell-density
ratio that sets the Craft cap and can trip the [Provenance Floor Gate][floor]. A sentence
carrying one or more density tells counts once.

---

## Summary table

| ID | Tell (alias) | Tier | Density | Defined in |
|---|---|---|---|---|
| #1 | **Balanced flip** ("It's not X. It's Y.") | Structural | Yes | [Cheat Sheet #1][t01] |
| #2 | **Throat-clearing** | Weak (meta-signposts count toward density) | Yes | [Cheat Sheet #2][t02] |
| #3 | **Corporate speak** | Weak | No | [Cheat Sheet #3][t03] |
| #4 | **Blandifiers** | Weak | No | [Cheat Sheet #4][t04] |
| #5 | **Compound offenders** | Weak | No | [Cheat Sheet #5][t05] |
| #6 | **Stacked triple** (rules of three) | Structural when habitual | Yes | [Cheat Sheet #6][t06] |
| #7 | **Colon-label header** | Structural when repeated | Yes | [Cheat Sheet #7][t07] |
| #8 | **Attribute to fog** | Weak (a Sourcing defect) | No | [Cheat Sheet #8][t08] |
| #9 | **Importance stamp, in place** ("That is what makes this") | Weak | No | [Cheat Sheet #9][t09] |
| #10 | **Seamless yes-but** | Structural when habitual | No | [Cheat Sheet #10][t10] |
| #11 | **Glossary-quote** | Structural when habitual | Yes | [Cheat Sheet #11][t11] |
| #12 | **Assert without mechanism** | Weak (an Accuracy defect) | No | [Cheat Sheet #12][t12] |
| #13 | **No owner** (no first person) | Weak | No | [Cheat Sheet #13][t13] |
| #14 | **Over-listing** | Weak | Only as a numbered scaffold (#17) | [Cheat Sheet #14][t14] |
| #15 | **Em-dash cadence** | Structural when even throughout | No | [Cheat Sheet #15][t15] |
| #16 | **Profundity beat** (staccato profundity-fragment) | Structural | Yes | [Penalty Gate, Step 1][t16] |
| #17 | **Numbered scaffold** | Structural (counted with #6) | Yes | [Penalty Gate, counting rules][t17] |
| #18 | **Importance stamp, before** ("Why this matters", "Why this works") | Structural | Yes (as throat-clearing) | [Two-Layer Read guardrail][t18] |
| #19 | **Mechanical balance** | Structural | No | [Strong AI signals][t19] |
| #20 | **Uniform paragraph shape** | Structural | No | [Strong AI signals][t20] |
| #21 | **No contractions in speech** | Structural, gated | No | [Strong AI signals][t21] |
| C1 | **Importance stamp, after** (validation tag: "and that matters") | Candidate | – | [Proposed below](#c1) |
| C2 | **Broken picture** (an image that falls apart when you picture it) | Candidate | – | [Proposed below](#c2) |
| C3 | **Default picks** (the model's stock word, image, or name, by genre) | Candidate | – | [Proposed below](#c3) |
| C4 | **Assistant residue** | Candidate | – | [Proposed below](#c4) |

IDs #1–15 match the [Cheat Sheet][cheat] numbering, and that numbering is fixed, since past scorecards
refer to tells by number. New tells take the next free number. A candidate gets a number only
once the rubric adopts it.

### Families

Some tells are the same move turning up in different places. Count each member by its own
rule. The family name is for reporting and for spotting the pattern.

- **Importance stamp:** asserting that something matters instead of showing why. It can sit
  *before* the point (#18, "Here's why this matters." / "Why this works:"), *in place of* the
  point (#9, "That is what makes this different."), or *after* it (C1, "…and that matters.").
  #9 and #18 are live; C1 is a candidate.
- **Balanced flip:** evenly weighted contrast used by default. Includes the sentence-level
  antithesis (#1), the seamless yes-but (#10), and paired structure (#19). Its whole-piece form
  is *too tidy* (see [Whole-piece reads](#whole-piece-reads)).

---

## Live tells

### #1 Balanced flip

- **What it is:** setting up a claim only to swap it for the "real" one. The rubric calls it
  the "It's not A. It's B." antithesis.
- **Looks like:** "It's not a tool. It's a mindset." · "This isn't about speed. It's about
  trust."
- **How to count:** each sentence pair that uses the move. Once in a piece is spice; twice or
  more is a pattern.
- **Human false positive:** contrast is classical rhetoric. Academic writing guides teach
  "they say X; I say Y" as the standard way to bring in your own claim. What gives it away is
  regular placement at every pivot, not the device itself.
- **Related:** #10 seamless yes-but and #19 mechanical balance belong to the same family.

### #2 Throat-clearing

- **What it is:** a phrase that announces a point without making it.
- **Looks like:** "Let me be clear." · "Here's the kicker." · "It's important to note that…"
  · a rhetorical question used as a transition.
- **How to count:** meta-signposts at seams go into density. Loose spoken filler that reacts
  to something live is left out (the [Penalty Gate][gate]'s v2.4 placement test).
- **Human false positive:** speakers clear their throats when they're thinking aloud. That
  kind is irregular and tied to events. The machine kind sits at every section seam.
- **Related:** #18 is a named subtype. The proposed C1 validation tag is the same move placed
  *after* a point.

### #3 Corporate speak

- **What it is:** business and tech jargon that adds nothing.
- **Looks like:** "game-changer", "leverage insights", "circle back".
- **How to count:** a Prose Craft note only.
- **Human false positive:** a lot of humans talk this way, especially in marketing.

### #4 Blandifiers

- **What it is:** intensifiers that claim importance without showing it.
- **Looks like:** "truly remarkable", "a plethora of options", "very unique".
- **How to count:** a Prose Craft note. Spoken hedges ("really", "pretty", "just") are speech
  tics, so give them little weight.
- **Human false positive:** common in casual human speech.

### #5 Compound offenders

- **What it is:** stock phrases that run several clichés together.
- **Looks like:** "Let's unpack this." · "At the end of the day…" · "In the grand scheme of
  things…"
- **How to count:** a Prose Craft note.

### #6 Stacked triple

- **What it is:** grouping items in threes (or more) by habit, padding the series even when
  every item is real.
- **Looks like:** "Faster, cheaper, and more reliable." · six roles listed where two would
  do.
- **How to count:** density. Habitual stacking is a structural signal. Numbered scaffolds
  (#17) count here too.
- **Human false positive:** the tricolon is one of the oldest devices in rhetoric, and
  academic prose uses it constantly. Weigh how often it appears and where it sits, not the
  device alone.

### #7 Colon-label header

- **What it is:** a catchy label followed by a colon and an elaboration, repeated at every
  level.
- **Looks like:** "Pivots and Practicalities: Turning Strategy into Action".
- **How to count:** density. One or two is fine; the same pattern at every level is
  structural. Leave out platform-generated chapter titles.
- **Human false positive:** book and paper titles use it legitimately. The giveaway is when it
  repeats at every scale.

### #8 Attribute to fog

- **What it is:** a claim credited to an unnamed source.
- **Looks like:** "Studies show…" · "Experts agree…"
- **How to count:** a Sourcing defect on Axis B. Check for companion sources first (the
  Companion-Source rule, v2.5) before calling it fog.
- **Human false positive:** everyday human shorthand.

### #9 Importance stamp, in place ("That is what makes this")

- **What it is:** telling the reader something is significant instead of showing why.
- **Looks like:** "That is what makes this release different."
- **How to count:** a Prose Craft note.
- **Related:** the importance-stamp family (#9, #18, C1).

### #10 Seamless yes-but

- **What it is:** a smooth good-news-then-bad-news pivot with no friction at the seam.
- **Looks like:** "That's the good news. However, there are still limitations."
- **How to count:** a Craft note. When habitual it supports the structural mechanical-balance
  signal (#19). Not in the density set.
- **Related:** the balanced-flip family (#1, #19).

### #11 Glossary-quote

- **What it is:** putting a term in quotes, then explaining why it matters, like a textbook
  glossary.
- **Looks like:** "This is what we call a 'gateway project.' It opens doors to…"
- **How to count:** density. Structural when habitual.
- **Human false positive:** teachers really do define terms this way. It is a tell when every
  new idea arrives in that wrapper.

### #12 Assert without mechanism

- **What it is:** a conclusion the reader can't trace back to how it works.
- **Looks like:** "The model performs extremely well on coding tasks."
- **How to count:** an Accuracy & Mechanism defect on Axis B.

### #13 No owner

- **What it is:** judgments with no person standing behind them.
- **Looks like:** "The results are promising." (Who says so?)
- **How to count:** a Prose Craft note.
- **Caution (v2.9.3):** first person being *present* is not evidence of a human. A first-person
  line only counts as human voice if it survives the tell sweep and is either separable from
  the scaffold or carries checkable lived detail. See [Strong human signals][human].

### #14 Over-listing

- **What it is:** a list where a paragraph would carry the logic better.
- **Looks like:** "Supports A, B, C, and D. Four-bit builds for E, F, and G."
- **How to count:** a Craft note. Step scaffolds count toward density as #17.

### #15 Em-dash cadence

- **What it is:** em dashes used at an even rhythm throughout written text.
- **Looks like:** "The model, which runs on one GPU, handles complex tasks" written with a
  dash on either side, sentence after sentence.
- **How to count:** structural only when the cadence is even throughout. It doesn't apply to
  pure speech transcripts.
- **Human false positive:** many careful writers, academics especially, use em dashes heavily.
  On its own it is weak.

### #16 Profundity beat

- **What it is:** a short, quotable fragment that lands like a revelation. The rubric calls it
  the staccato profundity-fragment.
- **Looks like:** "And that changes everything." · "Quietly. Permanently." · "The line I
  trust most is the one that cost them something to say."
- **How to count:** density. Count it **register-blind** (v2.9.3): writing one in the first
  person doesn't exempt it, and a beat starting with "I" is still a beat.
- **Human false positive:** speechwriters and preachers use the beat on purpose, at chosen
  moments. The machine places it on every emotional turn.

### #17 Numbered scaffold

- **What it is:** a step or layer structure laid over material that doesn't need one.
- **Looks like:** "The first layer… the second layer… the fourth layer…" · "First… Second…
  Third…"
- **How to count:** density, counted under #6 / #14 (v2.9.2). In receipts it is reported under
  its own alias.
- **Human false positive:** real procedures have steps. The question is whether the content
  is actually sequential.

### #18 Importance stamp, before ("Why this matters")

- **What it is:** a stock section opener that announces significance before saying anything.
- **Looks like:** "Here's why this matters." · "Why this works:" (often as a header) · "So why
  should you care?"
- **How to count:** density, as meta-signpost throat-clearing (#2). The [Two-Layer
  Read][twolayer] guardrail names it as one of the characteristic AI signatures that, together
  with a corroborator, can move an ambiguous read toward the AI pole.
- **Human false positive:** formula-trained YouTubers and journalists do this unprompted.
  That is why the guardrail requires a corroborator.
- **Related:** the importance-stamp family (#9, #18, C1).

### #19 Mechanical balance

- **What it is:** paired, evenly weighted structures with seams that never catch.
- **Looks like:** "On the one hand… on the other hand…" used as a default shape.
- **How to count:** a structural signal for Axis A. Not in the density set.
- **Related:** the balanced-flip family (#1, #10).

### #20 Uniform paragraph shape

- **What it is:** every paragraph built the same way and about the same length.
- **How to count:** a structural signal for Axis A, judged across the whole piece.
- **Human false positive:** templated house styles (newsletters, listicles).

### #21 No contractions in speech

- **What it is:** "does not / it is / here is" all the way through a script meant to be
  spoken.
- **How to count:** a structural signal with a **co-occurrence gate**. Under ~10% structural
  density it reads as a register choice and does not move Provenance. Under attested synthetic
  delivery it recalibrates to the written register (Delivery-Medium Gate, v2.5).
- **Human false positive:** formal registers, Simplified Technical English, writing for ESL or
  international audiences, accessibility passes.

---

## Candidate tells (proposed, not scored)

None of these count in a score until the rubric adopts them. C1, C2 and C3 draw on Dr.
Taylor Jones's video "How to Detect AI Slop" (Language Jones, `ORgKY9AlybA`); C1 also recurs in
scripts we have graded.

### <a id="c1"></a>C1 Importance stamp, after (validation tag)

- **What it is:** a short tag after a point that certifies the point is important, instead of
  letting it stand.
- **Looks like:** "…and that matters." · "…and that's the point." · "…and that's huge."
- **Family:** the importance stamp, with #9 (in place) and #18 (before).
- **Open question:** we've been counting these as throat-clearing (#2). Should C1 join the
  density set the way #18 does, or stay a Craft note like #9? It differs from #16 in being
  attached to a sentence rather than standing alone.
- **Human false positive:** speakers say "and that matters" for emphasis. Look at how often it
  appears and whether it falls at regular places.

### <a id="c2"></a>C2 Broken picture

- **What it is:** a figurative phrase built from words that often appear together, which falls
  apart the moment you try to picture it. Jones argues this is the most reliable sign of
  machine text, because a model handles strings, not concepts.
- **Looks like:** "two overarching pillars that undergird the framework" (pillars don't arch
  over anything, and nothing can both arch over and undergird) · "a toolkit that buys you
  something when you point it at a problem" · "nestled amid a year of war".
- **The picture test:**
  1. Find each figurative phrase.
  2. Name the literal image it calls up.
  3. Check that the verbs and modifiers fit that image, and that no two images in the same
     sentence collide.
- **Dead metaphors don't count.** Idioms nobody pictures any more ("rule of thumb",
  "deadline", "grasp an idea") pass automatically. The tell is a *live* image that gets
  mashed, not a fossil read too literally.
- **Run it as a procedure, not by feel.** An AI grader learned from the same text that makes
  "overarching pillars" sound normal, so a common broken picture can pass an intuitive read.
  Work through the three steps every time, and give real weight to a broken picture the
  requester flags. Run the test on the posted comment too.
- **Proposed tier:** corroborating only, never decisive alone. It would probably support
  Axis A, and it costs Prose Craft whoever wrote it.
- **Human false positive:** people who think incoherently produce the same signal. Jones's
  own example is a badly written magazine piece that turned out to be by a student. Deliberate
  human mixing ("you set them up, I just walked through them") is wordplay that knows what
  each idiom means, which is the opposite of the machine case.

### <a id="c3"></a>C3 Default picks

- **What it is:** the word, image, or name a model reaches for whenever a slot needs
  filling. The slot depends on genre, so the list is kept by genre.
- **Looks like** (as of 2026-11; these lists date quickly):
  - *Essays and explainers:* nuanced, delve, tapestry, testament to, navigate, landscape,
    multifaceted, honestly, actually, quietly, amid, gap, blueprint. Jones also names
    *buckets* and *gaps* (Gemini) and *toolkit* and *move* (Claude).
  - *Song lyrics:* neon, along with stock rain, city-light, and echo imagery.
  - *Short fiction:* the protagonist's name. *Luna* is the classic; *Elara* and *Lyra* are
    often reported too.
- **Open question:** the AI Art / Generative Media section (v2.6) says the Cheat-Sheet tells
  don't fire on lyrics. The lyrics list needs either an exception there, or a home in that
  section's own reads.
- **Proposed tier:** weak. Any one pick proves nothing, but a cluster corroborates. The essay
  list may belong under #4 Blandifiers.
- **Human false positive:** every one of these is an ordinary word or a real name, and the
  essay list is mostly reported impressions, not measured frequencies.

### <a id="c4"></a>C4 Assistant residue

- **What it is:** text left over from the chat exchange that produced the draft.
- **Looks like:** "Sure thing, here's an email with a cordial tone:" · "Great question!" at the
  top of a script · "I hope this helps."
- **Proposed tier:** strong corroboration for the AI pole when present, since it shows nobody
  read that line before shipping it. It is still not Automation Confirmation: it says nothing
  about the visuals, the description, or the rest of the artifact.
- **Human false positive:** rare, apart from a human quoting a chatbot or making a joke.

---

## <a id="whole-piece-reads"></a>Whole-piece reads

These are impressions of the piece as a whole. They can't be tallied sentence by sentence, so
they never feed the density ratio. They are craft findings (Axis B) and say nothing about who
wrote the piece.

- **Firehose Ceiling** (live, v2.12): breadth without depth. A flood of claims, nothing dwelt
  on. See the [Firehose Ceiling][firehose].
- **[The Politician's Answer][politician]** (live, v2.14): no editorial perspective. The words
  sound like they address the topic, but nothing lands. Its forms are the *firehose* (above),
  *water-treading* (too little, stretched to fill time), *too tidy* (every concern answered, no
  tension left), and *no throughline* (sections that don't build on each other). It fires on
  either of two probes:
  - **Stance test:** can you state one position the piece takes that a reasonable person could
    dispute? Truisms don't count.
  - **Landing test:** can you retell one point the piece actually developed? Repetition isn't
    development.

---

## Maintaining this file

- When the rubric adds, renames, or retires a tell, update this file in the same commit and
  note it in the rubric's changelog.
- Keep #1–15 in step with the Cheat Sheet numbering. Never renumber.
- Keep the "Matches rubric" line current.
- Links point at explicit `<a id>` anchors placed in the rubric (`tell-01` to `tell-21`,
  `cheat-sheet`, `penalty-gate`, `firehose-ceiling`, `politicians-answer` and the others in
  the link list at the bottom of this file). Treat those IDs as permanent. Reword a heading
  freely, but never rename or remove an anchor, and give each new tell its own `tell-NN`.
- When a candidate is adopted, give it the next free number, move it to Live tells, and add
  its rubric link.

[cheat]: ../AI-Detection-Scorecard-System.md#cheat-sheet
[gate]: ../AI-Detection-Scorecard-System.md#penalty-gate
[density]: ../AI-Detection-Scorecard-System.md#density-set
[floor]: ../AI-Detection-Scorecard-System.md#floor-gate
[strong]: ../AI-Detection-Scorecard-System.md#strong-ai-signals
[weak]: ../AI-Detection-Scorecard-System.md#weak-signals
[human]: ../AI-Detection-Scorecard-System.md#strong-human-signals
[twolayer]: ../AI-Detection-Scorecard-System.md#two-layer-read
[firehose]: ../AI-Detection-Scorecard-System.md#firehose-ceiling
[politician]: ../AI-Detection-Scorecard-System.md#politicians-answer
[t01]: ../AI-Detection-Scorecard-System.md#tell-01
[t02]: ../AI-Detection-Scorecard-System.md#tell-02
[t03]: ../AI-Detection-Scorecard-System.md#tell-03
[t04]: ../AI-Detection-Scorecard-System.md#tell-04
[t05]: ../AI-Detection-Scorecard-System.md#tell-05
[t06]: ../AI-Detection-Scorecard-System.md#tell-06
[t07]: ../AI-Detection-Scorecard-System.md#tell-07
[t08]: ../AI-Detection-Scorecard-System.md#tell-08
[t09]: ../AI-Detection-Scorecard-System.md#tell-09
[t10]: ../AI-Detection-Scorecard-System.md#tell-10
[t11]: ../AI-Detection-Scorecard-System.md#tell-11
[t12]: ../AI-Detection-Scorecard-System.md#tell-12
[t13]: ../AI-Detection-Scorecard-System.md#tell-13
[t14]: ../AI-Detection-Scorecard-System.md#tell-14
[t15]: ../AI-Detection-Scorecard-System.md#tell-15
[t16]: ../AI-Detection-Scorecard-System.md#tell-16
[t17]: ../AI-Detection-Scorecard-System.md#tell-17
[t18]: ../AI-Detection-Scorecard-System.md#tell-18
[t19]: ../AI-Detection-Scorecard-System.md#tell-19
[t20]: ../AI-Detection-Scorecard-System.md#tell-20
[t21]: ../AI-Detection-Scorecard-System.md#tell-21
