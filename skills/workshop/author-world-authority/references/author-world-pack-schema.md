# Author World Pack Schema

An author world pack is everything the generators need to render a world an author wrote. It uses the QKI
world-pack contract (`qki-style-authority/references/world-pack-schema.md`) where that contract fits:
palette roles, colour behaviour, materials, groups in the place of factions, the environment base, the
optional special energy and the optional MidJourney block. It adds what QKI fixes and an author chooses:
medium, realism, era and place, camera, motion and sound. And it carries the canon the Fidelity Gate
checks against.

The rule is the same as QKI's: the rest of the system reads only a validated pack, and never cares whether
a field came from the manuscript, the brief, a reference image or the author's answer to a question.

---

## Pack Structure

```yaml
pack:
  engine: author-world         # always; a QKI pack has no engine field and means qki
  name: string                 # "The Salt Road", "Residue"
  id: slug                     # the-salt-road
  author: string
  work: string                 # the title the world comes from
  authority_version: string    # author-world-authority version this pack was drafted against
  pack_version: string         # "1", then one more for every revision; also in world-pack.md's status line
  approved_by_author: iso8601 | null   # null = draft; nothing renders from a draft
  approval_received: string | null     # where the approval came from: "Pulse OS (key <name>)", a session
  sources: [string]            # manuscript chapters, brief, tonal references, lore graph path

  medium: photographic | painterly | drawn | 3d-real | mixed
  medium_notes: string         # "35mm colour negative, available light", "gouache on toned paper"
  qki: false                   # true only with medium: drawn; loads the QKI DNA and Prime Gate on top
  mixed_layers:                # only with medium: mixed
    - element: string          # "characters", "backgrounds", "the dream sequences"
      medium: photographic | painterly | drawn | 3d-real
  realism: documentary | heightened | stylised | abstract
  era: string                  # "autumn 1962", "a near future, about 2040"
  place: string                # "Galveston and the Gulf coast", "an unnamed northern port"

  palette:                     # the world's overall holds; groups may override
    base: "#______"
    shadow: "#______"
    accent: "#______"
    light: "#______"           # optional: the light the world is lit by
    line: "#______"            # optional: for drawn and painterly media
  colour_behaviour: string     # "muted and warm, crushed blacks", or bleed | flat for drawn packs

  groups:                      # the QKI faction slot: families, institutions, classes, crews
    - name: string
      temperament: string
      palette: {}              # role -> hex, only where the group breaks from the world palette
      materials: string
      motion_bias: string      # free text; the seven QKI states apply only with qki: true
      canon_refs: [string]

  materials: string            # the world's material language
  environment_base:
    palette: [hex, hex, hex]
    notes: string
  special_energy: {}           # optional, as in the QKI schema, if the world has one

  camera_language: string      # lens, distance, framing, movement: "long lens, observed, never handheld"
  motion_language: string      # how things move in clips and live scenes
  sound: string                # ambient bed and cue palette
  influences: [string]         # the author's tonal references, as named
  avoid: [string]              # what the world must never look like, in the author's words

  midjourney: {}               # optional, the QKI schema's block; it never inherits the QKI sref anchor

  canon:
    characters:
      - name: string
        look: [{trait: string, value: string, refs: [string]}]
        age: [{when: string, value: string, refs: [string]}]
        identity_lock: node-id | null
    places:
      - name: string
        look: [{trait: string, value: string, refs: [string]}]
        geography: [{relation: string, refs: [string]}]   # "two streets from the harbour"
    objects:
      - name: string
        look: [{trait: string, value: string, refs: [string]}]
        owner: string | null
    timeline:
      - when: string
        event: string
        refs: [string]
    rulings:                   # the author's answers to canon questions
      - question: string
        answer: string
        date: iso8601
      ruling_id: string        # R<n> in lore/rulings.md and lore/rulings.json

  open_questions:
    - question: string
      id: string               # Q<n> in lore/questions.json; the pack cites it rather than asking again
      refs: [string]           # the passages that raise it
      needed_for: string       # what render needs the answer
      proposal: string         # the answer DZNR would suggest
      blocks: [subject]        # only these subjects wait
```

`refs` are passage citations in the form the World Bible uses (chapter and paragraph, or page and line).
A look with no `refs` is a ruling or a proposal and must say which.

---

## Validation

A pack is valid when it has `name`, `id`, `author`, `work`, `medium`, `realism`, `era`, `place`, a
`palette` with `base`, `shadow` and `accent`, `camera_language`, and at least one canon entry. `mixed`
needs `mixed_layers`. `qki: true` needs `medium: drawn`, and then the palette and groups must also satisfy
the QKI schema's Required Roles (`line`, `shadow`, `base`, `accent`, a `colour_behaviour` of bleed or flat,
and a `motion_bias` from the seven states).

A pack renders only when it is valid **and** `approved_by_author` is set. Medium and realism are never
defaulted: if the brief and text leave them open, they are open questions until the author answers.

---

## Where the Pack Lives, and How the Author Approves It

The pack is written to the project's `lore/world-pack.md`, its `pack_version` in the status line at the
top and in the YAML. An earlier version, when the author asks for a revision, is kept as
`lore/world-pack-v<n>.md`. The author's decision arrives as `lore/pack-approval.json` when the author
decides in Pulse OS:

```json
{ "version": 1, "pack_version": "1", "decision": "approve", "note": "string",
  "at": "2026-10-22T10:40:00Z", "received": "Pulse OS (key salt-road-studio)" }
```

| Field | Meaning |
|---|---|
| `version` | 1, the file's shape |
| `pack_version` | the pack version decided on; null means the version current at `at` |
| `decision` | `approve` sets `approved_by_author` (and `approval_received`); `revise` means draft the next version applying `note`, keep the old one, and await approval again |
| `note` | the author's words: a condition on an approval, or what to change for a revision |
| `at` | when the author decided, ISO 8601 |
| `received` | where it came from, `Pulse OS (key <name>)` from Pulse |

`author-world-authority` reads it at the start of every job, before any render. An approval naming an
older version than `world-pack.md` now holds approves nothing and is reported.

---

## Intake Paths

The QKI schema's three paths still work, pointed at the author's material:

1. **The author supplies a pack, or a style guide that maps onto one.** Validate and confirm.
2. **The author describes the look in words** ("like a 1970s police procedural, washed-out colour").
   Map it to medium, realism, palette and camera, and confirm.
3. **Extract from reference** (stills, a mood board, a film the author names). Hand palette extraction to
   `brand-from-scratch` or `ds-theming`, map the result into pack roles, and confirm.

Whichever path, the canon comes from the manuscript, never from the references.

---

## What the Pack Does NOT Contain

A pack never overrides the canon. If the author wants a character to look different from the text, that is
a ruling recorded in `canon.rulings`, and it changes every later render on purpose. A pack also never
removes the author's approval step or the Fidelity Gate.

---

## A Short Worked Example

```yaml
pack:
  engine: author-world
  name: The Salt Road
  id: the-salt-road
  author: (the author)
  work: The Salt Road
  authority_version: "1.0"
  pack_version: "1"
  approved_by_author: null
  medium: photographic
  medium_notes: "35mm colour negative, available light, visible grain"
  qki: false
  realism: documentary
  era: "autumn 1962"
  place: "Galveston and the Gulf coast"
  palette: {base: "#8C7B61", shadow: "#2A2622", accent: "#B4472F", light: "#E9D9B4"}
  colour_behaviour: "muted and warm, crushed blacks, no teal grade"
  camera_language: "long lens, observed from across the street, eye level, never handheld"
  motion_language: "slow, locked-off; one push-in per scene at most"
  sound: "gulls, a radio two rooms away, the ferry horn"
  avoid: ["anything glossy", "modern cars or phones"]
  canon:
    characters:
      - name: Ada Pruitt
        look:
          - {trait: hair, value: "cropped, prematurely grey", refs: ["ch1 p4"]}
          - {trait: scar, value: "left forearm, from the cannery", refs: ["ch3 p12"]}
  open_questions:
    - question: "What colour are Ada's eyes? The text never says."
      refs: ["ch1 p4", "ch7 p2"]
      needed_for: "hero portrait"
      proposal: "grey, to match the hair the text dwells on"
      blocks: [Ada Pruitt]
```

Nothing in this world is drawn, and nothing in it would pass QKI's Prime Gate. It is not meant to. The
Fidelity Gate asks whether the portrait is a 1962 photograph of the woman in chapter 1, and that is the
only question.
