# Canon Schema

The contract for `lore/sources.json`, `lore/canon.json` and the layout of `lore/world-bible.md`. Every
later job reads these, so the shapes are fixed; a change is a new `schema` version.

---

## The citation

Every fact, claim, relation and event cites at least one passage in this shape:

```json
{
  "unit": "ch-002",
  "file": "corpus/chapters/ch-002.md",
  "para": 3,
  "quote": "Her eyes, green as bottle glass, did not leave the water.",
  "source": "inputs/job-7f3a/manuscript-v2.docx",
  "locator": "Chapter Two"
}
```

- `para` counts the body's blocks from 1, headings included, as the normaliser wrote them.
- `quote` is verbatim and long enough to find again; trim with an ellipsis (`...`), never paraphrase.
- `source` and `locator` point back at the author's original, so the author can find the line in their own
  file.
- Written short in the bible and in questions: `[ch-002 ¶3]`, `[session 2026-10-03 ¶7]`,
  `[note 2026-10-09 ¶1]`, `[brief ¶4]`, `[R2]` for a ruling.

---

## sources.json

```json
{
  "schema": "lore-sources/1",
  "units": [
    {
      "unit": "ch-002",
      "file": "corpus/chapters/ch-002.md",
      "kind": "chapter",
      "order": 2,
      "date": "2026-10-14",
      "pov": "Ada Pruitt",
      "speaker": null,
      "source": "inputs/job-7f3a/manuscript-v2.docx",
      "locator": "Chapter Two",
      "job": "job-7f3a",
      "body_hash": "sha256:...",
      "replaces": null,
      "words": 4210
    }
  ]
}
```

- `kind`: `chapter`, `session`, `note` or `brief` (the project record is a `brief` unit).
- `order`: the chapter's place in the manuscript; sessions and notes order by `date`.
- `replaces`: for a revised chapter, the job and hash of the version it replaced.
- `speaker`: for a note or correction, who wrote it (`author`, or a named collaborator, whose words are not
  author statements).

---

## canon.json

```json
{
  "schema": "lore-canon/1",
  "project": { "id": "...", "name": "The Salt Road", "author": "Jo Hale" },
  "generated_at": "2026-10-21T15:04:00Z",
  "graph": { "path": "graphify-out/graph.json", "nodes": 214, "edges": 388, "ambiguous_edges": 6 },

  "graph_nodes": {
    "chapters_ch_001_ada_pruitt": { "type": "character", "entity": "char.ada-pruitt", "unit": "ch-001" },
    "chapters_ch_002_salt_line": { "type": "rule", "entity": "rule.salt-line", "unit": "ch-002" }
  },

  "entities": [ ],
  "relations": [ ],
  "timeline": [ ],
  "questions": [ ]
}
```

### entities

```json
{
  "id": "char.ada-pruitt",
  "type": "character",
  "name": "Ada Pruitt",
  "aliases": [
    { "name": "the Pruitt girl", "cites": [ { "unit": "ch-001", "para": 3, "quote": "..." } ] }
  ],
  "main": true,
  "main_because": "POV of ch-001; named in key_entities",
  "appears_in": ["ch-001", "ch-002", "session-2026-10-03"],
  "graph_nodes": ["chapters_ch_001_ada_pruitt", "chapters_ch_002_ada"],
  "attributes": {
    "eye_colour": {
      "value": null,
      "status": "conflict",
      "question": "Q1",
      "claims": [
        { "value": "grey", "authority": "text", "date": "2026-10-14", "from_order": 1,
          "cite": { "unit": "ch-001", "para": 3, "quote": "..." } },
        { "value": "green", "authority": "text", "date": "2026-10-14", "from_order": 2,
          "cite": { "unit": "ch-002", "para": 3, "quote": "..." } }
      ]
    },
    "hair": {
      "value": "black, cut short",
      "status": "single",
      "claims": [ { "value": "black, cut short", "authority": "text", "cite": { "unit": "ch-001", "para": 3 } } ]
    }
  },
  "render_needs": ["apparent_age", "build", "hair", "eye_colour", "skin", "clothing"]
}
```

- `id`: `<type>.<slug>`, with types `char`, `place`, `group`, `object`, `rule`, `event`. Stable across
  runs: a rename by ruling keeps the id and changes `name`.
- `main`: true when the entity is a POV, appears in three or more units, or is named in the project
  record's `key_entities` or the brief. Gaps (check f) are asked only for main entities and for anything a
  scene composition has asked to render.
- `attributes`: keyed by a stable snake_case attribute name. Each holds every claim ever made, the current
  `value`, and a `status`:

  | status | Meaning | `value` |
  |---|---|---|
  | `single` | One claim, or several that agree | the agreed value |
  | `changed` | The value changes at a story point the text explains (a scar from ch-005 on) | the latest, with `from_order` on each claim |
  | `resolved` | A later author statement superseded an earlier one | the later statement's value |
  | `settled` | A ruling decided it (`ruling: "R2"`) | the ruling's value |
  | `conflict` | Incompatible claims, an open question | `null` |
  | `gap` | A render need no source gives, an open question | `null` |

- `authority`: `text` (a chapter), `author` (a session line or note by the author), `brief` (the brief or
  project record), `ruling`.
- `from_order`: the manuscript position the claim holds from, for attributes that can change in the story.
- `render_needs`: the attributes the art needs for this type (the lists in `consistency-checks.md`).

A rule entity carries its statement and its tests:

```json
{
  "id": "rule.salt-line",
  "type": "rule",
  "name": "The salt line",
  "statement": { "value": "No one crosses the salt line after dark and lives.", "status": "single",
                 "claims": [ { "authority": "text", "cite": { "unit": "ch-002", "para": 3 } } ] },
  "applies_to": ["place.saltmarsh"],
  "observed": [ { "event": "event.crossing", "outcome": "violation", "question": "Q5" } ]
}
```

### relations

```json
{
  "id": "rel.tobias-keeps-light",
  "source": "char.tobias-wren",
  "relation": "keeper_of",
  "target": "place.saltmarsh-light",
  "status": "single",
  "cites": [ { "unit": "ch-002", "para": 6, "quote": "..." } ],
  "graph_edges": [ { "source": "chapters_ch_002_tobias", "target": "chapters_ch_002_light",
                     "relation": "references", "confidence": "EXTRACTED" } ],
  "question": null
}
```

Relation vocabulary (extend with care; each new one goes in this list):

| Group | Relations |
|---|---|
| Kin | `parent_of`, `child_of`, `sibling_of`, `married_to`, `kin_of` (stated kin, degree unknown) |
| Social | `member_of`, `leads`, `serves`, `allied_with`, `enemy_of`, `loves`, `knows` |
| Place | `lives_in`, `located_in`, `adjacent_to`, `north_of` (and the other compass relations), `across_from`, `visible_from`, `keeper_of` |
| Object | `owns`, `carries`, `made_by`, `kept_in` |
| Event | `present_at`, `happens_at`, `precedes`, `causes` |
| Rule | `governs`, `breaks` |

A relation the text states flatly is `single`. One the author contradicts across sessions follows the date
ranking. One that came from an AMBIGUOUS edge and the passages do not settle is a question (check d).

### timeline

```json
{
  "id": "event.flood",
  "label": "The spring flood takes the causeway",
  "story_time": { "stated": "the spring of 1961", "anchor": "1961-spring", "relative": null },
  "narrative_units": ["ch-001", "ch-002"],
  "place": "place.causeway",
  "present": ["char.ada-pruitt"],
  "cites": [ { "unit": "ch-001", "para": 9, "quote": "..." } ],
  "status": "single",
  "question": null
}
```

- `story_time.anchor` is set only when the text gives a date, a season with a year, or an age with a
  known birth; `relative` holds "the morning after event.flood" style anchors. Check (b) reasons over
  both, never over chapter order alone (flashbacks are legal).
- The timeline array is sorted by story time where anchored, then by relative anchors, then by narrative
  order for the rest, and the bible says which is which.

### questions

The register that keeps question numbers stable:

```json
{
  "id": "Q1",
  "key": "conflict:char.ada-pruitt:eye_colour",
  "kind": "conflict",
  "status": "open",
  "first_seen": "2026-10-21",
  "last_seen": "2026-10-21",
  "ruling": null,
  "blocks": ["s3: Ada Pruitt portrait, turnaround, expression sheet, identity lock",
             "s6: plates that show Ada's face"]
}
```

- `key` is `<kind>:<subject>:<attribute or relation or event>`. The same key on a later run keeps its
  number. A new key takes the next free number; numbers are never reused.
- `status`: `open`, `resolved` (by a later author statement), `settled` (`ruling` names it), `withdrawn`
  (its passages left the text, with `reason`).

---

## world-bible.md

The readable canon. Regenerated every run from canon.json; nothing is written here that canon.json does
not hold.

```markdown
# The Salt Road: World Bible

Jo Hale. Canon as of 2026-10-21, from 2 chapters, 1 session, 1 note and the brief.
Open questions: 4 (see questions.md). Rulings: 0.

## Characters

### Ada Pruitt
Also: the Pruitt girl [ch-001 ¶3]. POV of ch-001.

- Eyes: open, Q1 (grey [ch-001 ¶3], green [ch-002 ¶3])
- Hair: black, cut short [ch-001 ¶3]
- Apparent age: sixteen in the spring of 1962 [ch-001 ¶2] [brief ¶2]
- Father: Tobias Wren, which Ada does not know [note 2026-10-09 ¶2]

## Places
## Groups
## Objects
## Rules
## Timeline

| Story time | Event | Where | Who | Cites |
|---|---|---|---|---|
```

- One fact per line, each with its citation. A settled fact cites its ruling first and the text it
  overrode after: `Eyes: grey [R1, 2026-10-22] (text had green [ch-002 ¶3])`.
- An open fact says `open, Qn` and lists the competing claims with their citations, so the bible never
  shows a guessed value.
- Order within a section: main entities first, then by first appearance.
