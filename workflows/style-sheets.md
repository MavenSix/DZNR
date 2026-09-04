---
workflow: style-sheets
name: Style Sheets for Creative Work
status: stub
version: 0.1
lead: snape
supporting: [cheetara, gandalf, gibson]
chains: [9]
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["style sheet for", "style type", "look for", "visual style guide for", "define the [x] style", "style pack for"]
  spoken: ["Hey DZNR, make a style sheet for [look]", "Hey DZNR, define a [name] style for the [project]"]
inputs_required: []
stages:
  - id: s1
    name: Reference intake
    owner: snape
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
    name: Style contract
    owner: snape
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
    name: Injection blocks per tool
    owner: cheetara
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
    name: Proof renders across media
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
    name: Register and version
    owner: snape
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
  - "Is a style sheet the generalization of a QKI pack (palette, temperament, line, material, motion, MJ params, injection block) to non-QKI styles, or a different shape?"
  - "Which media must one style sheet cover: image prompts, video prompts, 3D materials, motion tokens, CSS tokens? All five, or a subset per style?"
  - "Where do style sheets live: `~/DZNR/styles/`, inside each project, or in DZNR OS state so they are cross-project (Build Plan principle 5)?"
  - "Name three style types Kevin wants first (for example: editorial luxury, brutalist product, painterly concept). The stub is written from those."
  - "What is the proof: one render per medium that passes a taste pass, or a Prime-Gate-style pass list per style?"
---

# Style Sheets for Creative Work

## Purpose

Stub. This project type is in Kevin's first set but no past project exists to write it from. Tár treats a match on this workflow as a prompt to read the open questions aloud and offer the nearest complete workflow, never as something to execute.

## Stages

### s1. Reference intake

Owner snape. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s2. Style contract

Owner snape. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s3. Injection blocks per tool

Owner cheetara. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s4. Proof renders across media

Owner gibson. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s5. Register and version

Owner snape. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

## Checkpoints

Not yet defined. At minimum, the first stage after inputs are confirmed and the stage before any spend over the voice threshold.

## Deliverables

Not yet defined.

## What this is not

Not executable. Not a substitute for the nearest complete workflow.

## Grounding notes

**Precedent that exists:** QKI world packs are the closest precedent: a swappable palette and behaviour contract over a fixed engine, with a style-injection block generators prepend to prompts. `aesthetic-system` names twelve movements with machine-readable specs for Midjourney, Three.js, and Tailwind. `theme-factory` has ten presets. `brand-from-scratch` and `ds-theming` extract from references. The Build Plan proposes 'style packs as bundles of tokens plus patterns plus prompts, applied with one command.' None of these is yet a single style-sheet contract that spans image, video, 3D, motion, and code.

**Why that is insufficient:** none of it is a shipped project of this type with stages, checkpoints, deliverables, and a cost and time envelope that were actually observed. Writing those from theory would produce a workflow that reads plausible and is wrong where it matters.

**To complete this stub:** answer the open questions in the frontmatter (or name one real project and let it be written from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-04): created as stub with open questions.
