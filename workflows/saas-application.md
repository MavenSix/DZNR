---
workflow: saas-application
name: SaaS Application
status: stub
version: 0.1
lead: neo
supporting: [gibson, snape, sherlock, morpheus, gandalf]
chains: [1, 3, 4]
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["SaaS for", "web app for", "build the product", "MVP for", "Next.js app for", "Supabase app"]
  spoken: ["Hey DZNR, build the SaaS for [idea]", "Hey DZNR, MVP for [product]"]
inputs_required: []
stages:
  - id: s0
    name: Prototype prerequisites
    owner: gibson
    chain_node: "Chain 3 NODE 0"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s1
    name: Spec and architecture
    owner: gibson
    chain_node: "Chain 3 NODE 2"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s2
    name: Repo scaffold with observability
    owner: neo
    chain_node: "Chain 4"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Design system
    owner: snape
    chain_node: "Chain 2"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Build in sprints
    owner: neo
    chain_node: "Chain 4"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Deploy and instrument
    owner: neo
    chain_node: "Chain 4"
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s6
    name: Retention loop
    owner: morpheus
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
  - "Can the Pulse OS repo be mounted or described so the workflow is written from its real stages rather than from the description?"
  - "What did observability-from-the-first-commit concretely mean in Pulse (Sentry? OpenTelemetry? custom)? That becomes s2."
  - "Which product-tracking skills (model-product, design-tracking-plan, implement-tracking) are mandatory before first deploy?"
  - "Is the Phase 1 retention finding (activation fine, retention is the problem) a general rule Kevin wants encoded as a stage for every SaaS, or Pulse-specific?"
  - "Default stack: is Next.js App Router plus Supabase plus Vercel the fixed decision, or does the workflow branch?"
---

# SaaS Application

## Purpose

Stub. This project type is in Kevin's first set but no past project exists to write it from. Tár treats a match on this workflow as a prompt to read the open questions aloud and offer the nearest complete workflow, never as something to execute.

## Stages

### s0. Prototype prerequisites

Owner gibson, Chain 3 NODE 0. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s1. Spec and architecture

Owner gibson, Chain 3 NODE 2. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s2. Repo scaffold with observability

Owner neo, Chain 4. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s3. Design system

Owner snape, Chain 2. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s4. Build in sprints

Owner neo, Chain 4. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s5. Deploy and instrument

Owner neo, Chain 4. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

### s6. Retention loop

Owner morpheus. Skeleton only; skills, models, tools, checkpoint, and gate are filled when the open questions are answered.

## Checkpoints

Not yet defined. At minimum, the first stage after inputs are confirmed and the stage before any spend over the voice threshold.

## Deliverables

Not yet defined.

## What this is not

Not executable. Not a substitute for the nearest complete workflow.

## Grounding notes

**Precedent that exists:** Pulse OS itself is a SaaS application on Next.js, Supabase, Vercel AI SDK, and Vercel, with Phase 1 in production. Its codebase is not in DZNR EXPERIMENTS, so its actual build stages, observability setup, and defect history (silent failure) cannot be read. `repo-scaffold`, `product-management:write-spec`, and `engineering:system-design` exist.

**Why that is insufficient:** none of it is a shipped project of this type with stages, checkpoints, deliverables, and a cost and time envelope that were actually observed. Writing those from theory would produce a workflow that reads plausible and is wrong where it matters.

**To complete this stub:** answer the open questions in the frontmatter (or name one real project and let it be written from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-04): created as stub with open questions.
