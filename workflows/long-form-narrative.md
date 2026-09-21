---
workflow: long-form-narrative
name: Long-Form Narrative (Immersive Episode)
status: complete
version: 1.0
lead: cheetara
supporting: [gibson, morpheus, sherlock, gandalf]
chains: []
grounded_in:
  - path: "QKI immersive episode — Jericho dreams the yard; Death watches. Kevin, 2026-09-21"
    date: 2026-09-21
  - path: ~/dznr-os/characters/jericho.md and characters/death.md (two character packs, one with a designed voice)
    date: 2026-09-21
  - path: ~/dznr-os/lore/the-yard.md and lore/the-seven.md
    date: 2026-09-21
  - path: ~/dznr-os/docs/decisions.md (180 — correcting 179; the limit is prompting, not the style)
    date: 2026-09-21
  - path: ~/dznr-os/docs/decisions.md (161 — references and trained weights do not compose)
    date: 2026-09-17
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["episode of", "serialized", "series bible for", "write the episode", "immersive episode", "season of"]
  spoken: ["Hey DZNR, write the next episode of [world]", "Hey DZNR, start a series bible for [world]"]
inputs_required:
  - id: world
    source: memory
    on_missing: ask
  - id: premise
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Premise and series bible
    owner: cheetara
    chain_node: null
    skills: [immersive-experience-design]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [dznr-os]
    produces: [lore entries and character packs, in the world, registered]
    checkpoint: true
    checkpoint_prompt: "This is the world as the system now holds it. Is anything here not what you meant?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Can this world be drawn as written
    owner: cheetara
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os]
    produces: [one test render per character whose defining trait is unusual, and a verdict]
    checkpoint: true
    checkpoint_prompt: "This is what each character actually renders as. Where the description is not reachable, do we change the trait, fix it in one frame and carry it, or accept what renders?"
    gate: null
    exit_allowed: false
  - id: s3
    name: Episode beats
    owner: morpheus
    chain_node: null
    skills: [presentation-storytelling]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [a beat sheet — what happens, in order, with a shot count against it]
    checkpoint: true
    checkpoint_prompt: "N beats, roughly N shots. At current rates that is about $X of stills and motion. Go?"
    gate: "spend"
    exit_allowed: false
  - id: s4
    name: Voices
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, elevenlabs]
    produces: [a designed voice per speaking character, chosen by listening]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s5
    name: Visual pass
    owner: cheetara
    chain_node: null
    skills: [aesthetic-system]
    models: null
    tools: [dznr-os]
    produces: [stills per beat, in the style, chosen]
    checkpoint: true
    checkpoint_prompt: "The frames. Motion cannot fix one that is wrong, so this is the last cheap moment."
    gate: null
    exit_allowed: false
  - id: s6
    name: Continuity check
    owner: sherlock
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os]
    produces: [a per-character verdict across every frame they appear in]
    checkpoint: true
    checkpoint_prompt: "Is each character the same person in every frame? Name where they are not."
    gate: null
    exit_allowed: false
  - id: s7
    name: Motion and assembly
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, runway, ffmpeg]
    produces: [an assembled episode with voice under it]
    checkpoint: false
    checkpoint_prompt: null
    gate: "spend"
    exit_allowed: true
deliverables:
  - type: video
    dual_with: markdown
  - type: markdown
    dual_with: video
  - type: audio
    dual_with: null
cost_envelope_usd: [10, 120]
time_envelope: "The bible and the beats are Kevin's, and are the work. Per beat: a still in seconds, motion about 75 seconds, voice under a minute. A twelve-beat episode is well under two hours of machine time."
exit_criteria:
  - "Every character with an unusual defining trait was TEST RENDERED at s2, before the episode was written around them"
  - "Every beat began as a still that was looked at and chosen"
  - "s6 ran and named where a character drifted, rather than reporting a clean pass over frames nobody compared"
  - "What could not be rendered is written down at s2, not discovered on delivery"
memory_writes:
  - "narrative.<world>.episode_<n>.beats"
  - "narrative.<world>.episode_<n>.frames (chosen artifact ids)"
  - "narrative.<world>.characters_tested (and the verdict from s2)"
open_questions: []
---

# Long-Form Narrative (Immersive Episode)

## Purpose

Author an episode in one of Kevin's serialized worlds and produce it — beats, voices, frames,
motion — as a thing that can be watched rather than a document about a thing.

**Written from the QKI episode Kevin described on 2026-09-21:** Jericho dreams himself into a
prison yard and fights seven personifications of the deadly sins, while Death — a Black man with
an all-black face, eyes black edge to edge, black hair, in an orange prison jumpsuit — sits on a
short concrete staircase taking notes and does not intervene.

**The form is an immersive episode**, which was the stub's first open question. Kevin answered it
with a scene rather than a category, which is the better answer: what he described is not prose
and not a script, it is a sequence you are inside.

## s2 exists because a defining trait may not be reachable at all

Death's defining trait, in Kevin's words: **all black face, obsidian eyes.** Not dark skin — the
face black as a colour, and the eyes black edge to edge with no white and no iris.

**Neither model will draw it.** Tested both ways with honest phrasing:

    with QKI      the style intact — but the face is a complexion, not a colour
    without QKI   ORDINARY eyes, with whites and irises

The trait fails in both arms, so this is a limit of prompting rather than a fight between the
style and the character. A text-to-image model renders a face; asking for one that is a colour
rather than a complexion, with eyes that have no structure, is outside what a prompt reliably
reaches.

**Two earlier versions of this section gave a cause, and both were wrong.** First that the style
overrode the character; then that the pack's phrasing fought a training set of dark-skinned
characters. QKI does not constrain skin tone — tested — so there was nothing to fight. What is
measured is that the trait does not render. **Why is not known**, and this section no longer
offers a reason. See decisions 180 and 181.

So: one cheap render per character whose defining trait is unusual, **before** the episode is
written around them, with three honest outcomes —

    change the trait        into something a model will draw
    reference or paint-over the trait is fixed in one frame and carried, not prompted
    accept it               Death has ordinary eyes in this world, and that is canon

— and note that **retraining the style does not help here.** It fixes what a style will not carry;
it does not make a prompt reach a thing prompts do not reach. Which remedy applies depends on
which kind of failure it is, and that is exactly what s2 is for finding out.

## Stages

### s1. Premise and series bible

Owner cheetara. The world as the SYSTEM holds it, not as a document about it: `lore/` entries and
`characters/` packs, registered and readable.

For this episode that meant `characters/death.md`, `lore/the-yard.md`, `lore/the-seven.md`, beside
the `jericho` and faction entries already there. A bible that only exists as prose cannot brief a
model, and `dznr-os lore brief <world> "<beat>"` is what the later stages read.

**Character packs carry two descriptions now** and they are for different organs: `## Traits` keeps
a face consistent between pictures, `## Voice` is what a voice designer can use. They are not
interchangeable — see `audio`.

### s2. Can this world be drawn as written

Owner cheetara. One render per character whose defining trait is unusual. See above.

**Checkpoint, and it is a real decision** — change the character, retrain the style, or accept
what the style does. Cheap here and ruinous at s7.

### s3. Episode beats

Owner morpheus. What happens, in order, with a shot count. **Spend gate** with the arithmetic
shown: stills about $0.025, motion about $0.25 per five seconds.

A beat is not a sentence of prose. It is one image that moves.

### s4. Voices

Owner gibson. `dznr-os character voice <name> --say "<a line they would say>"` per speaking
character, chosen by listening. Nothing in the system picks, because nothing in it can hear.

**Who speaks is a design decision made here**, not assumed. Death's pack carries a conditional
`## Voice` and an open question about whether he speaks at all — and a watcher who never speaks is
a stronger presence than one given lines because the pipeline had a slot for them.

### s5. Visual pass

Owner cheetara. Stills per beat with `--style`, `--character` and `--palette`, then `choose`.

The last cheap moment. Motion animates a wrong frame faithfully for ten times the price.

Choosing also assembles the set `train --from-chosen` reads, so producing an episode teaches the
style the episode is drawn in.

### s6. Continuity check

Owner sherlock. **A per-character verdict across every frame they appear in**, named where it
fails rather than summarised as a pass.

This is the hardest stage in the workflow and the system does not solve it. A trained style keeps
a LOOK consistent; it does not keep a PERSON consistent, and there is no identity lock available —
`higgsfield` carries one and is a stub. Seven antagonists who must read as the same seven across
an episode is the problem `lore/the-seven.md` deliberately leaves open rather than settling by
accident.

**What the system can do:** put every frame of one character side by side so a person can see
drift. **What it cannot do:** tell you they are the same man. Sherlock reports; Kevin decides.

### s7. Motion and assembly

Owner gibson. `dznr-os video --from <chosen still>` per beat, voice under it, ffmpeg to cut.

Identical to `short-medium-form-video` s5–s7, deliberately — an episode is that pipeline run
longer, and a second implementation would drift from it.

## Checkpoints

- **s1**: the world as the system holds it, before anything is written around it.
- **s2**: what the style does with each character. The decision that gets expensive later.
- **s3**: beats and cost, before spending.
- **s5**: every frame, looked at.
- **s6**: where a character drifted.

## What this is not

Not `short-medium-form-video` — that is a teaser with a shot list. This has a bible, characters
with voices, and continuity across beats.

Not `pulse-os-artifacts`, which ingests a finished manuscript. This authors from a premise.

Not prose or a script. Kevin answered the form question with a scene you are inside.

## Grounding notes

**What the stub asked, and what answered it.**

- *Prose, script, or immersive episode?* **Immersive episode.** Kevin's own answer.
- *Which world first?* QKI. Jericho, Death, the yard and the seven all exist in the system.
- *Does the series bible become a Pulse World Bible?* No — it becomes `lore/` and `characters/`,
  which are machine-readable and brief a model directly. A Pulse World Bible is a document about a
  world; this is the world the tools read.
- *Who holds voice?* Kevin writes the premise and the beats; DZNR produces. He directs at five
  checkpoints and nothing proceeds past one without him.
- *What is the continuity mechanism for text?* The packs are it, and s6 is where they are checked
  against the pictures. Honestly: **it is a comparison surface, not a lock.**

**Cost:** Fal, Runway and ElevenLabs — all accounts Kevin already has. No RunningHub.

## Changelog

- 1.0 (2026-09-21): written from the QKI yard episode. Status complete.
- 0.1 (2026-09-04): created as stub with open questions.
