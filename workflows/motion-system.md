---
workflow: motion-system
name: Motion System
status: stub
version: 0.1
lead: snape
supporting: [gibson, neo, gandalf]
chains: [2]
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["motion system for", "animation tokens", "motion design language", "how should things move", "easing and timing for", "micro-interactions for"]
  spoken: ["Hey DZNR, define the motion system for [brand]", "Hey DZNR, how should [product] move"]
inputs_required: []
stages:
  - id: s1
    name: Motion principles from brand and posture
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
    name: Motion tokens
    owner: snape
    chain_node: "Chain 2 NODE 2"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Figma motion specs
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
  - id: s4
    name: Code implementation
    owner: neo
    chain_node: "Chain 2 NODE 4"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Performance and reduced-motion pass
    owner: gandalf
    chain_node: "Chain 2 NODE 4"
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
  - "Is the motion system a section of the brand system workflow (s4 tokens gain duration, easing, distance, stagger) or a standalone deliverable? Standalone implies a client asks for it alone."
  - "Token format: W3C design tokens have no motion group yet; use Figma variables plus CSS custom properties plus a Motion.dev config? Decide the triple."
  - "Does the QKI seven-state grammar (Stillness, Eruption, Flow, Suspension, Collapse, Resonance, Quantum Fracture) map onto interface motion, or is that a QKI-only vocabulary?"
  - "Dual artifact here means Figma motion specs plus code; which library is the code default, Motion.dev or GSAP?"
  - "Which brand or product gets the first motion system? Written from that."
---

# Motion System

## Purpose

Stub. This project type is in Kevin's first set but no past project exists to write it from. Tár treats a match on this workflow as a prompt to read the open questions aloud and offer the nearest complete workflow, never as something to execute.

## Stages

### s1. Motion principles from brand and posture

Owner snape. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s2. Motion tokens

Owner snape, Chain 2 NODE 2. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s3. Figma motion specs

Owner snape. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s4. Code implementation

Owner neo, Chain 2 NODE 4. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s5. Performance and reduced-motion pass

Owner gandalf, Chain 2 NODE 4. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

## Checkpoints

Not yet defined. At minimum, the first stage after inputs are confirmed and the stage before any spend over the voice threshold.

## Deliverables

Not yet defined.

## What this is not

Not executable. Not a substitute for the nearest complete workflow.

## Grounding notes

**Precedent that exists:** `web-animation` (Motion.dev, GSAP), `fixing-motion-performance`, `figma-implement-motion`, `figma-use-motion`, and the `animate` and `delight` workshop skills exist. QKI has a seven-state motion grammar. The design-system workflow produces tokens but no motion tokens. No brand has received a motion system through DZNR.

**Why that is insufficient:** none of it is a shipped project of this type with stages, checkpoints, deliverables, and a cost and time envelope that were actually observed. Writing those from theory would produce a workflow that reads plausible and is wrong where it matters.

**To complete this stub:** answer the open questions in the frontmatter (or name one real project and let it be written from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-04): created as stub with open questions.
