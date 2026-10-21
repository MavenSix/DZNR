# Worked Example: The Salt Road

An invented project, written for this example. It is not any author's text. Two short chapters, one Pulse
session, one correction and a project record are enough to show the four things the engine is for: one
conflict, one alias candidate, one gap, and one author correction overriding a session statement.

---

## 1. What arrives

Pulse OS job `job-ex01` drops five files into the project folder:

```
inputs/job-ex01/the-salt-road-ch1-2.md
inputs/job-ex01/session-2026-10-03.txt
inputs/job-ex01/note-2026-10-09.txt
inputs/job-ex01/project.json
inputs/job-ex01/brief.md
```

**The manuscript** (`the-salt-road-ch1-2.md`):

```markdown
# Chapter One

The spring Ada Pruitt turned sixteen, the causeway went under for good.

Ada's eyes were the grey of the flats at low tide, and they gave nothing away. She was small for sixteen,
brown from the summers on the marsh, and her black hair was cut short with her mother's kitchen scissors.
She wore her mother's old oilskin everywhere.

Every night the keeper climbed the Saltmarsh Light and lit the lamp, and every night Ada watched the beam
cross the water from her window. Nobody in the village had seen his face in years.

# Chapter Two

Tobias Wren had kept the Saltmarsh Light for twenty years. Once a month he rowed across to the village for
oil and flour, and he was always gone before dark.

Ada stood at the end of the broken causeway. Her eyes, green as bottle glass, did not leave the water.
```

**The session** (`session-2026-10-03.txt`):

```
QUILL: What should a reader know about Tobias Wren?
AUTHOR: Tobias is Ada's uncle, her mother's brother. He keeps to himself.
QUILL: Could he be older, seventy or so?
AUTHOR: Let me think about that one.
```

**The correction** (`note-2026-10-09.txt`, written by the author):

```
Correction to the session on the 3rd: Tobias is Ada's father, not her uncle. She doesn't know it yet.
```

**The project record** (`project.json`): logline "A girl on a drowning coast learns who keeps the light";
`key_entities`: Ada Pruitt, Tobias Wren. **The brief** sets it in a salt-marsh village on the English east
coast in 1962.

---

## 2. Normalise

The engine writes six corpus units and leaves `inputs/` untouched:

| Unit | File | Kind | Order or date |
|---|---|---|---|
| ch-001 | `corpus/chapters/ch-001.md` | chapter | order 1, POV Ada Pruitt |
| ch-002 | `corpus/chapters/ch-002.md` | chapter | order 2 |
| session 2026-10-03 | `corpus/sessions/2026-10-03.md` | session | 2026-10-03 |
| note 2026-10-09 | `corpus/notes/2026-10-09-note.md` | note | 2026-10-09, speaker author |
| brief | `corpus/brief/brief.md` | brief | 2026-10-14 |
| project record | `corpus/brief/project-record.md` | brief | 2026-10-14 |

`corpus/chapters/ch-001.md`, as written:

```markdown
---
source: inputs/job-ex01/the-salt-road-ch1-2.md
locator: "Chapter One"
order: 1
kind: chapter
pov: Ada Pruitt
date: 2026-10-14
captured_at: 2026-10-14
author: Jo Hale
---

# Chapter One

The spring Ada Pruitt turned sixteen, the causeway went under for good.

Ada's eyes were the grey of the flats at low tide, ...

Every night the keeper climbed the Saltmarsh Light and lit the lamp, ...
```

Paragraphs count from the heading: in ch-001, ¶1 is the heading, ¶2 the spring, ¶3 Ada's looks, ¶4 the
keeper. In ch-002, ¶2 is Tobias, ¶3 Ada at the causeway. In the session file (a `# Session, 2026-10-03`
heading, then one line per block), ¶3 is the author's "uncle" line and ¶4 and ¶5 are Quill's question and
the author's non-answer. In the note, ¶2 is the correction.

---

## 3. graphify

From `<project>/lore/`:

```
/graphify corpus --mode deep
```

graphify detects six documents, extracts them semantically (one chunk, since they are few), builds
`graphify-out/graph.json`, and writes `GRAPH_REPORT.md` and `graph.html`. The engine skips the offer to
explore and never runs `save-result`.

The typing post-pass then reads each node's passages and fills canon.json's `graph_nodes` map. graphify's
node IDs follow its own rule (file path plus entity), so Ada is a separate node in each file she appears
in. The nodes below are illustrative: a real run names its own set, and the engine works from whatever the
graph holds.

| graphify node | Type | Canon entity |
|---|---|---|
| `chapters_ch_001_ada_pruitt` | character | char.ada-pruitt |
| `chapters_ch_002_ada` | character | char.ada-pruitt |
| `chapters_ch_001_the_keeper` | character | char.the-keeper |
| `chapters_ch_002_tobias_wren` | character | char.tobias-wren |
| `sessions_2026_10_03_tobias_wren` | character | char.tobias-wren |
| `chapters_ch_001_saltmarsh_light` | place | place.saltmarsh-light |
| `chapters_ch_001_causeway` | place | place.causeway |
| `chapters_ch_001_causeway_flood` | event | event.causeway-lost |

"The keeper" and "Tobias Wren" stay two canon entities: nothing in the text says they are one person, so
the engine does not merge them, whatever graphify's own similarity edges say.

---

## 4. Canon (excerpt of canon.json)

```json
{
  "id": "char.ada-pruitt",
  "type": "character",
  "name": "Ada Pruitt",
  "main": true,
  "main_because": "POV of ch-001; named in key_entities",
  "attributes": {
    "eye_colour": {
      "value": null, "status": "conflict", "question": "Q1",
      "claims": [
        { "value": "grey", "authority": "text", "from_order": 1,
          "cite": { "unit": "ch-001", "para": 3, "quote": "Ada's eyes were the grey of the flats at low tide" } },
        { "value": "green", "authority": "text", "from_order": 2,
          "cite": { "unit": "ch-002", "para": 3, "quote": "Her eyes, green as bottle glass" } }
      ]
    },
    "apparent_age": { "value": "sixteen in the spring of 1962", "status": "single",
      "claims": [ { "authority": "text", "cite": { "unit": "ch-001", "para": 2 } },
                  { "authority": "brief", "cite": { "unit": "brief", "para": 2 } } ] },
    "build": { "value": "small for her age", "status": "single", "claims": [ { "cite": { "unit": "ch-001", "para": 3 } } ] },
    "skin": { "value": "brown from the summers on the marsh", "status": "single", "claims": [ { "cite": { "unit": "ch-001", "para": 3 } } ] },
    "hair": { "value": "black, cut short", "status": "single", "claims": [ { "cite": { "unit": "ch-001", "para": 3 } } ] },
    "clothing": { "value": "her mother's old oilskin", "status": "single", "claims": [ { "cite": { "unit": "ch-001", "para": 3 } } ] }
  }
}
```

```json
{
  "id": "rel.tobias-parent-of-ada",
  "source": "char.tobias-wren", "relation": "parent_of", "target": "char.ada-pruitt",
  "status": "resolved", "question": "Q4",
  "claims": [
    { "relation": "kin_of", "value": "uncle, her mother's brother", "authority": "author", "date": "2026-10-03",
      "cite": { "unit": "session-2026-10-03", "para": 3 } },
    { "relation": "parent_of", "value": "father; Ada does not know", "authority": "author", "date": "2026-10-09",
      "cite": { "unit": "note-2026-10-09", "para": 2 } }
  ]
}
```

Quill's "seventy or so" is not a claim: the assistant said it and the author did not take it up. Tobias's
age stays unstated.

---

## 5. The checks

| Check | Finding |
|---|---|
| a. Attribute conflict | Ada's eye colour: grey [ch-001 ¶3], green [ch-002 ¶3]. Two chapters, so a conflict whatever their dates. **Q1** |
| b. Timeline | Nothing contradicts: one anchored event (the causeway lost, spring 1962). |
| c. Rule violation | No rule is stated yet. |
| d. AMBIGUOUS edges | Any AMBIGUOUS edge in this graph would sit between nodes already asked about; none adds a question. |
| e. Alias candidate | The keeper [ch-001 ¶4] and Tobias Wren [ch-002 ¶2]: same role, never in one scene. Against: the village has not seen the keeper's face in years, yet Tobias rows across monthly. **Q2** |
| f. Gap | Tobias Wren is main (named in `key_entities`) and no source gives his apparent age, build, hair, eyes, skin or clothing. **Q3** |
| Date ranking | Tobias and Ada: "uncle" [session 2026-10-03 ¶3], then "father" [note 2026-10-09 ¶2]. Both the author's, the note is later: **resolved**, not a conflict. **Q4** |

Ada needs nothing else: every render need for her has a passage. The Saltmarsh Light appears in two
units and is in no key entity list, so it is not main yet and its gaps are not asked.

---

## 6. questions.md, exactly as produced

```markdown
# Canon questions: The Salt Road

Jo Hale. Run of 2026-10-21, from 2 chapters, 1 session, 1 note and the brief.
3 open. 1 resolved by your later word. 0 settled by your rulings.

Answer any of these by its number, in your own words. "Go with the proposal" is an answer too.
Nothing is decided until you say so; only the renders listed under each question wait.

## Open

### Q1. Ada Pruitt: eye colour

Two chapters give different colours.

> "Ada's eyes were the grey of the flats at low tide, and they gave nothing away." [ch-001 ¶3]

> "Her eyes, green as bottle glass, did not leave the water." [ch-002 ¶3]

**Proposed answer:** grey. Chapter 1 describes her eyes closely and on purpose; chapter 2's line may be a
slip. Your call.

**If it stays open:** Ada's hero portrait, turnaround, expression sheet and identity lock wait (s3), and so
does any plate that shows her face (s6). Places, objects and other characters go ahead.

### Q2. The keeper and Tobias Wren: one man or two?

Two names that may be the same person.

> "Every night the keeper climbed the Saltmarsh Light and lit the lamp, and every night Ada watched the
> beam cross the water from her window. Nobody in the village had seen his face in years." [ch-001 ¶4]

> "Tobias Wren had kept the Saltmarsh Light for twenty years. Once a month he rowed across to the village
> for oil and flour, and he was always gone before dark." [ch-002 ¶2]

For one man: both keep the Saltmarsh Light, and they never appear in the same scene. Against: the village
has not seen the keeper's face in years, but Tobias comes to the village every month.

**Proposed answer:** one man. "Nobody had seen his face" reads as how the village talks about him. If it is
literal, the story has a second keeper, and both need their own look. Your call.

**If it stays open:** the identity lock for Tobias Wren and for the keeper waits (s3), and so do night
plates of the Light with the keeper in them (s6). The Light itself, the causeway and Ada go ahead.

### Q3. Tobias Wren: how he looks

The text never describes him, and his portrait has to show him.

> "Tobias Wren had kept the Saltmarsh Light for twenty years." [ch-002 ¶2]

> QUILL: "Could he be older, seventy or so?" AUTHOR: "Let me think about that one."
> [session 2026-10-03 ¶4, ¶5]

Missing: apparent age, build, hair, eyes, skin, clothing. Quill's "seventy" was a suggestion you did not
take up, so it is not canon.

**Proposed answer:** in his fifties (twenty years at the Light), weathered and lean, in a keeper's jersey
and sea boots. Since he is Ada's father, black hair going grey, so the likeness can show later. Your call.

**If it stays open:** Tobias Wren's hero portrait, turnaround, expression sheet and identity lock wait
(s3), and so does any plate that shows him (s6). Everything else goes ahead.

## Resolved by your later word

### Q4. Tobias Wren: how he is related to Ada

Resolved by your later word, so nothing to answer.

> AUTHOR: "Tobias is Ada's uncle, her mother's brother." [session 2026-10-03 ¶3]

> "Correction to the session on the 3rd: Tobias is Ada's father, not her uncle. She doesn't know it yet."
> [note 2026-10-09 ¶2]

**Canon now:** Tobias Wren is Ada's father, and Ada does not know it [note 2026-10-09 ¶2]. Tell me if that
is wrong.

## Settled by your rulings

None yet.

## Withdrawn

None.

## For the record

Nothing.
```

---

## 7. The author answers

Through Pulse OS on 2026-10-22 the author replies: "Q1 grey, chapter two is a slip. Q2 same man, the
village just never looks at him. Q3 go with the proposal." The engine appends to `rulings.md`:

```markdown
## R1. 2026-10-22. Answers Q1: Ada Pruitt, eye colour

**Ruling:** grey.

**In the author's words:** "Q1 grey, chapter two is a slip."

**Received:** Pulse OS job job-ex02, reply to questions of 2026-10-21.

**Overrides:** "green as bottle glass" [ch-002 ¶3].
```

R2 (the keeper is Tobias Wren; the two entities become one, with "the keeper" as an alias citing
[ch-001 ¶4]) and R3 (the proposal for Q3, quoting "go with the proposal") follow in the same shape. The
engine re-runs the canon, the checks and the outputs with no graphify run, since the corpus did not
change. Q1 to Q3 move to "Settled by your rulings", Ada's and Tobias's renders are clear, and the bible
reads `Eyes: grey [R1, 2026-10-22] (text had green [ch-002 ¶3])`.

## 8. Chapter three arrives

Job `job-ex03` brings chapter 3. The normaliser writes `corpus/chapters/ch-003.md` and leaves the other
units' files untouched, so:

```
/graphify corpus --update --mode deep
```

re-extracts ch-003 alone and merges it into the graph. If chapter 3 says Ada's eyes are green again, that
is not Q1 reopened: R1 settled it. It is a new question, Q5, quoting the new passage beside R1 and asking
whether the text or the ruling holds.
