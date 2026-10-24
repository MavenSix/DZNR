---
workflow: pulse-os-artifacts
name: Pulse OS Artifacts
status: complete
version: 1.4
lead: cheetara
supporting: [gibson, neo, sherlock, snape, morpheus, gandalf, tar]
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
  - id: lore
    source: memory
    on_missing: stage:s0
  - id: world_bible
    source: memory
    on_missing: stage:s1
  - id: pack
    source: memory
    on_missing: stage:s2
stages:
  - id: s0
    name: Lore engine
    owner: cheetara
    chain_node: "Chain 8 NODE 0"
    skills: [lore-engine]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [graphify]
    produces: [lore/ in the project folder: corpus normalised from inputs/<job-id>/ with the originals untouched; graphify lore graph (deep mode, --update on later runs); canon.json and a world-bible.md with every fact cited; questions.md and questions.json with numbered canon questions (conflicts, timeline, rule breaks, AMBIGUOUS links, alias candidates, render gaps) for Pulse OS to show the author; rulings.md and rulings.json applied]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Canon gate: no fact without a cited passage, no canon question answered by the engine"
    exit_allowed: true
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
    produces: [World Bible from lore/world-bible.md with motifs and themes added; canon register (lore/canon.json); the open canon questions put to the author in Pulse OS (lore/questions.json)]
    checkpoint: true
    checkpoint_prompt: "World Bible: [n] characters, [n] locations, [n] rules, [n] motifs, [n] open canon questions (lore/questions.md). Lock this as canon and answer what you can, or correct first? The author answers in Pulse OS, through DZNR OS's checkpoint endpoint."
    gate: "Canon gate: author locks the Bible before any visual work"
    exit_allowed: true
  - id: s2
    name: Author world pack from the Bible
    owner: cheetara
    chain_node: "Chain 8 NODE 0"
    skills: [author-world-authority, style-library, legendary-standard, quality-gate, brand-from-scratch, ds-theming]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [midjourney-web, higgsfield-mcp]
    produces: [author world pack in lore/world-pack.md with its pack_version, awaiting lore/pack-approval.json from Pulse OS: medium and realism from the brief and tonal references, era and place from the text, groups from the Bible's social structure, palette from its motifs and stated colours, camera, motion and sound from its tone, the canon each subject renders from, open canon questions with proposed answers; the style offer: 2 or 3 style-library entries chosen from the manuscript and brief as options, each shown in one option still of a place or object from the canon (never a character), each through the Fidelity Gate on the canon and quality-gate at SHIP; a quieter text-led treatment offered beside them; the author's choice (or the style ids Pulse OS sent on the job) recorded in the pack]
    checkpoint: true
    checkpoint_prompt: "The pack reads the Bible as [medium, realism], [era and place], [n] groups, [palette description], with [n] open canon questions. It offers [style A], [style B] and [style C], each shown in an option still of [place or object], and a quieter text-led treatment. Choose by seeing (one style, or a base and an accent), then approve the pack, or correct it first? QKI applies only if you choose a drawn medium and QKI. The author answers in Pulse OS, through DZNR OS's checkpoint endpoint."
    gate: "Author approval: nothing renders from a pack the author has not approved, except the option stills, which pass the Fidelity Gate on the canon and quality-gate at SHIP and show no character"
    exit_allowed: false
  - id: s3
    name: Character nodes
    owner: cheetara
    chain_node: "Chain 8 NODE 3A"
    skills: [legendary-standard, author-world-authority, prompt-architecture, midjourney-legendary, quality-gate, qki-character-generator]
    models:
      draft: runninghub:midjourney-v7
      standard: midjourney:own-account-web
      hero: midjourney:own-account-web
    tools: [midjourney-web, higgsfield-mcp, weavy, runninghub]
    produces: [per character a pack per legendary-standard: node record citing Bible passages; thesis from the character's passages; reference lock from the author's approved pack; palette of neutrals plus one signal sampled from the author's world; hero portrait in the pack's medium, locked; series (turnaround and expression sheet, one variable per frame); type layer for the dossier; staging; one motion beat; micro-detail from the canon; finishing (upscale before motion, one grade); curation with rejects recorded; prompts per prompt-architecture and midjourney-legendary for the tools used; Soul Character lock; the quality-gate scorecard with the author-trust block]
    checkpoint: true
    checkpoint_prompt: "[Character] portrait passed the Fidelity Gate and matches Bible passages [refs]. Lock the identity? The author answers in Pulse OS, through DZNR OS's checkpoint endpoint."
    gate: "Fidelity Gate (the pack's medium and the canon; the Prime Gate as well only if the pack opted into QKI): a render that contradicts the Bible fails regardless of quality. Then the author-trust checks and quality-gate: ship only at 4 or above on every dimension. A character whose look has an open canon question is not rendered"
    exit_allowed: false
  - id: s4
    name: Location nodes
    owner: cheetara
    chain_node: "Chain 8 NODE 3B"
    skills: [legendary-standard, author-world-authority, prompt-architecture, midjourney-legendary, quality-gate, qki-place-generator]
    models:
      draft: runninghub:midjourney-v7
      standard: midjourney:own-account-web
      hero: midjourney:own-account-web
    tools: [blender-mcp, midjourney-web, higgsfield-mcp, runninghub]
    produces: [per location a pack per legendary-standard: Layer 1 block; thesis from the place's passages; reference lock from the author's approved pack; palette of neutrals plus one signal sampled from the author's world; establishing shot in the pack's medium, locked; series (times of day, angles, one variable per frame); type layer; staging; one motion beat; micro-detail from the canon; finishing; curation; prompts per prompt-architecture and midjourney-legendary; reference element lock; geography entry in the Bible; the quality-gate scorecard with the author-trust block]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Fidelity Gate, then the author-trust checks and quality-gate: ship only at 4 or above on every dimension"
    exit_allowed: false
  - id: s5
    name: Scene compositions
    owner: gibson
    chain_node: "Chain 3 NODE 2"
    skills: [legendary-standard, prompt-architecture, experience-output-design, immersive-experience-design, seedance-shotlist-director, web-animation]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [figjam-mcp]
    produces: [per scene the plan of its pack per legendary-standard: thesis from the scene's passage, quoted on the composition; composition and staging; atmosphere, lighting and the palette's signal; the one motion beat and its shot list where motion is wanted; sound cue; character presence (characters whose look is unsettled shown unseen); in-world copy and micro-detail by Morpheus from the canon; prompts per prompt-architecture and midjourney-legendary]
    checkpoint: true
    checkpoint_prompt: "Scene [n] proposes [composition] for passage [ref] with [characters present]. Approve, redirect, or skip? The author answers in Pulse OS, through DZNR OS's checkpoint endpoint."
    gate: "Canon check per scene, and the author-trust checks T1 (the passage quoted), T2 (the author's choice) and T7 (no unsettled face)"
    exit_allowed: false
  - id: s6
    name: Scene assets
    owner: cheetara
    chain_node: "Chain 8"
    skills: [legendary-standard, author-world-authority, prompt-architecture, midjourney-legendary, quality-gate, qki-place-generator, qki-object-generator, seedance-director, wan-video-prompts]
    models:
      draft: runninghub:wan-3.0
      standard: runninghub:seedance-2.5
      hero: higgsfield:video
    tools: [higgsfield-mcp, runninghub, elevenlabs-mcp]
    produces: [per scene its pack per legendary-standard, completed: plates from the locked references, in the pack's medium and palette; series coherent with the characters and places; type layer; staging; one motion beat from the upscaled plate; micro-detail; finishing (upscale before motion, one grade and grain); curation with rejects recorded; ambient audio cues; a plain provenance line per asset; manifest entries with engine, pack and World Bible references; the quality-gate scorecard with the author-trust block]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Fidelity Gate, then the author-trust checks and quality-gate: ship only at 4 or above on every dimension, every failure mode a blocker on author work"
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
    skills: [immersive-world-site, legendary-standard, quality-gate, webgl-threejs, web-artifacts-builder, threejs-production-hardening]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code, vercel-mcp]
    produces: [site/plan.md and the experience per immersive-world-site, a world not a page: opens on the author's name and one of their sentences over a plate at SHIP; districts or chapters from the canon; scroll as camera; in-world copy from the canon, by Morpheus; every element showing its passage; respect controls and a quieter text-led mode; a keepsake; the performance budget met; ready for Pulse Studio polish and deploy]
    checkpoint: true
    checkpoint_prompt: "Walkthrough assembled: [n] districts or chapters, [n] scenes, [n] characters, [n] locations, all canon-checked and gated at SHIP. Hand to Pulse Studio for polish and deploy? The author answers in Pulse OS, through DZNR OS's checkpoint endpoint."
    gate: "Fidelity Gate on every plate and line of in-world copy, the author-trust checks, then quality-gate including F14 (respect controls) and the performance budget"
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
  - "Lore engine run on every input before the pack is drafted; every canon fact cites a passage; no canon question answered by the engine"
  - "World Bible locked by the author before any render"
  - "Author world pack approved by the author before any render; no canon question answered by guess"
  - "Every asset and scene cites the manuscript passages it derives from"
  - "No render shipped that failed the Fidelity Gate (medium and canon), or the Prime Gate on a pack that opted into QKI"
  - "Recurring characters identity-locked (Soul Character plus cref)"
  - "Every record maps to a Pulse core entity: Project, WorldBible, Character, Location, Scene, SceneComposition, Asset, Deployment"
  - "The author approved every scene composition individually"
  - "The style was the author's choice, made by seeing the option stills (or sent by Pulse OS as style ids), and is recorded in the pack"
  - "Every asset shipped as a legendary-standard pack and passed the Fidelity Gate, the author-trust checks (legendary-standard/references/author-trust.md) and quality-gate at 4 or above on every dimension"
  - "No character's face or look rendered before the author settled it"
memory_writes:
  - "world.lore_path (the project's lore/ folder) and lore_run_at"
  - "world.bible_path and canon_locked_at"
  - "world.pack (active; engine author-world unless the author chose QKI), its pack_version and approved_by_author"
  - "world.canon_rulings (the author's answers to canon questions, kept in lore/rulings.md and lore/rulings.json)"
  - "world.identity_locks"
  - "world.scene_index (scene id to passage refs to composition to assets)"
  - "world.canon_violations (caught and corrected, with the rule that was hit)"
open_questions: []
---

# Pulse OS Artifacts

## Purpose

Produce the artifacts a Pulse OS world is made of: the World Bible, the characters, the locations, the scene compositions, the assets, and the knowledge base that ties them to the manuscript. Pulse OS is Kevin's product (MavenSix, LLC): an agentic operating system that turns an author's written work into a deployable immersive web experience, with the author directing and agents executing. DZNR is the production tooling that can feed a Pulse world before Pulse Studio's own agent ensemble takes over, and the reference implementation for what those agents should do.

Three Pulse principles govern every stage and override DZNR's own defaults where they conflict:

1. **The author is the director.** Agents propose, the author decides. Every stage with a checkpoint here is one the author must approve; DZNR does not auto-proceed on silence. The author does this in Pulse OS, not DZNR OS (see "The author answers in Pulse OS" below).
2. **The world is the unit of work.** World Bible coherence is the number one constraint. "An agent change that breaks canon is a defect regardless of how good the output looks." The canon check is the heart of the Fidelity Gate, the gate every render here passes, and it wins ties.
3. **Deploy to the creator's domain.** Nothing here is trapped in DZNR, Pulse, or any vendor. Exports are records and files the author owns.

**The world is the author's, so the engine is too.** This is an author world, never QKI by default. Cheetara loads `author-world-authority`, the author approves the pack, and the pack's medium (photographic, painterly, drawn, 3D-real or mixed) decides how everything looks. QKI's rules, its Prime Gate among them, apply only if the author chooses a drawn medium and QKI.

## The legendary standard, for authors

Kevin, 2026-10-23: "Remember, they're authors and they are already leery of AI, so this has to be amazing. So amazing, it starts to remove the skepticism." From s2 on, every visual stage runs `legendary-standard`: each asset is a pack (thesis, a locked reference from the author's approved pack, a palette of neutrals plus one signal colour sampled from the author's world, a series, a type layer, staging, one motion beat, micro-detail, finishing, curation), with its prompts written per `prompt-architecture` and `midjourney-legendary` for the tools used. Kevin's srefs and profile never enter an author's world: the pack's own codes, or none. Every asset passes the Fidelity Gate, then the eight author-trust checks (`legendary-standard/references/author-trust.md`), then `quality-gate`, and ships only at 4 or above on every dimension. Pulse OS reaches it all through the DZNR OS API (`immersive-world-site/references/pulse-integration.md`).

| Stage | Owner | With | Skills |
|---|---|---|---|
| s2 Author world pack and style offer | Cheetara | Snape (palette tokens), Gandalf (gates the option stills) | author-world-authority, style-library, legendary-standard, quality-gate |
| s3 Character packs | Cheetara | Morpheus (dossier words), Gandalf (gate) | legendary-standard, author-world-authority, prompt-architecture, midjourney-legendary, quality-gate |
| s4 Location packs | Cheetara | Gibson (staging), Gandalf (gate) | legendary-standard, author-world-authority, prompt-architecture, midjourney-legendary, quality-gate |
| s5 Scene plans | Gibson | Morpheus (in-world copy), Cheetara (canon) | legendary-standard, prompt-architecture, experience-output-design, seedance-shotlist-director |
| s6 Scene packs | Cheetara | Gibson (motion beat), Gandalf (gate) | legendary-standard, author-world-authority, prompt-architecture, midjourney-legendary, wan-video-prompts, seedance-director, quality-gate |
| s8 The experience | Gibson | Neo (build), Morpheus (copy), Cheetara (plates and canon), Gandalf (gate) | immersive-world-site, legendary-standard, quality-gate, the threejs-* skills |

## Stages

### s0. Lore engine

Runs first, before anything is drafted, and again whenever a job brings new chapters, sessions or notes. Cheetara's `lore-engine` normalises the job's files (`inputs/<job-id>/`) into a corpus under the project's `lore/` folder without touching the originals, builds the graphify lore graph over it (`/graphify corpus --mode deep` the first time, `/graphify corpus --update --mode deep` after, so a new chapter re-extracts only itself), and writes `canon.json` and `world-bible.md` with every fact cited to its passage. Then the consistency check: one subject with conflicting values across sources, timeline contradictions, a world rule stated then broken, graphify's AMBIGUOUS links, two names that may be one person, and the gaps the art will need. Each becomes a numbered item in `questions.md`, and in `questions.json` for Pulse OS to show the author, with the passages, a proposed answer and the renders that wait. A later author correction beats an earlier session statement and is reported as resolved. The engine never answers a canon question; the author answers in Pulse OS, Pulse OS appends the ruling to `rulings.json`, and the engine mirrors it into `rulings.md`; rulings win over the text from then on. Exit allowed: the canon and its questions are useful on their own.

### s1. Ingest and World Bible

Pulse stage 1. Sherlock starts from the lore engine's `world-bible.md` and canon register (`canon.json`: every entry cites the passages it came from), adds the motifs and themes the canon does not hold, and puts the open questions to the author in Pulse OS (`questions.json`, with `questions.md`). The author corrects, redirects, answers what they can (each answer recorded in `rulings.md`), and **locks canon**. Nothing visual starts before the lock. Exit allowed: a locked Bible is a complete deliverable on its own and is the knowledge base's spine.

### s2. Author world pack from the Bible

Pulse stage 2 begins. Cheetara resolves the engine as an author world and drafts the author world pack through `author-world-authority`, reading the lore engine's `canon.json` and `rulings.md` (s0 runs again first if new inputs arrived since the Bible was locked): medium and realism from the creative brief and tonal references, era and place from the text, groups from the Bible's social structure, palette from its motifs and stated colours (with `brand-from-scratch` or `ds-theming` for extraction), camera, motion and sound from its tone, and the canon each subject renders from. Everything the text leaves open or contradicts is already a numbered canon question in `lore/questions.md`, with the passages and a proposed answer; the pack cites those numbers rather than asking again. **The style offer.** From the manuscript and the brief, Cheetara chooses two or three `style-library` entries that fit, and makes one option still in each: a place or an object from the canon (never a character), through the Fidelity Gate on the canon and `quality-gate` at SHIP, so the author chooses by seeing, never by reading a list. Beside them sits a quieter, text-led treatment (fewer effects, the author's prose first). The author's choice, or the `style`/`styles` ids Pulse OS sent on the job, is recorded in the pack; a style never overrides the pack's medium, palette or canon. Checkpoint: the author approves the pack, or corrects it first, in Pulse OS: the pack is written to `lore/world-pack.md` with its `pack_version` and awaits `lore/pack-approval.json` (approve, or revise with a note, which drafts the next version for approval again). Nothing renders before the approval. A photoreal or historical world stays with Cheetara under its own pack; QKI is used only if the author picks it.

### s3. Character nodes

Chain 8 NODE 3A per character, under the author world: each node record cites the Bible passages it portrays, the hero portrait takes the path the pack's medium names, and the gate is the **Fidelity Gate**: the pack's medium plus a canon check against those passages. A beautiful portrait with the wrong eye colour fails; a photographic portrait in a photographic pack never fails for looking real. Each character is a pack per `legendary-standard` (thesis from the character's passages, the lock from the author's pack, the palette's one signal, the turnaround and expression sheet as a one-variable series, a dossier type layer, staging, one beat, micro-detail from the canon, finishing, curation), its prompts per `prompt-architecture` and `midjourney-legendary`, then the trust checks and `quality-gate`. A character whose look has an open canon question is not rendered at all until the author rules. Identity lock (Higgsfield Soul Character plus Midjourney Edit Model references) is mandatory for any character that appears in more than one scene. Checkpoint per character: the author locks the identity.

### s4. Location nodes

Chain 8 NODE 3B per location: Layer 1 block first, establishing shot over it in the pack's medium, reference element lock. The location's geography entry in the Bible is updated from the block (distances, adjacency) so the knowledge base and the render agree. Each location is a pack per `legendary-standard`, gated like s3.

### s5. Scene compositions

Pulse stage 3. Gibson proposes, scene by scene, tied to specific passages: composition, atmosphere, lighting, sound cue, and which characters are present. Each proposal is the plan of the scene's pack (`legendary-standard`): its thesis from the passage, quoted on the composition; its staging and one motion beat; Morpheus's in-world copy and micro-detail from the canon. A character whose look is unsettled is shown unseen. `experience-output-design` governs any in-world text or narration. Where motion is wanted, `seedance-shotlist-director` produces the shot list. The author reviews each scene individually; this is the highest-frequency checkpoint in the workflow and it is deliberate. Voice mode reads each proposal in three sentences and waits.

### s6. Scene assets

Cheetara renders plates and motion clips against the approved compositions, in the pack's medium, with the Fidelity Gate on every frame (`wan-video-prompts` and `seedance-director` write the author-world briefs). Video tiers: Wan 3.0 via RunningHub for drafts, Seedance 2.5 via RunningHub for standard (this is how the shot lists execute; Seedance has no direct API), Higgsfield for hero and for anything with an identity-locked character. Ambient audio cues through ElevenLabs. Each scene's pack is completed per `legendary-standard`: plates from the locks, upscale before motion, one beat, one grade, curation, a plain provenance line per asset, then the Fidelity Gate, the trust checks and `quality-gate` (every failure mode a blocker on author work). `confidential_default` is true because a manuscript is unpublished intellectual property: every DZNR OS API job is confidential unless Pulse OS sends `"confidential": false`, and a confidential job uses no aggregator, so the RunningHub and Higgsfield-driver tiers run only when the author's consent is recorded and the job is sent non-confidential; Wan via Runway and Kling serve otherwise. Never real-person likenesses.

### s7. Knowledge base export

Neo maps everything to the Pulse core entities (Project, WorldBible, Character, Location, Scene, SceneComposition, Asset, Deployment) and exports records with passage citations. Supabase MCP writes directly when a Pulse project exists; otherwise a JSON bundle plus the manifest. Schema gate: nothing orphaned, every asset reachable from a scene, every scene reachable from the Bible.

### s8. Walkthrough and handoff

Gibson designs the experience per `immersive-world-site` (a world, not a page) and Neo builds it (R3F, the same immersive layer Pulse uses): districts or chapters from the canon, scroll as camera, in-world copy from the canon by Morpheus, every element with its passage, respect controls with a quieter text-led mode, a keepsake, and the performance budget. It opens on the author's name and one of their sentences over a plate at SHIP, never a menu. Gandalf gates it (Fidelity Gate, trust checks, `quality-gate` with F14). Then the author experiences the world before Pulse Studio's polish and deploy stages (Pulse stages 4 and 5) take over. Checkpoint: hand off.

## The author answers in Pulse OS

This workflow runs as Pulse OS jobs through the DZNR OS API, and the author is in Pulse OS, not DZNR OS. Everything that goes "to the author" goes there, never to Kevin in DZNR OS:

- **Canon questions** are written to `lore/questions.json` for Pulse OS to show the author; the author's answers come back as rulings in `lore/rulings.json`.
- **Pack approval** awaits `lore/pack-approval.json`.
- **Checkpoints** (s1, s2, s3, s5, s8) are answered by the author in Pulse OS through DZNR OS's checkpoint endpoint.
- **Each job ends** with its open questions and anything awaiting approval summarised in its final answer. No stage asks mid-run: DZNR OS refuses mid-run questions (its decision 241).

## Checkpoints

All answered by the author in Pulse OS, through DZNR OS's checkpoint endpoint.

- **s1** lock canon, and answer the open canon questions the author can (s0 has none of its own: it asks, the author answers here).
- **s2** approve the author world pack (medium, canon, open questions).
- **s3** lock each character identity.
- **s5** approve each scene.
- **s8** hand off.

More checkpoints than any other workflow except the IA. That is the product principle, not a DZNR habit.

## Deliverables

The lore folder (corpus, lore graph, `canon.json`, `world-bible.md`, `questions.md`, `rulings.md`); World Bible (markdown, the knowledge base spine); per character and location the hero image (dual with mesh where a location or object needs Layer 1 geometry in the experience), sheets, and identity locks; per scene the composition record and assets (plates, clips, audio cues); the manifest with passage citations; the entity export; the walkthrough build.

## What this is not

- Not Pulse Studio itself. This workflow produces artifacts and a reference implementation; Pulse's own orchestrator, domain agents, polish, deploy, and analytics are product code (Next.js, Supabase, Vercel AI SDK) built through the SaaS application workflow when that one is complete.
- Not a QKI world for its own sake (previous workflow). Here the manuscript and Bible come first and QKI is one visual identity the author may choose.
- Not a chat-with-characters product. "Character.AI lets you play in stories. MavenSix builds stories worth playing in."
- Not autonomous. No stage auto-proceeds past a checkpoint on silence.

## Grounding notes

Source: the Pulse OS product description Kevin wrote on 2026-09-04 (five-stage pipeline, three principles, architecture, core entities, stack, phase status, design language), plus the QKI world workflow for the render mechanics. Phase 1 of Pulse (the signal layer) is in production; Phase 2 (the agentic creator layer this workflow mirrors) is beginning. No DZNR-produced Pulse artifact has shipped yet, so the stage mapping is DZNR's proposal for how its subagents cover Pulse's five stages: Sherlock for Ingest, Cheetara for World build, Gibson for Scene compose, Neo for the entity export, and Gibson again for the walkthrough that precedes Polish and Deploy.

Items to verify against the Pulse codebase when this runs for real: the exact field shape of each core entity for s7; whether Pulse's orchestrator expects the World Bible in a specific format; whether the Pulse design language (cinematic dark, Syne, JetBrains Mono, #0A0A14, the five accents) applies to the walkthrough in s8 or only to Pulse Studio's interface. Observability from the first commit is a Pulse rule; s7's schema gate exists partly so silent failure (the recurring Pulse defect class) cannot hide an orphaned asset.

## Changelog

- 1.4 (2026-10-23, DZNR 2.22.0): the legendary standard, for authors (Kevin, 2026-10-23: "they're authors and they are already leery of AI, so this has to be amazing"). s2 offers two or three `style-library` entries as options with an option still each, and a quieter treatment, and records the author's choice (or Pulse's style ids) in the pack. s3, s4, s5 and s6 make packs per `legendary-standard` with prompts per `prompt-architecture` and `midjourney-legendary`; every asset passes the Fidelity Gate, the eight author-trust checks, then `quality-gate` at 4 or above. s8 builds the experience per `immersive-world-site`. Owners and skills named per stage; confidentiality stated as DZNR OS guarantees it.

- 1.0 (2026-09-04): created from the Pulse OS product description and the QKI world workflow.
- 1.3 (2026-10-23, DZNR 2.19.0): the author answers in Pulse OS (Kevin, 2026-10-23). Canon questions go to `lore/questions.json`, rulings come back in `lore/rulings.json`, the pack awaits `lore/pack-approval.json` by `pack_version`, and every checkpoint prompt says the author answers in Pulse OS through DZNR OS's checkpoint endpoint. Jobs end with the questions summarised and never ask mid-run.
- 1.2 (2026-10-21, DZNR 2.18.0): s0 added. Cheetara's `lore-engine` runs before the World Bible and before `author-world-authority` drafts a pack: corpus, graphify lore graph, cited canon, the consistency check and numbered canon questions, with the author's rulings winning over the text. s1 starts from its outputs.
- 1.1 (2026-10-21, DZNR 2.17.0): an author's world is an author world, never QKI by default (Kevin, 2026-10-21). s2 drafts an author world pack through `author-world-authority` and the author approves it; s3, s4 and s6 gate on the Fidelity Gate (medium and canon), with the Prime Gate only for a pack that opts into QKI; the photoreal hand-off to Gibson is gone, since Cheetara renders any medium under the author's pack.
