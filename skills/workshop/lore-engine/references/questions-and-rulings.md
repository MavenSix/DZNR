# questions.md and rulings.md

The two files the author sees. `questions.md` is what the engine asks; `rulings.md` is what the author
answered. Both are written for the author: plain language, no graph terms, no em or en dashes.

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

## Withdrawn

- Q<n>. <Subject>: <the point>. <Why: the passage is no longer in the text, as of <unit> revised <date>>.

## For the record

<Unnumbered: AMBIGUOUS links that touch no render, listed so nothing is hidden.>
```

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

Append only. The engine adds an entry when the author answers a question, and never edits or removes one.
A ruling changes only through a later ruling that says which one it replaces.

### Layout

```markdown
# Rulings: <Title>

The author's answers to canon questions. Each one wins over the text from its date on.

## R1. 2026-10-22. Answers Q1: Ada Pruitt, eye colour

**Ruling:** grey.

**In the author's words:** "Q1 grey, chapter two is a slip."

**Received:** Pulse OS job job-ex02, reply to questions of 2026-10-21.

**Overrides:** "green as bottle glass" [ch-002 ¶3].
```

Every entry has:

- **Heading**: `R<n>`, the date, the question it answers, its subject and point.
- **Ruling**: the value, as short as canon.json holds it.
- **In the author's words**: verbatim. When the author accepted the proposal ("yes, go with that"), quote
  that and put the proposal's value under Ruling.
- **Received**: where the answer came from (a Pulse OS job reply, a session and its line, a message).
- **Overrides**: each passage the ruling overrides, with its citation, or "nothing; the text was silent"
  for a gap.
- **Replaces** (only when it does): the earlier ruling it supersedes, `Replaces R<n>`.

A ruling with no question (the author volunteers "by the way, Ada is left-handed") gets a ruling number,
"Answers: none, volunteered" in the heading, and the same fields.
