---
workflow: audio
name: Audio
status: stub
version: 0.1
lead: gibson
supporting: [morpheus, cheetara, snake-eyes]
chains: []
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["voice for", "soundtrack for", "sound design for", "audio branding", "podcast episode", "narration for", "sound effects for"]
  spoken: ["Hey DZNR, make a voice for [character]", "Hey DZNR, score this scene", "Hey DZNR, sound design for [experience]"]
inputs_required: []
stages:
  - id: s1
    name: Brief and audio identity
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s2
    name: Voice casting and cloning
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Music and score
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Sound design and ambience
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Mix and master
    owner: snake-eyes
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s6
    name: Deliver and license
    owner: neo
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
deliverables: []
cost_envelope_usd: [0, 0]
time_envelope: TBD
exit_criteria: []
memory_writes: []
open_questions:
  - "Which audio outputs matter first: character voices for QKI and Pulse worlds, brand sonic identity, podcast or narration, or score for video?"
  - "Is voice cloning of real people (Kevin's own voice, a client's founder) in scope, and what consent record does the workflow require?"
  - "ElevenLabs is primary for voice; is Suno or Mureka the primary for music, and does that run direct or through RunningHub?"
  - "Does mixing happen in DZNR at all (ffmpeg, a DAW via computer use) or is the deliverable stems plus a spec?"
  - "Name one real audio deliverable Kevin has produced or will produce next; the stub is written from it."
---

# Audio

## Purpose

Stub. This project type is in Kevin's first set but no past project exists to write it from. Tár treats a match on this workflow as a prompt to read the open questions aloud and offer the nearest complete workflow, never as something to execute.

## Stages

### s1. Brief and audio identity

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s2. Voice casting and cloning

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s3. Music and score

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s4. Sound design and ambience

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s5. Mix and master

Owner snake-eyes. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s6. Deliver and license

Owner neo. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

## Checkpoints

Not yet defined. At minimum, the first stage after inputs are confirmed and the stage before any spend over the voice threshold.

## Deliverables

Not yet defined.

## What this is not

Not executable. Not a substitute for the nearest complete workflow.

## Grounding notes

**Precedent that exists:** ElevenLabs MCP is active (TTS, music, sound effects, agent creation). The Build Plan lists Suno, Udio, PlayHT, MiniMax speech, and Mureka via RunningHub. Higgsfield's `generate_audio` fed the game-studio pipeline. No audio project has shipped through DZNR.

**Why that is insufficient:** none of it is a shipped project of this type with stages, checkpoints, deliverables, and a cost and time envelope that were actually observed. Writing those from theory would produce a workflow that reads plausible and is wrong where it matters.

**To complete this stub:** answer the open questions in the frontmatter (or name one real project and let it be written from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-04): created as stub with open questions.
