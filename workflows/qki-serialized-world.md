---
workflow: qki-serialized-world
name: QKI Serialized World
status: complete
version: 1.0
lead: cheetara
supporting: [snape, gandalf, gibson, tar]
chains: [8, 9]
grounded_in:
  - path: ~/Documents/DZNR EXPERIMENTS/packs/test-world.md
    date: 2026-08-13
  - path: ~/Documents/DZNR EXPERIMENTS/packs/test-world-b-glasswake.md
    date: 2026-08-13
  - path: ~/DZNR/routing/CHAINS.md (Chains 8 and 9)
    date: 2026-08-12
  - path: ~/DZNR/agents/cheetara/AGENT.md
    date: 2026-07-01
  - path: ~/.claude/skills/qki-style-authority/SKILL.md
    date: 2026-08-12
industry_posture_sensitive: false
confidential_default: false
triggers:
  typed: ["new QKI world", "author a pack", "set up a palette for", "QKI character", "QKI place", "QKI object", "world pack", "serialized world for"]
  spoken: ["Hey DZNR, start a new QKI world called [name]", "Hey DZNR, make a QKI character for [faction]", "Hey DZNR, block out a place in [world]"]
inputs_required:
  - id: palette_or_reference
    source: inline
    on_missing: ask
  - id: factions_with_temperament
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Load the engine
    owner: cheetara
    chain_node: "Chain 8 NODE 1"
    skills: [qki-style-authority]
    models: null
    tools: []
    produces: [engine loaded, fixed QKI DNA in context]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Engine gate: no generator runs without the style authority loaded"
    exit_allowed: false
  - id: s2
    name: Author or extract the world pack
    owner: cheetara
    chain_node: "Chain 9 NODE 1 and NODE 2"
    skills: [qki-style-authority, brand-from-scratch, ds-theming]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [pack draft: environment base palette, per-faction palette, temperament to behaviour mapping, optional essence layer, optional MJ override]
    checkpoint: true
    checkpoint_prompt: "Pack drafted: [n] factions, [base description], essence [yes or no]. Confirm palette per faction, material temperament, and motion bias?"
    gate: null
    exit_allowed: false
  - id: s3
    name: Validate and activate the pack
    owner: cheetara
    chain_node: "Chain 9 NODE 3"
    skills: [qki-style-authority]
    models: null
    tools: []
    produces: [packs/<pack-id>.md written, active pack set in project memory, faction legibility check passed]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Schema gate: pack validates against world-pack-schema; legibility check passes"
    exit_allowed: true
  - id: s4
    name: Draft the asset node
    owner: cheetara
    chain_node: "Chain 8 NODE 2 and 3A, 3B, or 3C"
    skills: [qki-character-generator, qki-place-generator, qki-object-generator]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [node record: name, faction, motion states, tier, mesh needed]
    checkpoint: true
    checkpoint_prompt: "[Asset type] [name], faction [x], motion states [y]. Confirm the node before rendering?"
    gate: null
    exit_allowed: false
  - id: s5
    name: Layer 1 spatial block (places only)
    owner: cheetara
    chain_node: "Chain 8 NODE 3B"
    skills: [qki-place-generator]
    models: null
    tools: [blender-mcp, unreal-mcp]
    produces: [space and camera block-out, layout animatic]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s6
    name: Hero render
    owner: cheetara
    chain_node: "Chain 8 NODE 3A, 3B, 3C"
    skills: [qki-character-generator, qki-place-generator, qki-object-generator]
    models:
      draft: runninghub:midjourney-v7
      standard: midjourney:own-account-web
      hero: midjourney:own-account-web
    tools: [midjourney-web, runninghub, inbox/<asset-type>/<id>/]
    produces: [hero 2D with injection block, sref anchor, dropped in inbox]
    checkpoint: true
    checkpoint_prompt: "Hero prompt is ready with the [pack] injection block. Run it on your Midjourney account and drop the keeper in the inbox, or send the non-sref pass through RunningHub?"
    gate: null
    exit_allowed: false
  - id: s7
    name: Taste correction
    owner: gandalf
    chain_node: "Chain 8 (Gandalf call point)"
    skills: [design-taste-frontend, high-end-visual-design, critique]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [prompt refinement when close-not-right]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s8
    name: Identity lock and variations
    owner: cheetara
    chain_node: "Chain 8 NODE 3A, 3B, 3C"
    skills: [qki-character-generator, qki-place-generator, qki-object-generator]
    models:
      draft: higgsfield:image
      standard: higgsfield:soul-character
      hero: higgsfield:soul-character
    tools: [higgsfield-mcp, weavy]
    produces: [Soul Character or reference element registered, cref captured, turnaround, expression sheet, orthographics, detail variants]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s9
    name: Mesh (hero objects, optional)
    owner: cheetara
    chain_node: "Chain 8 NODE 3C"
    skills: [qki-object-generator]
    models:
      draft: runninghub:hunyuan3d-v3.1
      standard: tripo:image-to-3d
      hero: meshy:image-to-3d
    tools: [weavy, tripo, meshy, runninghub, blender-mcp]
    produces: [3D-ready mesh, retopo and NPR passes]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s10
    name: Prime Gate
    owner: cheetara
    chain_node: "Chain 8 (every render)"
    skills: [qki-style-authority]
    models:
      draft: claude:opus
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [pass or fail against the five pass lines and four fail lines]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Prime Gate: fail regenerates; three fails asks about a per-pack sref override"
    exit_allowed: false
  - id: s11
    name: Manifest and return
    owner: cheetara
    chain_node: "Chain 8 NODE 5"
    skills: [qki-style-authority]
    models: null
    tools: []
    produces: [manifest entry: pack, faction, motion_state, layer, qki_version, source_tool, identity lock, file paths]
    checkpoint: true
    checkpoint_prompt: "[Asset] passed the Prime Gate and is in the manifest with its identity lock. Next asset, compound set, or hand to Gibson or Neo?"
    gate: null
    exit_allowed: true
deliverables:
  - type: markdown
    dual_with: null
  - type: image
    dual_with: glb
  - type: manifest
    dual_with: null
cost_envelope_usd: [5, 120]
time_envelope: "Pack authoring 20 to 60 minutes; one asset 30 to 120 minutes including the human Midjourney step; both test packs were written in two minutes each from path 2 input"
exit_criteria:
  - "Pack file exists at packs/<pack-id>.md and is active in project memory"
  - "Every render passed the Prime Gate; no render shipped on a fail"
  - "Every manifest entry carries pack, faction, motion state, layer, qki version, source tool, and identity lock"
  - "Recurring characters have a Higgsfield Soul Character and a captured cref"
  - "Places have a Layer 1 block before any drawn art"
memory_writes:
  - "project.active_pack"
  - "world.manifest (append per asset)"
  - "world.identity_locks (character id to Soul Character id and cref)"
  - "world.prime_gate_failures (count and reasons, per asset)"
open_questions: []
---

# QKI Serialized World

## Purpose

Build a world that holds across episodes: a palette-agnostic drawn style (Quantum Kinetic Ink) with a swappable pack that carries the factions and colours, and an asset pipeline where every character, place, and object is identity-locked and manifest-tagged. Cheetara owns it. Two rules from the engine govern everything: "The gate is not advisory. It is the filter." and "Layer 1 is never the finished look."

## Stages

### s1. Load the engine

Chain 8 NODE 1, non-negotiable. `qki-style-authority` supplies the fixed DNA: four-layer render model (spatial foundation, ink linework, colour holds, reality-breaking overlays), seven motion states (Stillness, Eruption, Flow, Suspension, Collapse, Resonance, Quantum Fracture), composition law, the Prime Gate, and the Midjourney parameter block (engine sref anchor, `--sw 250`, `--v 8.2`, `--cref` once locked).

### s2. Author or extract the world pack

Chain 9. Three intake paths: upload a pack file; paste named colours plus a one-word temperament per faction (both test packs used this path); or hand a moodboard or brand reference to Snape for palette extraction via `brand-from-scratch` or `ds-theming`. Cheetara maps temperament to behaviour: "ceremonial, restrained" became flat colour, unbroken line, Stillness and Resonance; "utilitarian, worn" became bleed, broken line, Flow and Collapse. Optional essence layer for a world-owned special energy (Glasswake's "Glasslight"); optional pack-level Midjourney override. "Cheetara does NOT invent a pack." Checkpoint: confirm per-faction palette, material temperament, and motion bias.

### s3. Validate and activate the pack

Validate against the world-pack schema, run the faction legibility check (can a viewer tell factions apart at thumbnail size), write `packs/<pack-id>.md`, set active in memory. Exit allowed here: a pack with no assets yet is a legitimate deliverable.

### s4. Draft the asset node

Per generator: character (name, faction, motion states), place (faction control, tier, contested state), object (faction, hero-tier or background, mesh needed). Checkpoint before any render spend.

### s5. Layer 1 spatial block (places only)

Blender MCP or Unreal MCP builds space and camera first. "Layout animatic, not final render." Fallback when neither is available: a text description of the Layer 1 scene for Kevin to execute locally. Never skipped for places; the drawn art goes over this frame.

### s6. Hero render

Midjourney with the pack's injection block prepended. Two paths: sref-locked hero work runs on Kevin's own Midjourney account, human-in-the-loop, keeper dropped into `inbox/<asset-type>/<id>/`; non-sref work (variations, secondary characters, background plates) may run unattended through RunningHub's Midjourney v7 endpoint. Checkpoint chooses the path. If Midjourney is unavailable, Cheetara pauses and voices the gap; she does not fall back for hero renders.

### s7. Taste correction

Gandalf when the render is close-not-right: `design-taste-frontend` for characters, `high-end-visual-design` or `gpt-taste` for places, `critique` for objects.

### s8. Identity lock and variations

Higgsfield Soul Character for recurring characters; reference element for places and hero objects; `--cref` captured. Weavy for sheet compositing, turnarounds, expression sheets, orthographics. If Higgsfield is unavailable, fall back to `--cref` only and flag the weaker lock in the manifest.

### s9. Mesh (hero objects, optional)

Weavy to Tripo or Meshy; Hunyuan3D via the PC or RunningHub for free iteration. Blender MCP for retopo and NPR passes. Mesh is Layer 1 material; the drawn art still goes on top.

### s10. Prime Gate

Every render. Pass lines: "This looks like a page from an incredibly high-budget graphic novel," "I can see the artist's hand in every line," "This could be printed and framed as concept art," "The imperfections feel intentional and alive," "I understand the faction ideology just from looking." Fail lines: "This looks like a 3D render," "This feels AI-generated and generic," "The style is trying to be photoreal," "This could be from any anime or comic." Fail regenerates. Three fails asks whether the pack needs its own sref override.

### s11. Manifest and return

Manifest entry with pack, faction, motion state, layer, qki version, source tool (including `runninghub` when used), identity lock reference, and file paths. Checkpoint: next asset, compound set (character then place then object on one manifest), or hand downstream to Gibson (experience) or Neo (build).

## Checkpoints

- **s2** pack confirmation.
- **s4** node confirmation before render spend.
- **s6** Midjourney path (own account or RunningHub).
- **s11** next.

## Deliverables

The pack file; per asset the hero image (dual with a mesh for hero objects), sheets and variations, and the manifest entry.

## What this is not

- Not a brand system (Snape; Chain 2). A pack looks like a style sheet but it is a QKI-specific contract.
- Not a Pulse OS world (that workflow consumes QKI assets but organizes around a World Bible and a manuscript).
- Not a 3D experience (brand activation workflow); Layer 1 here is never shipped as the look.
- Not photoreal, ever. That is a Prime Gate fail.

## Grounding notes

Source: both test packs (written 2026-08-13 10:44 and 10:46 from path-2 input, exercised through Higgsfield the same afternoon), Chains 8 and 9, Cheetara's AGENT.md, and the qki-style-authority SKILL.md.

Two gaps found while grounding, both flagged in the v2.6.0 changelog: the qki-style-authority skill lives at `~/.claude/skills/`, not in the DZNR repo, and its `references/world-pack-schema.md` and the asset-manifest schema are not on disk anywhere. Chain 9 NODE 1 and NODE 3 validate against a schema that does not exist. The pack and manifest field lists in this workflow's exit criteria are reconstructed from the two real packs and Cheetara's AGENT.md and should become that schema file.

Deliberate difference from the real run: s6 offers a RunningHub path for non-sref renders (v2.5.0); the test packs predate it.

## Changelog

- 1.0 (2026-09-04): created from the two QKI test packs, Chains 8 and 9, and the style authority.
