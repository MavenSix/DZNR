# Earning a sceptical author

Kevin, 2026-10-23: "Remember, they're authors and they are already leery of AI, so this has to be amazing.
So amazing, it starts to remove the skepticism."

An author who distrusts AI is not won by a feature list. They are won when the first thing they see is
their own world, made with care, built from their own sentences, and every decision is visibly theirs.
These eight rules make that checkable. They apply to every asset, scene and experience made for an author
(every Pulse OS job), on top of the Fidelity Gate and `quality-gate`, never instead of them.

Where they run: `quality-gate` runs these checks on author work after the Fidelity Gate and before it
scores. **Every trust check is a blocker.** One failure stops the asset from reaching the author.

---

## The rules, each with its test

### T1. The author's sentences are the material
Every scene, plate, portrait, relic and district carries the passage it came from, visibly: the quoted
sentence or two, with chapter and page or line, on screen beside the asset, not only in a manifest. An
experience shows the author's name and the author's own words first, before any DZNR or Pulse mark.
- **Test (fails if yes):** an asset shown to the author, or an element of the experience, has no visible
  quoted passage with its source; or the first screen of the experience shows anything before the
  author's name and an author sentence; or a quoted line is not in the manuscript word for word.

### T2. Nothing is decided without the author
Every pack, style, scene, structure and checkpoint is the author's choice, made in Pulse OS. Styles are
offered as two or three options, each with a still made in it from the author's own world, so the author
chooses by seeing (s2 of `pulse-os-artifacts`). Nothing proceeds on silence.
- **Test:** an asset was rendered from a pack version the author has not approved
  (`lore/pack-approval.json`); a style is used that is not the author's choice recorded in the pack (or
  the `style`/`styles` Pulse sent on the job); a scene shipped without its own checkpoint answer; or a
  checkpoint was answered by anyone but the author.

### T3. No generic AI look ever reaches an author
On author work every `quality-gate` failure mode is a blocker, not only the ones marked B. AI sheen (F1)
and meaningless spectacle (F6) are checked first and hardest: these are what an author already expects
AI to produce, and one instance confirms the suspicion.
- **Test:** any open F1 to F14 failure; or any dimension below 4; or the Fidelity Gate's "reads as generic
  stock output that could illustrate any book" is true.

### T4. Show provenance in plain words, and claim only what is guaranteed
Each asset says, in one or two plain sentences an author can read: what made it (the tools by name, such
as "a Midjourney V8.2 still, type set by hand in Figma, animated with Wan 3.0"), that it was made for this
book, from these passages, and kept in this book's project. On confidentiality, say exactly what DZNR OS
guarantees and nothing more:
- Every DZNR OS API job is **confidential unless Pulse OS sends `"confidential": false`**.
- A confidential job's run uses **no aggregator** (no RunningHub, no Higgsfield driver), and no other
  vendor answers for Claude.
- The author's files are written to **this project's folder** (`inputs/<job id>/`) and are inputs only:
  they are never listed among outputs or served back by the API.

DZNR does not make a "never used to train AI" claim. Pulse OS may make one only where its own terms and
the named vendors' terms guarantee it, and then it names the source.
- **Test:** an asset reaches the author with no provenance line; a provenance line names a tool that did
  not make the asset; or any confidentiality or training claim goes beyond the three guarantees above
  without a cited source that guarantees it.

### T5. Offer restraint
The author can always choose a quieter treatment: fewer effects, text-led. Every pack offers it as an
option (stills instead of motion, cuts instead of camera travel, sound off, the author's text as the
largest element on screen), and every experience has it as a mode the author can make the default.
- **Test:** the s2 pack draft offers no quieter option; or the experience has no text-led mode; or
  choosing it leaves effects the author turned off.

### T6. The first impression is their world, at the bar
The first frame an author sees from DZNR, in Pulse OS, is their own world rendered at SHIP: a plate from
their pack with their sentence set beside it. Never a menu, a form, a template, a loader on its own, a
draft or a half-finished frame.
- **Test:** the first frame shown to the author is not of their world; or it scored below SHIP; or any
  frame shown to the author at any point is a draft below SHIP, a placeholder or a generic sample.

### T7. No face before the author settles it
A character's face, body or look is never on screen until the author has settled it: the canon gives it
without contradiction or the author has ruled, and the identity is locked at s3. Open canon questions
that touch a character's look block every render that would show it. Until then, scenes show the place,
an object, or the character unseen (from behind, in shadow, out of frame) and say why.
- **Test:** a frame shows a character whose look has an `open` or `deferred` question in
  `lore/questions.json`, or whose identity the author has not locked; or the option stills at s2 show a
  character at all.

### T8. The author can remove anything
Every asset, scene, district, line of in-world copy and sound can be removed by the author in Pulse OS.
Removal reaches DZNR as the author's answer (a checkpoint `revise` or a pack `revise` with a note naming
what goes, or a ruling) and is recorded in the pack or the scene index. Nothing removed comes back.
- **Test:** an item the author removed appears in any later output; or an experience element exists that
  Pulse OS offers no way to remove.

---

## In the scorecard

Add this block to the `quality-gate` scorecard on author work:

```markdown
## Author trust (author work only; every line a blocker)
| # | Rule | Result | Evidence |
|---|---|---|---|
| T1 | The author's sentences are the material | pass / FAIL | {passage shown, source} |
| T2 | Nothing decided without the author | | {pack_version approved, style choice, checkpoint} |
| T3 | No generic AI look | | {F1 and F6 first; every F a blocker} |
| T4 | Provenance in plain words | | {the provenance line; claims within the three guarantees} |
| T5 | Restraint offered | | {the quieter option or mode} |
| T6 | First impression at the bar | | {first frame and its score} |
| T7 | No face before it is settled | | {questions touching looks; identity locks} |
| T8 | The author can remove anything | | {removals honoured} |
```

## Who owns what

| Rule | Owner |
|---|---|
| T1, T4 (the words) | Morpheus, with Cheetara for the passage citations |
| T2, T7 | Cheetara (`author-world-authority`, `lore-engine`) |
| T3, T6 | Gandalf (`quality-gate`) |
| T5 | Gibson (the quiet mode), Neo (builds it) |
| T8 | Neo (the removal path in the export), Gibson (in the experience) |

Pulse OS's own interface carries these rules to the author: see
`immersive-world-site/references/pulse-integration.md`.
