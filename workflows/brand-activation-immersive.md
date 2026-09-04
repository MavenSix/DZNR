---
workflow: brand-activation-immersive
name: Brand Activation and Immersive Experience
status: complete
version: 1.0
lead: gibson
supporting: [neo, snape, gandalf, snake-eyes, morpheus, tar]
chains: [3, 4]
grounded_in:
  - path: ~/Documents/DZNR EXPERIMENTS/jordan3-configurator/ (README.md, NOTICE.md, tools/blender/README.md, git log 2026-09-02)
    date: 2026-09-02
  - path: ~/Documents/DZNR EXPERIMENTS/_superseded_assets/
    date: 2026-08-31
  - path: ~/DZNR/routing/CHAINS.md (Chain 3)
    date: 2026-05-18
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["3D configurator for", "brand activation for", "immersive experience for", "interactive 3D for", "product configurator", "installation for", "Three.js experience for"]
  spoken: ["Hey DZNR, build a configurator for [product]", "Hey DZNR, start a brand activation for [brand]", "Hey DZNR, make [product] explorable in 3D"]
inputs_required:
  - id: persona
    source: memory
    on_missing: route:sherlock:synthetic-audience
  - id: journey
    source: memory
    on_missing: route:gibson:journey-mapping
  - id: asset_or_asset_plan
    source: inline
    on_missing: ask
  - id: brand_tokens
    source: memory
    on_missing: route:snape:brand-from-scratch
stages:
  - id: s0
    name: Prototype prerequisites
    owner: gibson
    chain_node: "Chain 3 NODE 0"
    skills: [synthetic-audience, journey-mapping]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: []
    produces: [persona record, journey map]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Prerequisites gate: persona and journey both in memory"
    exit_allowed: false
  - id: s1
    name: Experience concept and asset spec
    owner: gibson
    chain_node: "Chain 3 NODE 1 and NODE 2"
    skills: [3d-experience-design, immersive-experience-design, live-experience, idea-to-brief]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [experience design doc, asset spec for the SOW, parts contract]
    checkpoint: true
    checkpoint_prompt: "Concept is set. The asset spec asks for [n] named parts, unlit albedo, separate roughness and normal, non-overlapping UVs, 50 to 150k triangles. Approve the spec before we source the asset?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Procedural placeholder
    owner: gibson
    chain_node: "Chain 3 NODE 3"
    skills: [webgl-threejs, 3d-experience-design]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code]
    produces: [parametric stand-in mesh, canvas-generated textures, camera rig, event contract]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Source or generate the asset
    owner: snake-eyes
    chain_node: null
    skills: []
    models:
      draft: runninghub:hunyuan3d-v3.1
      standard: tripo:image-to-3d
      hero: null
    tools: [sketchfab, meshy, tripo, runninghub, blender-cli]
    produces: [candidate GLB with license record]
    checkpoint: true
    checkpoint_prompt: "Candidate asset: [source], [license], [triangle count], [n] materials. Run the asset gate on it?"
    gate: null
    exit_allowed: false
  - id: s4
    name: Asset gate
    owner: neo
    chain_node: null
    skills: [qa-handoff]
    models: null
    tools: [tools/asset-qa.mjs, blender-cli]
    produces: [per-part audit, measured resolution, pass or fail with reasons]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Asset gate: named parts or separable materials, UV integrity, texture resolution measured, triangle budget; fail returns to s3"
    exit_allowed: false
  - id: s5
    name: Asset derivation pipeline
    owner: gibson
    chain_node: null
    skills: [3d-experience-design, webgl-threejs]
    models: null
    tools: [blender-cli headless, python]
    produces: [parts GLB with named meshes, per-texel part mask, baked AO, focus rigs from measured centroids, seven-camera QA sweep]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Mask gate: contact-sheet review from seven cameras; coverage percentages alone never prove a mask"
    exit_allowed: false
  - id: s6
    name: Build the experience
    owner: gibson
    chain_node: "Chain 3 NODE 3"
    skills: [webgl-threejs, web-animation, frontend-aesthetics]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code, vite, react-three-fiber]
    produces: [working R3F app, config state, SKU mapper, offline-capable lighting]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s7
    name: Brand layer
    owner: snape
    chain_node: "Chain 3 NODE 5"
    skills: [design-language, ds-theming, aesthetic-system]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [figma-mcp]
    produces: [tokens applied, type and colour, UI chrome, Figma frame of the final layout]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s8
    name: Harden, polish, verify
    owner: gandalf
    chain_node: "Chain 3 NODE 4 (Gandalf call point)"
    skills: [harden, polish, fixing-motion-performance, fixing-accessibility]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [claude-code]
    produces: [typecheck, build, asset gate, SKU round-trip, verified block in commit message]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Verify gate: every commit ends with a Verified block listing sweep, tsc, build, asset gate, round-trip"
    exit_allowed: false
  - id: s9
    name: Deploy and attribute
    owner: neo
    chain_node: "Chain 4 (other platform branch)"
    skills: [repo-scaffold]
    models: null
    tools: [vercel-mcp, netlify-mcp, github]
    produces: [live URL, NOTICE with license, attribution in UI and in GLB extras]
    checkpoint: true
    checkpoint_prompt: "Live at [url]. Attribution carried in NOTICE, UI, and the GLB. Ship the findings write-up too, package a pitch, or stop?"
    gate: null
    exit_allowed: true
  - id: s10
    name: Findings write-up
    owner: gibson
    chain_node: null
    skills: [communications, doc-coauthoring]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [README with the asset spec worth writing into a SOW and the scars]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: code
    dual_with: figma
  - type: glb
    dual_with: null
  - type: markdown
    dual_with: null
cost_envelope_usd: [20, 300]
time_envelope: "2 to 4 working days; the AJ1 configurator took about 2.5 days, most of it asset derivation"
exit_criteria:
  - "Persona and journey in memory before s1"
  - "Asset spec written and approved before sourcing"
  - "Asset passed the gate; if it failed, the failure is recorded and a replacement was sourced"
  - "Every commit carries a Verified block"
  - "Live URL with attribution carried in three places when a third-party asset is used"
  - "Findings README states what the asset cost in time and what the SOW should demand next time"
memory_writes:
  - "project.asset_spec (the SOW-ready table)"
  - "project.asset_source and license"
  - "project.parts_contract"
  - "project.deploy_url"
  - "project.scars (what failed and why, one line each)"
open_questions: []
---

# Brand Activation and Immersive Experience

## Purpose

Make a brand or product explorable: a 3D configurator, an interactive installation, a scroll-driven world, a physical-digital activation. Gibson leads; Neo ships; Snape holds the brand; Gandalf hardens. The AJ1 configurator is the reference, and its lesson governs the workflow: "The configurator code is asset-agnostic and was never the hard part. The asset is the risk, the cost and the schedule driver."

## Stages

### s0. Prototype prerequisites

Chain 3 NODE 0. The Jordan 3 build had no persona or journey artifact anywhere in the repo. It was a technical demo, so that was acceptable then; it is not acceptable for a client activation. The gate holds.

### s1. Experience concept and asset spec

Gibson writes the experience doc and, in the same pass, the **asset spec**: the table the AJ1 README calls "worth writing into a SOW." Parts as separate meshes or named material slots; unlit albedo; separate roughness, normal, AO; non-overlapping UVs; logos as decals; 50 to 150k triangles. And the `parts.ts` contract: part ids, colourways, materials, sizes, add-ons, focus rigs. "`parts.ts` is the contract." Checkpoint: approve the spec before any asset money is spent.

### s2. Procedural placeholder

Before any real asset exists, Gibson builds the whole experience against a parametric stand-in (the AJ1 build lofted a shoe last from Catmull-Rom profile tables with canvas-generated textures, "zero binary assets"). Camera rig, event contract, state store, and UI all work against the placeholder. This is what makes the code asset-agnostic and lets the asset arrive late without blocking.

### s3. Source or generate the asset

Three paths, in order of preference for hero work: licensed photographic PBR from a marketplace (AJ1 came from Sketchfab, CC-BY-4.0); commissioned from a 3D artist against the s1 spec; generated (image-to-3D via Tripo or Meshy, or Hunyuan3D via RunningHub or the PC). Generated meshes arrive as one fused mesh with a baked albedo and need the full s5 pipeline; the AJ3 attempt burned most of a day on that before the pivot. Checkpoint: name the candidate and its license before gating it.

### s4. Asset gate

"Run this on any candidate asset before committing to it." `tools/asset-qa.mjs` plus a headless Blender pass: named parts or separable materials, UV integrity, texture resolution *measured* ("Resolution is measured, not chosen"), triangle budget. Fail returns to s3 with the reason recorded. This gate is the single biggest schedule protection in the workflow.

### s5. Asset derivation pipeline

Headless Blender from the CLI ("no add-on, no GUI, no MCP bridge"): extract and rename meshes, drop unused UV sets, re-encode textures, bake AO to vertex colours, build the per-texel part mask (red channel part index, green channel exterior flag), compute focus rigs from *measured* part centroids (the AJ1 asset ran along Z where the rigs assumed X), and render a seven-camera QA contact sheet. Rules that cost real time to learn: "Classify from the albedo, and almost nothing else." "Anything used in a per-texel threshold must be interpolated per vertex." "Coverage percentages alone never prove a mask is correct." "One camera is not enough."

### s6. Build the experience

React Three Fiber, Drei, Zustand, Vite, TypeScript. Lightformer environment so it runs offline. Selection is "a silhouette rim, never a tint on the albedo," because "a configurator that shifts the colour you are choosing is lying to you." Config emits JSON and a round-trippable SKU.

### s7. Brand layer

Snape applies tokens, type, and chrome, and produces a Figma frame of the final layout so the deliverable is dual (code plus design file). For an installation, this stage also covers the physical spec handoff.

### s8. Harden, polish, verify

Gandalf's four skills. Every commit ends with a "Verified:" block listing the QA sweep, typecheck, build, asset gate, and SKU round-trip. The AJ1 log did this on every one of its seven commits.

### s9. Deploy and attribute

Neo deploys (Vercel for the AJ1 build). If the asset is third-party, attribution is "carried in three places": NOTICE, the UI, and the GLB's `asset.extras`. Checkpoint: findings, pitch, or stop.

### s10. Findings write-up

The README that says what the asset cost, what to demand in the next SOW, and the scars. "Every stage is a scar." "The failures are the transferable part."

## Checkpoints

- **s1** asset spec approval (money is about to be spent).
- **s3** candidate asset and license.
- **s9** deploy done; what next.

## Deliverables

Deployed code (dual with a Figma frame of the final layout), the derived GLB and mask, and the findings README. For an installation: plus the physical spec.

## What this is not

- Not a QKI asset (Cheetara; different render law).
- Not a landing page with a 3D hero (landing page workflow; this one is for the experience itself).
- Not a game (`game-studio` via Gibson).
- Not a video (short-form video workflow).

## Grounding notes

Source: jordan3-configurator (7 commits, all 2026-09-02, co-authored by Claude Opus 5) and `_superseded_assets` (AJ3 image-to-3D era, 2026-08-31; AJ1 Sketchfab era, 2026-09-01). Stages s2 through s5 are lifted directly from the file timeline and the Blender README.

Deliberate differences: s0 prerequisites now enforced (none existed); s1 asset spec is written *before* sourcing (the real project discovered it after); s4 asset gate runs *before* commitment (the real project wrote `asset-qa.mjs` on day two after the AJ3 failure); s7 Figma frame added for dual artifact (the real project shipped code only). Chain 4 has no React or Vite or Vercel branch, so s9 uses its "other platform" leg; a Chain 4 amendment is flagged in the v2.6.0 changelog.

## Changelog

- 1.0 (2026-09-04): created from the Jordan 3 / AJ1 configurator and Chain 3.
