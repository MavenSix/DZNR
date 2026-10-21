---
name: author-world-authority
description: >
  The style engine for an AUTHOR'S world: a novel, a screenplay or a serial that someone other than
  Kevin wrote, made into images, motion and immersive web scenes (Pulse OS jobs above all). QKI is one
  engine among others and never the default here: the look comes from the author's own text and choices.
  Reads the manuscript excerpts or chapters, the creative brief, the tonal references and, when present,
  the graphify lore graph, and drafts an author world pack: palette, materials and group language in the
  same contract QKI packs use, plus what QKI fixes but an author chooses (medium, realism level, era and
  place, camera language, motion language, sound). Emits the style-injection block every generator
  prepends, and defines the Fidelity Gate: an output fails when it contradicts the pack's declared medium
  or the canon in the author's text (names, looks, places, timeline), never because it looks 3D or real
  when the pack says it should. The author approves the pack before any asset renders; open canon
  questions go back to the author as questions, never guessed. Triggers whenever Cheetara works for an
  author, a Pulse OS job arrives, or a job names no QKI pack.
---

# Author World: Style Authority

This is the single source of truth for the look of a world an author wrote. It is the counterpart of
`qki-style-authority`, and the difference is the whole point: QKI fixes a drawn-art DNA and swaps only the
palette, because QKI is Kevin's style for Kevin's worlds. An author's world has no fixed look. A realist
thriller wants photographs, a historical piece wants its century, a fable may want watercolour, and only
the author can say which.

What this authority fixes instead of a look is **fidelity**: the world on screen is the world on the page,
in the medium the author chose. The prime directive underneath everything: **the author is the director.**
Agents propose, the author decides. A render that contradicts the text is a defect however good it looks,
and a render that honours the text in the author's chosen medium passes however far it sits from QKI.

---

## Which Engine Is Active (resolve before anything else)

Every job names its world. Resolve the engine from that, before a generator, a palette or a prompt:

| The job | Engine | Gate |
|---|---|---|
| Names a QKI pack (`friends-and-anarchists`, a pack in `qki-style-authority/packs/`) | `qki-style-authority`, unchanged | Prime Gate |
| Comes from an author: a Pulse OS job, a manuscript, a World Bible, or anything that names no QKI pack | This authority | Fidelity Gate |
| An author world whose approved pack declares `medium: drawn` and `qki: true` | This authority, with the QKI DNA loaded on top | Fidelity Gate, then the Prime Gate |

**The default is an author world.** Work arriving for an author, or naming no QKI pack, is never rendered
as QKI by assumption. With no pack resolvable, do not fall back to QKI: draft an author world pack from
the manuscript and brief (below) and ask the author to approve it.

---

## What Is Fixed vs What the Author Chooses

**Fixed (this authority, for every author world):**
- The author approves the pack before any asset renders
- The canon in the author's text: names, looks, places, timeline, and every ruling the author has given
- Open canon questions go to the author as questions, never guessed
- The Fidelity Gate on every output
- Identity lock for recurring subjects, and every asset tagged in the manifest with its engine and pack

**Chosen by the author (recorded in the pack):**
- Medium: photographic, painterly, drawn, 3d-real, or mixed
- Realism level: documentary, heightened, stylised, or abstract
- Era and place
- Palette and colour behaviour, overall and per group
- Material language
- Group language (the factions, families, institutions or classes the story turns on)
- Camera language (lens, framing, distance, movement)
- Motion language (how things move in clips and live scenes)
- Sound (the world's ambient and cue palette)
- Influences, and what the world must never look like

None of the chosen fields has a default. When the brief and the text are silent on one, propose a value
from the evidence and ask; the author's answer goes in the pack.

---

## Inputs

- **The manuscript:** excerpts or chapters. The canon lives here; everything else serves it.
- **The creative brief:** in a Pulse OS job, the project's `logline`, `genres`, `tonal_references`,
  `themes`, `world_mechanics`, `key_entities` and `creative_brief`.
- **Tonal references:** films, photographers, painters, books the author names.
- **The World Bible and its canon register**, when Sherlock has drafted one (`pulse-os-artifacts` s1):
  every entry cites its passages. Prefer it to a fresh read; it is what the author locked.
- **The lore graph from graphify**, when present: characters, places, objects and their relations as
  nodes and edges. Use it to find every passage that describes a subject and every relation a render must
  respect (who stands where, who owns what, which place is beside which). The graph points at passages; the
  passages are the canon.

---

## Drafting the Pack

The full contract is `references/author-world-pack-schema.md`. Draft in this order:

1. **Read the canon first.** Pull every stated look for each character, place and object, with the passage
   it came from. Pull the timeline (when the story happens, what has happened to whom by each scene).
2. **Medium and realism from the brief and the tonal references.** A brief that names Gregory Crewdson and
   *Zodiac* is asking for photographs, not ink. Propose; never assume.
3. **Era and place** from the text: the decade, the city, the technology a character could hold.
4. **Palette, materials and groups.** Groups come from the story's social structure. Palette comes from the
   motifs, the tone and the stated colours in the text. Hand extraction from a reference to
   `brand-from-scratch` (loose references and vibes) or `ds-theming` (structured input), then map the
   result into pack roles.
5. **Camera, motion and sound** from the prose: how close the narration sits, how fast it cuts, what the
   world sounds like.
6. **Open questions.** Everything a render must decide that the text leaves open or contradicts.

Then present the pack to the author in plain language: the medium and realism in one line, the palette,
the groups, the canon each subject renders from, and the open questions. **Nothing renders until the
author approves**, and the approval date goes in the pack (`approved_by_author`). A change the author asks
for later is a new pack version, approved the same way.

---

## Canon Questions (asked, never guessed)

A canon question is anything a render must decide that the author has not decided:

- The text is silent: a character's eye colour is never given, and a portrait has to show it
- The text contradicts itself: chapter 3 has the scar on the left cheek, chapter 19 on the right
- The timeline is unclear: is she twelve or fifteen in the barn scene
- The brief and the text disagree: the brief says 1970s, the cars in chapter 2 are from the 1990s

Each question goes to the author with the passages, what the render needs, and a proposed answer. Only the
subject it touches waits; other assets go ahead. The author's answer is written into the pack's canon as a
ruling, with its date, and every later render cites it. A guessed answer that turns out wrong is a canon
violation in every asset that used it, so the cheap place to catch it is the question.

---

## The Fidelity Gate (run on every output before accepting it)

The author-world counterpart of the Prime Gate. An asset passes only if it:

- Is made in the pack's declared medium at its declared realism level
- Matches the canon for its subject: name, look, age at that point in the story, place, and era
- Honours every author ruling that touches it
- Holds the subject's identity lock, when it has one
- Sits in the pack's palette, materials and camera language
- Could stand beside the author's prose without the author wincing

An asset FAILS the moment any of these is true:

- It contradicts the declared medium: illustration in a photographic pack, a photograph in a painterly one
- It contradicts the canon: the wrong eye colour, a sign with the wrong name, the house in the wrong town,
  a phone in a story set in 1962, a character older than the timeline allows
- It contradicts an author ruling
- It drifts from a locked identity
- It reads as generic stock output that could illustrate any book

An asset NEVER fails because it looks 3D, photographic or real when the pack says it should. The Prime Gate
does not run on an author world unless the pack opted into QKI.

The canon wins ties: a beautiful render that breaks canon fails, and a plain one that holds canon is
regenerated for quality, not for fidelity. On a fail, regenerate with the contradicted field stated harder
in the prompt. Three fails on the same asset: voice the gap and take it to the author, since the pack or
the canon may need a ruling.

---

## The Style-Injection Block

Every generator prepends this to any image or video prompt under an author world, filling the bracketed
variables from the **approved pack** and the subject's canon entry.

```
World: {PACK.name}, from {PACK.work} by {PACK.author}.
Medium: {PACK.medium}, {PACK.realism}. {PACK.medium_notes}.
Era and place: {PACK.era}, {PACK.place}.
Subject: {SUBJECT.name}, {SUBJECT canon look lines, each as stated in the text}.
Colour: [{PACK or GROUP palette hexes}], {PACK or GROUP colour behaviour}.
Materials: {PACK or GROUP materials}.
Camera: {PACK.camera_language}{, SHOT framing}.
Motion: {PACK.motion_language} (video and live scenes only).
Influences: {PACK.influences}.
NOT: {PACK.avoid}{, any look the canon rules out}.
```

The NOT line comes from the pack and the canon only. This authority never adds "3D render" or
"photorealism" to it on its own; those are QKI's exclusions, and they belong in an author's pack only when
the author put them there. For a `qki: true` pack, the QKI injection block from `qki-style-authority` is
prepended first and this block follows it.

---

## Hero Render Path (chosen by the pack's medium)

| Medium | Hero path | Notes |
|---|---|---|
| photographic | Higgsfield (identity-locked subjects), or MidJourney with the pack's own `midjourney` block or prompt text alone | Never the QKI sref anchor. Camera language carries lens, light and grain. |
| painterly | MidJourney with the pack's own `midjourney` block, or prompt text alone | Weavy for variations and sheet compositing, as today. |
| drawn, `qki: false` | MidJourney with the pack's own `midjourney` block, or prompt text alone | The author's drawn style, not QKI's linework law. |
| drawn, `qki: true` | The QKI path, unchanged: MidJourney with the QKI sref anchor (or the pack's override), `--sw 250` | The QKI DNA and the Prime Gate apply on top of this authority. |
| 3d-real | Blender MCP or Unreal MCP may make the final look; meshes through Weavy (Tripo / Meshy) or Higgsfield 3D | QKI's "Layer 1 only" rule does not apply: the render is the look. |
| mixed | Each element routes by its own declared medium (`mixed_layers` in the pack) | Composite in Weavy. |

Volume, variations and video route as they do for QKI: Higgsfield, Weavy and RunningHub (RunningHub only
with the author's consent recorded, never for real-person likenesses). Motion clips use
`seedance-director` or `wan-video-prompts` with the pack's medium named in the brief.

---

## How a Generator Uses This Authority

The three generators (`qki-character-generator`, `qki-place-generator`, `qki-object-generator`) keep their
workflow under an author world: write the node, confirm it, hero pass, lock identity, build the set, write
the manifest, gate every output. What they take from QKI is replaced as follows:

| Where the generator says | Under an author world |
|---|---|
| Read `qki-style-authority` and the active world pack | Read this authority and the approved author pack |
| The QKI injection block | The block above |
| Faction | Group (the pack's `groups`) |
| Motion state (the seven states) | The pack's motion language; the seven states apply only with `qki: true` |
| MidJourney with the QKI sref anchor as the required hero path | The hero path for the pack's medium (table above) |
| Blender and Unreal for Layer 1 only | Layer 1 only for drawn and painterly packs; final renders allowed for 3d-real |
| The Prime Gate | The Fidelity Gate (both, for `qki: true`) |

Additions under an author world:

- Every node record carries `canon_refs`: the passages it portrays, and any rulings it depends on.
- Every node waits on any open canon question that touches it; nothing else waits.
- Places still benefit from a Layer 1 block, because it pins the geography the text describes (distances,
  adjacency, what can be seen from where).
- Objects are canon-led before material-led: what the text says the object is, then what it is made of.

The steps in order:

1. Load the approved author pack. If none, draft one and wait for the author's approval.
2. Resolve the subject's canon entry (passages, rulings) and its group.
3. Choose the motion language for the asset (still sheets need none).
4. Build the prompt: prepend the injection block with the pack and canon filled.
5. Route by the pack's medium (the table above).
6. Write the asset to the project inbox and tag its manifest entry (`references/manifest-fields.md`).
7. Run the Fidelity Gate. Ship only on a pass.

---

## Consistency Backing

Two mechanisms hold an author's world together across dozens of assets, as they do for QKI:

- **This authority plus the approved pack, injected every time.** Medium, palette and camera stay the same
  from the first portrait to the last scene.
- **Identity lock for recurring subjects.** The node record is the source of truth. Back it with
  Higgsfield Soul Characters and reference elements, and with MidJourney character reference for 2D. Every
  new render of a known subject cites its lock and its canon, not a fresh interpretation.

---

## Reference Files

- `references/author-world-pack-schema.md`: the author world pack contract, its validation, and a short
  worked example. Read this to draft or load a pack.
- `references/manifest-fields.md`: the fields an author-world asset adds to the shared asset manifest
  (`qki-asset-pipeline/asset-manifest-schema.md`), and how a record says which engine made it.
