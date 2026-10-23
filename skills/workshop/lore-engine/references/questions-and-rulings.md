# questions.md, rulings.md and their JSON forms

The two files the author reads. `questions.md` is what the engine asks; `rulings.md` is what the author
answered. Both are written for the author: plain language, no graph terms, no em or en dashes.

Each has a machine form beside it, for Pulse OS, which shows the author the questions and takes their
answers through the DZNR OS API: `questions.json` (the engine writes it, with questions.md, on every run)
and `rulings.json` (Pulse OS appends to it when the author answers in Pulse). The pairs say the same
thing; the shapes are fixed below because DZNR OS reads and writes them.

---

## questions.md

Regenerated on every run from canon.json's question register. Numbers are stable: Q4 is Q4 on every run
until it is settled, resolved or withdrawn, and a number is never reused.

### Layout

```markdown
# Canon questions: <Title>

<Author>. Run of <date>, from <n> chapters, <n> sessions, <n> notes and the brief.
<n> open. <n> resolved by your later word. <n> settled by your rulings.

Answer any of these by its number, in your own words. "Go with the proposal" is an answer too.
Nothing is decided until you say so; only the renders listed under each question wait.

## Open

### Q<n>. <Subject>: <the point, in the story's words>
...

## Resolved by your later word

### Q<n>. <Subject>: <the point>
...

## Settled by your rulings

- Q<n>. <Subject>: <the point>. <Value> (R<n>, <date>).

## Left open by you

- Q<n>. <Subject>: <the point>. Not asked again until new sources touch it (R<n>, <date>). <What still waits.>

## Withdrawn

- Q<n>. <Subject>: <the point>. <Why: the passage is no longer in the text, as of <unit> revised <date>>.

## For the record

<Unnumbered: AMBIGUOUS links that touch no render, listed so nothing is hidden.>
```

For a Pulse OS job the line under the counts names where to answer: "Answer these in Pulse OS, where they
are waiting for you." The author answers there, by number, and Pulse OS writes the answer to
rulings.json; nobody asks the author anywhere else.

### One open item

```markdown
### Q1. Ada Pruitt: eye colour

Two chapters give different colours.

> "Ada's eyes were the grey of the flats at low tide, and they gave nothing away." [ch-001 ¶3]

> "Her eyes, green as bottle glass, did not leave the water." [ch-002 ¶3]

**Proposed answer:** grey. Chapter 1 describes her eyes closely and on purpose; chapter 2's line may be a
slip. Your call.

**If it stays open:** Ada's hero portrait, turnaround, expression sheet and identity lock wait (s3), and so
does any plate that shows her face (s6). Places, objects and other characters go ahead.
```

Every open item has, in this order:

1. **Heading**: number, subject, and the point in the story's words.
2. **One line** saying what kind of question it is in plain words (two chapters disagree; a session and a
   chapter disagree; the text never says; two names may be one person; a rule is broken; the order of
   events does not fit).
3. **The passages**, quoted verbatim, each with its citation. Every passage the question rests on, and no
   others.
4. **Proposed answer**, with the reason in one or two sentences and "Your call."
5. **If it stays open**: the renders that wait, from the map in `consistency-checks.md`, and a plain
   statement of what goes ahead.

### One resolved item

```markdown
### Q4. Tobias Wren: how he is related to Ada

Resolved by your later word, so nothing to answer.

> AUTHOR: "Tobias is Ada's uncle, her mother's brother." [session 2026-10-03 ¶3]

> "Correction to the session on the 3rd: Tobias is Ada's father, not her uncle. She doesn't know it yet."
> [note 2026-10-09 ¶2]

**Canon now:** Tobias Wren is Ada's father, and Ada does not know it [note 2026-10-09 ¶2]. Tell me if that
is wrong.
```

A resolved item quotes both statements, the earlier first, and says what canon now holds. It is listed
once, on the run where it resolved, and then moves to the bible.

---

## rulings.md

Append only. The engine adds an entry when the author answers a question (directly, or in Pulse OS through
rulings.json), and never edits or removes one.
A ruling changes only through a later ruling that says which one it replaces.

### Layout

```markdown
# Rulings: <Title>

The author's answers to canon questions. Each one wins over the text from its date on.

## R1. 2026-10-22. Answers Q1: Ada Pruitt, eye colour

**Ruling:** grey.

**In the author's words:** "Q1 grey, chapter two is a slip."

**Received:** Pulse OS (key salt-road-studio).

**Overrides:** "green as bottle glass" [ch-002 ¶3].
```

Every entry has:

- **Heading**: `R<n>`, the date, the question it answers, its subject and point.
- **Ruling**: the value, as short as canon.json holds it.
- **In the author's words**: verbatim. When the author accepted the proposal ("yes, go with that"), quote
  that and put the proposal's value under Ruling.
- **Received**: where the answer came from: `Pulse OS (key <name>)` when the author answered in Pulse,
  otherwise a session and its line, or a message.
- **Overrides**: each passage the ruling overrides, with its citation, or "nothing; the text was silent"
  for a gap.
- **Replaces** (only when it does): the earlier ruling it supersedes, `Replaces R<n>`.

A ruling with no question (the author volunteers "by the way, Ada is left-handed") gets a ruling number,
"Answers: none, volunteered" in the heading, and the same fields.

### A deferral

The author may decline to answer yet. That is a ruling too: it keeps the question open, and the engine
does not ask it again until a new or changed source touches its subject. Residue's R3 is the model:

```markdown
## R3. 2026-10-21. Answers Q2, Q3 and Q6: left open by the author

**Ruling:** not answered. The protagonist's name and look (Q2), the Totem (Q3) and what overstaying the
hologram time limit does (Q6) are unexplored. They stay open, are not asked again until new sources touch
them, and the renders listed under each keep waiting.

**In the author's words:** "the 5 questions above, I haven't explored yet. It was my test project for
Pulse OS"

**Received:** Kevin, in the DZNR OS session, 2026-10-21.

**Overrides:** nothing.
```

A deferred question's renders keep waiting; a deferral is never a licence to guess.

---

## questions.json

Written beside questions.md on every run, from the same register, so the two never disagree. It holds
every question the register has ever numbered: a question resolved by a later source, ruled or deferred
stays listed with its status, so Pulse OS can show the author what was asked and what became of it.

```json
{
  "version": 1,
  "project": "The Salt Road",
  "generated_at": "2026-10-21T15:04:00Z",
  "questions": [
    {
      "id": "Q1",
      "kind": "conflict",
      "subject": "Ada Pruitt",
      "question": "What colour are Ada's eyes? Chapter 1 says grey and chapter 2 says green.",
      "passages": [
        { "source": "ch-001", "paragraph": 3,
          "quote": "Ada's eyes were the grey of the flats at low tide, and they gave nothing away." },
        { "source": "ch-002", "paragraph": 3,
          "quote": "Her eyes, green as bottle glass, did not leave the water." }
      ],
      "proposal": "Grey. Chapter 1 describes her eyes closely and on purpose; chapter 2's line may be a slip.",
      "blocks": ["s3: Ada Pruitt portrait, turnaround, expression sheet, identity lock",
                 "s6: plates that show Ada's face"],
      "status": "open",
      "ruling": null
    }
  ]
}
```

- `version`: 1. A change to the shape is a new version, agreed with DZNR OS first.
- `project`: the project's name, as canon.json's `project.name`.
- `id`: the register's number. Stable across runs: an existing question keeps its id, a new one takes the
  next number, and a number is never reused.
- `kind`: the check that raised it: `conflict` (a), `timeline` (b), `rule` (c), `ambiguous` (d), `alias`
  (e), `gap` (f).
- `subject`: the entity or point it is about, by name, in the story's words.
- `question`: one or two plain sentences the author can answer without opening questions.md.
- `passages`: every passage it rests on, verbatim. `source` is the short citation (`ch-002`,
  `session 2026-10-03`, `note 2026-10-09`, `brief`); `paragraph` is the `¶`, or null when the source has
  no stable paragraph (a project record field). A gap has the passages that come closest, or none.
- `proposal`: the proposed answer with its reason, or null when the engine has no grounds to propose one.
- `blocks`: the renders that wait, from the map in `consistency-checks.md`. Empty for a question that
  touches no render.
- `status`: `open` (asked, waiting); `resolved` (a later source settled it, or the passages it rested on
  left the text; questions.md says which); `ruled` (an `answer` or `accept_proposal` ruling settled it);
  `deferred` (the author chose not to answer yet; not asked again until new sources touch it).
- `ruling`: the ruling's text for a `ruled` or `deferred` question, from rulings.json; null otherwise.

The file is rewritten whole on each run. One other writer is allowed, and only for two fields: when the author
answers in Pulse OS, DZNR OS records the answer in rulings.json and rulings.md and, in the same step, sets the
answered questions' `status` and `ruling` here, so Pulse OS shows the answer at once instead of after the next run.
The engine still treats rulings.json and rulings.md as the record: on its next run it derives every status from
them and rewrites the file, so a status set this way is confirmed, never trusted on its own.

---

## rulings.json

The machine form of rulings.md. Pulse OS appends to it when the author answers in Pulse (through the
DZNR OS API); the engine appends to it when a ruling arrives another way. The engine reads it, with
rulings.md, at the start of every run.

```json
{
  "version": 1,
  "rulings": [
    {
      "id": "R1",
      "at": "2026-10-22T09:12:00Z",
      "answers": ["Q1"],
      "decision": "answer",
      "ruling": "Grey.",
      "author_words": "Q1 grey, chapter two is a slip.",
      "received": "Pulse OS (key salt-road-studio)"
    }
  ]
}
```

- `id`: `R<n>`, the next number after the highest in rulings.json and rulings.md together.
- `at`: when the author answered, ISO 8601.
- `answers`: the question ids it answers (one ruling may answer several, as R3 does). Empty for a
  volunteered ruling.
- `decision`: `answer` (the author's own value, in `ruling`); `accept_proposal` (the question's proposal
  becomes the value; when `ruling` is empty the engine takes the proposal as it stood in questions.json);
  `defer` (not answered yet: the question stays open, is not re-asked until new sources touch it, and its
  renders keep waiting).
- `ruling`: the value, as short as canon.json holds it.
- `author_words`: the author's words, verbatim.
- `received`: where the answer came from: `Pulse OS (key <name>)` when the author answered in Pulse, the
  name being the DZNR OS API key the answer arrived under; otherwise as rulings.md says it (a session and
  its line, a message).

### The two files say the same

Both files are append-only, and both say the same rulings. On every run, before building the canon:

1. **Read both.** A ruling in rulings.json with no entry in rulings.md is written into rulings.md in the
   layout above, same id, with `Received` and `In the author's words` from the JSON. A ruling in
   rulings.md (one given in a DZNR OS session, say) with no entry in rulings.json is appended to
   rulings.json. Neither file loses or rewrites an entry.
2. **If they disagree** (one id with different content, or two rulings on one question with different
   values and no `Replaces`), the later entry wins: rulings.json's `at` against the rulings.md heading's
   date, and the later line in its file when the dates tie. The engine applies the winner, appends nothing
   that hides the loser, and reports the disagreement in its run report and in the job's final answer,
   naming both entries, so a person can settle it with a ruling that says which it replaces.
3. **Apply.** `answer` and `accept_proposal` settle their questions (`ruled`); `defer` marks them
   `deferred`. A deferred question returns to `open`, and is asked again citing the deferral, on the first
   run where a new or changed corpus unit has a passage on its subject.
