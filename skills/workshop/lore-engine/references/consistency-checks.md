# Consistency Checks

The six checks the lore engine runs after the canon is built, the date ranking that runs before any of
them becomes a question, and the map from a question to the renders that wait on it.

---

## Before the checks: authority and the date ranking

Every claim carries an authority and a date (`canon-schema.md`). Apply these in order:

1. **A ruling settles it.** An attribute, relation or event a ruling decided is `settled`. It is not
   checked against the text again. A passage that arrives after the ruling and contradicts it is a new
   question citing the ruling ("the text added in ch-014 says green; your ruling R1 says grey").
2. **A later author statement supersedes an earlier one.** Among `author` claims (session lines and notes
   the author wrote) on the same point, the latest by date wins. The earlier one is `resolved`, reported
   under "Resolved by the author's later word" with both passages quoted, and is not a conflict.
3. **The text does not overrule itself by date.** Two `text` claims that disagree are a conflict whatever
   dates the chapters arrived. Only a revised version of the same unit replaces the old text.
4. **Author statement against the text is a question.** The author is the director, but a render cites
   the text. The question proposes the author's latest statement and asks whether the text will change.
5. **Brief against the text is a question.** The brief and the project record are author-written but
   general; a specific passage that disagrees is asked, with the passage as the proposed answer unless the
   brief is newer and specific.
6. **A collaborator's words are not claims.** Lines by the Pulse assistant, an editor or anyone not the
   author are leads only, never claims, unless the author accepted them in the same transcript.

What survives the ranking is checked.

---

## a. Attribute conflicts

One entity, one attribute, two or more claims whose values cannot both be true.

- **Normalise before comparing.** Colours to a plain name (hazel and brown are close; grey and green are
  not), sides to left or right as the character's own, ages to a number at a story point, heights to a
  rough scale, geography to relations (`north_of`, `across_from`, a distance).
- **Changes the text explains are not conflicts.** A scar acquired in a fight, hair dyed, a town rebuilt
  after the flood: record the attribute as `changed` with `from_order` on each claim.
- **Viewpoint is not a fact.** "She thought his eyes looked black in that light" is a weaker claim than
  "his eyes were blue". A POV character's misjudgement the text marks as such is not a conflict.
- **Vague against specific is not a conflict.** "Dark hair" and "black hair" agree.
- Flag: entity, attribute, every claim with its quote and citation.

## b. Timeline contradictions

- **Order.** Event A stated before B in one passage and after it in another, by stated story time (not by
  the order chapters tell them: a flashback is legal).
- **Ages against dates.** An age at a dated point that does not fit a stated birth year or an age stated
  at another dated point, allowing for the year's turn.
- **Two places at once.** A character `present_at` two events at the same anchored story time in places
  the text keeps apart, or a journey shorter than the text's own stated travel time allows.
- **Dead and walking.** An entity acting after the event the text states ended it, with no return the text
  explains.
- Flag only when both ends carry a story-time anchor or a relative anchor that chains to one. Unanchored
  sequences are not checked; the timeline marks them unanchored.

## c. Rule violations

A rule entity holds a stated mechanic ("no one crosses the salt line after dark and lives"). For every
event that touches what the rule governs:

- The text marks the break (a character remarks on it, the story turns on it, it is called a miracle or a
  cheat): not a violation. Record the event with `breaks: rule.x` as part of the canon.
- The text does not mark it: a violation. Flag the rule's passage and the event's passage.
- A rule stated twice with different terms (after dark; after the tide turns) is an attribute conflict on
  the rule's statement (check a), not a violation.

## d. AMBIGUOUS edges

Read every edge in `graphify-out/graph.json` whose `confidence` is `AMBIGUOUS` (graphify's own flag for a
relationship its extractor was unsure of).

- Map both endpoints through canon.json's `graph_nodes` map. An edge where either end is `other` (a theme,
  a mood) is dropped: it is a reading, not canon.
- Read the passages in the edge's `source_file` that hold both subjects. When the passages state the
  relation, it enters canon with its citation and no question. When they leave it open, it is a question,
  worded as the story question the edge points at ("Is Tobias Wren Ada's father, or her uncle?"), never as
  a graph term.
- Several AMBIGUOUS edges between the same two entities are one question.
- Ask only when the relation matters to a render or to the timeline (who stands with whom, who owns what,
  who is kin to whom on screen). The rest are listed under "For the record" in questions.md, unnumbered,
  so they cost the author nothing.

## e. Alias candidates

Two entities that may be one. Score each pair on these signals; two or more make a candidate:

- **Name overlap**: one name contains the other ("Tobias" and "Tobias Wren"), a title and a surname ("the
  keeper" and "Keeper Wren"), a nickname the text uses elsewhere, an initial.
- **Matching attributes**: the same stated looks, age, role or place, with nothing contradicting.
- **Never together**: the two never appear in the same scene, and one appears where the other would be
  expected.
- **graphify's signal**: a `semantically_similar_to` edge between their nodes, or graphify's update having
  merged nodes of both names.

Never merge a candidate. Ask, with the passages for each name and the evidence for and against. Until the
ruling, both stay separate entities and neither identity is locked. The reverse case (one name that seems
to be two people, because its claims conflict in a pattern) is asked the same way.

## f. Gaps the art will need

For each main entity (`canon-schema.md`, `main`), every attribute in its type's render needs that no claim
fills and no ruling settles is a gap:

| Type | Render needs |
|---|---|
| character | apparent age, build and height, hair, eye colour, skin, typical clothing |
| place | era and period, kind of place, scale, geography (what is beside what, what is visible), light and weather, landmarks |
| group | dress or insignia, colours, size, where they gather |
| object | what it is, size, material, colour, condition |
| rule | how it shows on screen, when a scene composition depicts it |
| event | when, where, who is present |

- Distinguishing marks are not a gap: none stated renders none. A mark the text gives is canon like any
  other attribute.
- One question per entity, listing every missing need, so a silent character costs the author one answer,
  not six.
- Ask only what a planned render needs: a main character's face is always needed; a minor character's eye
  colour is not, until a scene composition puts them in close-up.
- The proposed answer comes from the evidence: the brief, the tonal references, the era and place, the
  character's family, and says so. It is still only a proposal.

---

## What waits: the cost of leaving it open

Every question says which renders wait, in `pulse-os-artifacts` stage terms, and says that nothing else
does. The map:

| Question touches | Waits |
|---|---|
| A character's look (any render need) | s3: that character's hero portrait, turnaround, expression sheet and identity lock; s6: plates and clips that show them |
| A character's age at a story point | s3 for the age they are first rendered at; s5 and s6 scenes in the affected stretch |
| A place's look or geography | s4: that location's Layer 1 block, establishing shot and reference lock; s6 plates set there |
| An object | s6: plates and clips where it appears; s3 or s4 when it is part of a character's or place's sheet |
| A group's dress or colours | the author world pack's group language (s2) and every member's sheet in s3 |
| A rule | s5: scene compositions that show the mechanic; s6 assets for those scenes |
| A timeline point | s5 and s6 for the scenes in the affected stretch |
| An alias candidate | s3 identity lock for both names (a lock on the wrong identity costs every later render) |
| An AMBIGUOUS relation | the scenes that show the two together (s5, s6), and kin likeness in s3 when the relation is kin |

Questions in `questions.md` are ordered by this cost: what blocks an identity lock first, then what blocks
a location, then scenes, then the rest.
