---
workflow: pulse-os-artifacts
name: Pulse OS Artifacts
status: complete
version: 1.0
lead: cheetara
supporting: [gibson, neo, sherlock, snape, morpheus, tar]
chains: [8, 9, 3]
grounded_in:
  - path: ~/Documents/DZNR EXPERIMENTS/pulse-os-description.md
    date: 2026-09-04
  - path: ~/DZNR/workflows/qki-serialized-world.md
    date: 2026-09-04
  - path: ~/DZNR/routing/CHAINS.md (Chains 8, 9, 3)
    date: 2026-08-12
industry_posture_sensitive: false
confidential_default: true
triggers:
  typed: ["Pulse OS world for", "World Bible for", "Pulse artifacts for [manuscript]", "characters for the Pulse world", "scene compositions for", "knowledge base for the world", "Pulse Studio assets"]
  spoken: ["Hey DZNR, build the Pulse world for [manuscript]", "Hey DZNR, make the World Bible for [title]", "Hey DZNR, compose scene [n] of [title]"]
inputs_required:
  - id: manuscript_or_excerpt
    source: inline
    on_missing: block
  - id: author_direction
    source: inline
    on_missing: ask
  - id: world_bible
    source: memory
    on_missing: stage:s1
  - id: pack
    source: memory
    on_missing: stage:s2
stages:
  - id: s1
    name: Ingest and World Bible
    owner: sherlock
    chain_node: null
    skills: [research-synthesis, communications, ux-taxonomy]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [entity extraction: characters, locations, objects, rules, motifs; draft World Bible; canon register]
    checkpoint: true
    checkpoint_prompt: "Draft World Bible: [n] characters, [n] locations, [n] rules, [n] motifs. Lock this as canon, or correct first?"
    gate: "Canon gate: author locks the Bible before any visual work"
    exit_allowed: true
  - id: s2
    name: World pack from the Bible
    owner: cheetara
    chain_node: "Chain 9"
    skills: [qki-style-authority, brand-from-scratch]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [world pack: factions from the Bible's social structure, palette from the Bible's motifs, motion bias from tone]
    checkpoint: true
    checkpoint_prompt: "The pack reads the Bible as [n] factions with [palette description]. Confirm, or is the visual identity meant to be something other than QKI?"
    gate: null
    exit_allowed: false
  - id: s3
    name: Character nodes
    owner: cheetara
    chain_node: "Chain 8 NODE 3A"
    skills: [qki-character-generator]
    models:
      draft: runninghub:midjourney-v7
      standard: midjourney:own-account-web
      hero: midjourney:own-account-web
    tools: [midjourney-web, higgsfield-mcp, weavy, runninghub]
    produces: [per character: node record citing Bible passages, hero portrait, turnaround, expression sheet, Soul Character lock]
    checkpoint: true
    checkpoint_prompt: "[Character] portrait passed the Prime Gate and matches Bible passages [refs]. Lock the identity?"
    gate: "Prime Gate plus canon check: a render that contradicts the Bible fails regardless of quality"
    exit_allowed: false
  - id: s4
    name: Location nodes
    owner: cheetara
    chain_node: "Chain 8 NODE 3B"
    skills: [qki-place-generator]
    models:
      draft: runninghub:midjourney-v7
      standard: midjourney:own-account-web
      hero: midjourney:own-account-web
    tools: [blender-mcp, midjourney-web, higgsfield-mcp, runninghub]
    produces: [per location: Layer 1 block, establishing shot, reference element lock, geography entry in the Bible]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Prime Gate plus canon check"
    exit_allowed: false
  - id: s5
    name: Scene compositions
    owner: gibson
    chain_node: "Chain 3 NODE 2"
    skills: [experience-output-design, immersive-experience-design, seedance-shotlist-director, web-animation]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [figjam-mcp]
    produces: [per scene: composition, atmosphere, lighting, sound cue, character presence, tied to specific passages; shot list where motion is wanted]
    checkpoint: true
    checkpoint_prompt: "Scene [n] proposes [composition] for passage [ref] with [characters present]. Approve, redirect, or skip?"
    gate: "Canon check per scene"
    exit_allowed: false
  - id: s6
    name: Scene assets
    owner: cheetara
    chain_node: "Chain 8"
    skills: [qki-place-generator, qki-object-generator, seedance-director]
    models:
      draft: runninghub:wan-3.0
      standard: runninghub:seedance-2.5
      hero: higgsfield:video
    tools: [higgsfield-mcp, runninghub, elevenlabs-mcp]
    produces: [plates, motion clips, ambient audio cues, manifest entries with World Bible references]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Prime Gate plus canon check"
    exit_allowed: false
  - id: s7
    name: Knowledge base export
    owner: neo
    chain_node: null
    skills: [xcm-context-package, repo-scaffold]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [supabase-mcp]
    produces: [World Bible, characters, locations, scenes, compositions, and assets as records in the Pulse entity shape; manifest with passage citations]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Schema gate: every record maps to a Pulse core entity; nothing orphaned"
    exit_allowed: true
  - id: s8
    name: Walkthrough and handoff
    owner: gibson
    chain_node: "Chain 3 NODE 3"
    skills: [webgl-threejs, web-artifacts-builder]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code, vercel-mcp]
    produces: [assembled walkthrough of the scenes, ready for Pulse Studio polish and deploy]
    checkpoint: true
    checkpoint_prompt: "Walkthrough assembled: [n] scenes, [n] characters, [n] locations, all canon-checked. Hand to Pulse Studio for polish and deploy?"
    gate: null
    exit_allowed: true
deliverables:
  - type: markdown
    dual_with: null
  - type: image
    dual_with: glb
  - type: video
    dual_with: null
  - type: manifest
    dual_with: null
  - type: code
    dual_with: null
cost_envelope_usd: [40, 400]
time_envelope: "World Bible and pack in a day; characters and locations one to two days for a novel-scale cast; scene compositions scale with scene count; the target the product sets is weeks, not years"
exit_criteria:
  - "World Bible locked by the author before any render"
  - "Every asset and scene cites the manuscript passages it derives from"
  - "No render shipped that failed the Prime Gate or the canon check"
  - "Recurring characters identity-locked (Soul Character plus cref)"
  - "Every record maps to a Pulse core entity: Project, WorldBible, Character, Location, Scene, SceneComposition, Asset, Deployment"
  - "The author approved every scene composition individually"
memory_writes:
  - "world.bible_path and canon_locked_at"
  - "world.pack (active)"
  - "world.identity_locks"
  - "world.scene_index (scene id to passage refs to composition to assets)"
  - "world.canon_violations (caught and corrected, with the rule that was hit)"
open_questions: []
---

# Pulse OS Artifacts

## Purpose

Produce the artifacts a Pulse OS world is made of: the World Bible, the characters, the locations, the scene compositions, the assets, and the knowledge base that ties them to the manuscript. Pulse OS is Kevin's product (MavenSix, LLC): an agentic operating system that turns an author's written work into a deployable immersive web experience, with the author directing and agents executing. DZNR is the production tooling that can feed a Pulse world before Pulse Studio's own agent ensemble takes over, and the reference implementation for what those agents should do.

Three Pulse principles govern every stage and override DZNR's own defaults where they conflict:

1. **The author is the director.** Agents propose, the author decides. Every stage with a checkpoint here is one the author must approve; DZNR does not auto-proceed on silence.
2. **The world is the unit of work.** World Bible coherence is the number one constraint. "An agent change that breaks canon is a defect regardless of how good the output looks." The canon check is a gate alongside the Prime Gate, and it wins ties.
3. **Deploy to the creator's domain.** Nothing here is trapped in DZNR, Pulse, or any vendor. Exports are records and files the author owns.

## Stages

### s1. Ingest and World Bible

Pulse stage 1. Sherlock extracts entities from the manuscript (characters, locations, objects, rules, motifs) and drafts the World Bible with a canon register: every entry cites the passages it came from. The author corrects, redirects, and **locks canon**. Nothing visual starts before the lock. Exit allowed: a locked Bible is a complete deliverable on its own and is the knowledge base's spine.

### s2. World pack from the Bible

Pulse stage 2 begins. Cheetara reads the Bible's social structure as factions and its motifs and tone as palette and motion bias, then drafts a world pack via Chain 9 path 2 (the Bible supplies the temperament words). Checkpoint asks whether QKI is the intended visual identity; if the author wants photoreal or another style, this workflow hands the visual stages to Gibson with a different render law, but the Bible, canon check, and entity mapping stay.

### s3. Character nodes

Chain 8 NODE 3A per character, with one addition: each node record cites the Bible passages it portrays, and the gate is the Prime Gate **plus** a canon check against those passages. A beautiful portrait with the wrong eye colour fails. Identity lock (Higgsfield Soul Character plus Midjourney cref) is mandatory for any character that appears in more than one scene. Checkpoint per character: the author locks the identity.

### s4. Location nodes

Chain 8 NODE 3B per location: Layer 1 block first, establishing shot over it, reference element lock. The location's geography entry in the Bible is updated from the block (distances, adjacency) so the knowledge base and the render agree.

### s5. Scene compositions

Pulse stage 3. Gibson proposes, scene by scene, tied to specific passages: composition, atmosphere, lighting, sound cue, and which characters are present. `experience-output-design` governs any in-world text or narration. Where motion is wanted, `seedance-shotlist-director` produces the shot list. The author reviews each scene individually; this is the highest-frequency checkpoint in the workflow and it is deliberate. Voice mode reads each proposal in three sentences and waits.

### s6. Scene assets

Cheetara renders plates and motion clips against the approved compositions. Video tiers: Wan 3.0 via RunningHub for drafts, Seedance 2.5 via RunningHub for standard (this is how the shot lists execute; Seedance has no direct API), Higgsfield for hero and for anything with an identity-locked character. Ambient audio cues through ElevenLabs. `confidential_default` is true because a manuscript is unpublished intellectual property; RunningHub is used only with the author's consent recorded in memory, and never for real-person likenesses.

### s7. Knowledge base export

Neo maps everything to the Pulse core entities (Project, WorldBible, Character, Location, Scene, SceneComposition, Asset, Deployment) and exports records with passage citations. Supabase MCP writes directly when a Pulse project exists; otherwise a JSON bundle plus the manifest. Schema gate: nothing orphaned, every asset reachable from a scene, every scene reachable from the Bible.

### s8. Walkthrough and handoff

Gibson assembles the scenes into a walkthrough (R3F, the same immersive layer Pulse uses) so the author can experience the world before Pulse Studio's polish and deploy stages (Pulse stages 4 and 5) take over. Checkpoint: hand off.

## Checkpoints

- **s1** lock canon.
- **s2** confirm pack and visual identity.
- **s3** lock each character identity.
- **s5** approve each scene.
- **s8** hand off.

More checkpoints than any other workflow except the IA. That is the product principle, not a DZNR habit.

## Deliverables

World Bible (markdown, the knowledge base spine); per character and location the hero image (dual with mesh where a location or object needs Layer 1 geometry in the experience), sheets, and identity locks; per scene the composition record and assets (plates, clips, audio cues); the manifest with passage citations; the entity export; the walkthrough build.

## What this is not

- Not Pulse Studio itself. This workflow produces artifacts and a reference implementation; Pulse's own orchestrator, domain agents, polish, deploy, and analytics are product code (Next.js, Supabase, Vercel AI SDK) built through the SaaS application workflow when that one is complete.
- Not a QKI world for its own sake (previous workflow). Here the manuscript and Bible come first and QKI is one visual identity the author may choose.
- Not a chat-with-characters product. "Character.AI lets you play in stories. MavenSix builds stories worth playing in."
- Not autonomous. No stage auto-proceeds past a checkpoint on silence.

## Grounding notes

Source: the Pulse OS product description Kevin wrote on 2026-09-04 (five-stage pipeline, three principles, architecture, core entities, stack, phase status, design language), plus the QKI world workflow for the render mechanics. Phase 1 of Pulse (the signal layer) is in production; Phase 2 (the agentic creator layer this workflow mirrors) is beginning. No DZNR-produced Pulse artifact has shipped yet, so the stage mapping is DZNR's proposal for how its subagents cover Pulse's five stages: Sherlock for Ingest, Cheetara for World build, Gibson for Scene compose, Neo for the entity export, and Gibson again for the walkthrough that precedes Polish and Deploy.

Items to verify against the Pulse codebase when this runs for real: the exact field shape of each core entity for s7; whether Pulse's orchestrator expects the World Bible in a specific format; whether the Pulse design language (cinematic dark, Syne, JetBrains Mono, #0A0A14, the five accents) applies to the walkthrough in s8 or only to Pulse Studio's interface. Observability from the first commit is a Pulse rule; s7's schema gate exists partly so silent failure (the recurring Pulse defect class) cannot hide an orphaned asset.

## Changelog

- 1.0 (2026-09-04): created from the Pulse OS product description and the QKI world workflow.
