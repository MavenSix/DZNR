---
name: lore-engine
description: >
  The canon and consistency engine for an AUTHOR'S world (Pulse OS jobs above all). Takes any mix of
  manuscript chapters, session transcripts, notes, a creative brief and a project record, normalises them
  into a clean corpus without touching the author's originals, builds a graphify lore graph over it (deep
  mode, then --update so a new chapter re-extracts only what changed), and turns graph plus passages into
  canon.json and a readable world-bible.md where every fact cites its source file and passage. Then runs
  the check nobody ships: one entity with conflicting values across sources, timeline contradictions, a
  world rule stated then broken, graphify's AMBIGUOUS edges, near-duplicate entities that may be one, and
  gaps the art will need that the text never gives. Writes questions.md (numbered, passages quoted, a
  proposed answer, the renders that wait) and records the author's answers in rulings.md, which win over
  the text from then on. Never answers a canon question itself. Everything lives in the project's lore/
  folder so author-world-authority and every later job read it. Triggers before an author world pack is
  drafted, whenever a Pulse OS job brings new chapters, sessions or notes, and on "check the canon",
  "continuity check", "world bible for", "canon questions" or an author's answer to one.
---

# Lore Engine

The author-world counterpart of a continuity department. `author-world-authority` fixes **fidelity**: the
world on screen is the world on the page. That promise is only as good as the canon underneath it, and an
author's canon is never clean. Chapter 3 puts the scar on the left cheek and chapter 19 on the right. A
session in March says the lighthouse keeper is Ada's uncle and a note in May says father. The brief says
1970s and the cars in chapter 2 are from the 1990s. The text never says what the main character looks
like, and the portrait has to.

This engine finds every one of those before a render does, and asks the author. It never decides. The
prime directive is the same as the authority's: **the author is the director.** Agents propose, the author
decides, and an answer the engine guessed is a canon violation waiting in every asset that used it.

No maintained open-source consistency checker for fiction exists (DZNR research, 2026-10-21). graphify
gives the graph; the canon, the checks and the questions are this skill.

---

## Where Everything Lives

Pulse OS sends an author's files through the DZNR OS API, and they land in the job's project folder under
`inputs/<job-id>/`. The engine reads them there and writes only under `lore/`:

```
<project>/
  inputs/<job-id>/...            the author's originals. Read only, never edited, renamed or moved.
  lore/
    sources.json                 one row per corpus unit: original path, kind, order, date, body hash
    corpus/
      chapters/ch-001.md ...     one file per chapter (or scene, for a long chapter)
      sessions/2026-10-03.md ... one file per session transcript
      notes/2026-10-05-note.md   notes and corrections, one per note
      brief/brief.md             the creative brief
      brief/project-record.md    logline, themes, world mechanics, key entities, open questions
    graphify-out/                graphify's own outputs (graph.json, GRAPH_REPORT.md, graph.html, cache)
    canon.json                   the canon, machine-readable (references/canon-schema.md)
    world-bible.md               the canon, readable, every fact cited
    questions.md                 open canon questions for the author, numbered
    rulings.md                   the author's rulings, appended and dated, never edited
```

The corpus is cumulative across jobs: a new job adds units or replaces the units it revises, and nothing
else in `lore/` is rebuilt from scratch. `sources.json` sits outside `corpus/` so graphify never extracts
it.

---

## Fixed Rules

- **The originals are never touched.** Normalising copies text into `lore/corpus/`; it does not edit,
  rename, move or delete anything under `inputs/`.
- **The engine never resolves a canon question.** It proposes an answer and says what waits. Only the
  author's words become a ruling.
- **A ruling wins over the text from then on.** The next run treats a ruled item as settled and does not
  ask it again, unless a new passage contradicts the ruling (then it is a new question citing the ruling).
- **The graph points at passages; the passages are the canon.** No fact enters canon.json without a quoted
  passage and its citation. A graph edge with no passage behind it is a lead, not a fact.
- **Only the author's words are claims.** In a session transcript, the Pulse assistant's lines (Scribe,
  Quill, Bishop) are never claims. An assistant suggestion the author accepts becomes the author's
  statement, citing both lines.
- **Later author word beats earlier author word.** A correction or session dated after an earlier session
  or note supersedes it on the same point. That is reported as resolved, not as a conflict.
- **The text does not overrule itself by date.** Two chapters that disagree are a conflict whatever order
  they arrived in. Only a revised version of the same chapter replaces the old one.
- **Only the subject a question touches waits.** Every question names the renders it holds; nothing else
  waits on it.
- **No em or en dashes** in anything the engine writes for the author (Pulse's voice rule).

---

## The Run

Run in this order. A later run repeats the same steps and does only the work that changed.

### 1. Normalise (free, deterministic)

Turn `inputs/<job-id>/` into one Markdown file per source unit in `lore/corpus/`, with frontmatter:

```
---
source: inputs/job-7f3a/manuscript-v2.docx
locator: "Chapter Three"
order: 3
kind: chapter            # chapter | session | note | brief
pov: Ada Pruitt          # when the chapter states or clearly holds one; omit when unknown
date: 2026-10-14         # the session or note date; for a chapter, the date this version arrived
speaker: author          # notes and corrections: who wrote it
captured_at: 2026-10-14  # same as date; one of the four frontmatter fields graphify copies onto nodes
author: Jo Hale          # the author's name; also copied onto nodes by graphify
---
```

- **Units.** A manuscript splits at its chapter headings. A chapter over about 6,000 words splits again at
  its scene breaks (`ch-003-s1`, `ch-003-s2`), so one unit stays inside one graphify subagent's reading.
  Sessions, notes and corrections are one unit each. The brief and the project record are one unit each.
  The project record (`logline`, `themes`, `world_mechanics`, `key_entities`, `open_questions`) is written
  out as headed Markdown, one heading per field.
- **Body.** The text verbatim, converted to Markdown: Markdown and plain text copy as they are; `.docx` and
  `.rtf` convert with the machine's converter (pandoc where it is installed, `textutil -convert txt` on the
  Mac). A file the machine cannot convert goes back to the job as a question; it is never retyped or
  summarised. One paragraph per block, blank line between blocks, so paragraph numbers (`¶`) are stable.
- **Speakers.** Session transcripts keep each line's speaker label (`AUTHOR:`, `QUILL:`).
- **Stable files.** Write a corpus file only when its body changed. graphify's incremental update decides
  what to re-extract from file hashes (for Markdown, the body below the frontmatter), so rewriting an
  unchanged chapter would make it pay to re-extract text it already has. A frontmatter-only change (a POV
  added later) costs nothing.
- **Revisions.** A new version of a chapter replaces its unit's file. A question whose only passages were
  in the old text is withdrawn on the next run, with the reason.

Record every unit in `sources.json` (fields in `references/canon-schema.md`).

### 2. Build or update the lore graph (graphify)

Exact commands, the node-typing post-pass, and graphify's real limits are in
`references/graphify-run.md`. In short, from the project's `lore/` folder:

- **First run:** `/graphify corpus --mode deep`. Deep mode, because prose relations are mostly implied and
  deep mode is graphify's thorough setting for INFERRED edges, marking uncertain ones AMBIGUOUS instead of
  dropping them.
- **Every later run:** `/graphify corpus --update --mode deep`. Only new or changed units are re-extracted;
  a deleted unit's nodes are pruned. With nothing changed graphify says so and the engine goes straight to
  step 3 on the graph it has.

graphify cannot be told fiction's node types. Its extraction prompt is fixed (every node's `file_type` is
one of six code-and-document values, every edge one of a fixed relation list), so the engine leaves that
prompt as graphify ships it and assigns the types itself in a post-pass: **character, place, group, object,
rule, event**.

### 3. Build the canon

From the typed graph and the corpus passages (schema in `references/canon-schema.md`):

1. **Resolve entities.** graphify keys a node by its file, so Ada in chapter 1 and Ada in chapter 3 are two
   graph nodes. Group nodes into one canon entity by name, title and stated alias, with the passages that
   make the link. Anything less certain stays two entities and becomes an alias candidate (check e).
2. **Attributes with citations.** For each entity, read every passage that describes it and record each
   claim: the attribute (eye colour, apparent age, a scar's side, a place's geography), the value, the
   quoted passage, its unit and `¶`, its authority (text, author statement, brief, ruling), its date, and
   the story point it holds from (a scar acquired in chapter 5 is a change from chapter 5, not a conflict
   with chapter 2).
3. **Relations.** Who belongs to which group, lives where, owns what, is kin to whom, which place is beside
   which. Each relation cites its passages; the graph edge that pointed at it is kept as a reference.
4. **Timeline.** Events with the order or time the text states (a date, "the spring after the flood", an
   age), their place and who is present, kept apart from the order the chapters tell them in.
5. **Apply rulings.** Every ruling in `rulings.md` settles its attribute, relation or event. The text's
   claims stay in canon.json as history; the ruling is the value.

Claims from units that did not change are carried over from the previous canon.json by body hash; only new
and changed units are re-read.

### 4. Check consistency

Six checks, each defined with its edge cases in `references/consistency-checks.md`:

| | Check | Flags |
|---|---|---|
| a | Attribute conflicts | One entity, one attribute, incompatible values across sources, with no change the text explains |
| b | Timeline contradictions | Events in two orders, an age that does not fit the dates, one person in two places at one story time |
| c | Rule violations | A world mechanic stated, then broken without the text marking the break |
| d | AMBIGUOUS edges | Every graphify edge marked AMBIGUOUS between two canon entities, read against its passages |
| e | Alias candidates | Two entities that may be one: name overlap, matching attributes, never in the same scene |
| f | Gaps | An attribute the art will need that no source gives, for a main entity |

Before anything becomes a question, the date ranking runs: a later author statement that supersedes an
earlier one on the same point is **resolved** and reported as such; a point a ruling settles is **settled**
and not asked. What is left is a question.

### 5. Write the outputs

- `canon.json`: the full canon, every claim, every question's state.
- `world-bible.md`: characters, places, groups, objects, rules and the timeline, each fact with its
  citation, and each open point marked with its question number. Layout in `references/canon-schema.md`.
- `questions.md`: regenerated each run with stable numbers (Q7 stays Q7 across runs; a new question takes
  the next number). Format in `references/questions-and-rulings.md`.
- `rulings.md`: never rewritten. The engine only appends, and only the author's answers.

Then report in plain language: units added or changed, entities, open questions by kind, what resolved
since the last run, and graphify's token cost for the run (from `graphify-out/cost.json`).

---

## Recording a Ruling

When the author answers a question (a Pulse OS job reply, a session line, a direct message):

1. Append a ruling to `rulings.md`, dated, citing the question number, with the author's words verbatim.
   "Go with your proposal" is a ruling: record the proposal as the value and quote the author's words.
2. Re-run steps 3 to 5 with no graphify run (the corpus did not change). The ruled item moves to
   "Settled by ruling" in questions.md and its value enters canon.json and the bible.
3. Tell whoever was waiting that the subject is clear: the renders the question held can go ahead.

A ruling is changed only by a later ruling that names the one it replaces. Neither the engine nor any agent
edits or removes a ruling.

---

## How Other Skills Use It

- **`author-world-authority`** reads `canon.json` and `rulings.md` before drafting a pack and before every
  render: the canon each subject renders from, and the rulings that override the text. A subject with an
  open question in `questions.md` waits; the authority asks through those numbers instead of asking again.
- **The three generators** cite canon.json entries and rulings in each node record's `canon_refs`.
- **The Fidelity Gate** checks a render against the subject's canon entry and its rulings.
- **Sherlock's World Bible** in `pulse-os-artifacts` starts from `world-bible.md` and `questions.md`.
- **Any later job** on the same project reads `lore/` first and runs the engine again only when new inputs
  arrived.

---

## Reference Files

- `references/graphify-run.md`: the exact graphify commands and options, the node-typing post-pass, and
  what graphify's real behaviour means for this design. Read before step 2.
- `references/canon-schema.md`: `sources.json`, `canon.json` and the `world-bible.md` layout.
- `references/consistency-checks.md`: the six checks, the date ranking, and the cost-of-waiting map.
- `references/questions-and-rulings.md`: the formats of `questions.md` and `rulings.md`.
- `references/example.md`: a worked example on an invented two-chapter snippet, with the exact
  questions.md items it produces.
