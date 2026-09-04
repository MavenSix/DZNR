---
workflow: ai-product-concept-prototype
name: AI Product Concept and Prototype
status: complete
version: 1.0
lead: gibson
supporting: [sherlock, snape, snake-eyes, gandalf, tar]
chains: [1, 3]
grounded_in:
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-ai-consultation-concept.md
    date: 2026-06-12
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-formulary-prototype/
    date: 2026-06-12
  - path: ~/DZNR/routing/CHAINS.md (Chain 3, Prototype Prerequisites Rule)
    date: 2026-05-18
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["AI product concept for", "design an AI feature for", "AI-augmented [service]", "not a chatbot", "concept and prototype for", "what would an AI layer look like for"]
  spoken: ["Hey DZNR, concept an AI product for [brand]", "Hey DZNR, prototype the [concept name]", "Hey DZNR, what would AI do for [brand]'s [service]"]
inputs_required:
  - id: audit_or_brief
    source: memory
    on_missing: route:sherlock:site-audit
  - id: persona
    source: memory
    on_missing: route:sherlock:synthetic-audience
  - id: journey
    source: memory
    on_missing: route:gibson:journey-mapping
  - id: mandate
    source: inline
    on_missing: ask
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
    gate: "Prerequisites gate: persona and journey both exist in memory"
    exit_allowed: false
  - id: s1
    name: Organizing idea
    owner: gibson
    chain_node: "Chain 3 NODE 1"
    skills: [ai-product-architecture, experience-output-design, idea-to-brief]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [concept thesis, mode declaration (A, B, or AB)]
    checkpoint: true
    checkpoint_prompt: "The organizing idea is [one sentence]. Build the full concept on it, or try another angle?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Experience architecture
    owner: gibson
    chain_node: "Chain 3 NODE 2"
    skills: [immersive-experience-design, experience-output-design, journey-mapping]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [surfaces, entry points, interaction-by-interaction walkthrough, cadence rules, felt-experience paragraph]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: AI architecture
    owner: gibson
    chain_node: "Chain 3 NODE 2"
    skills: [ai-product-architecture, ai-product-prompting, thoughtful-ai-output]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [layer model, generated vs deterministic vs curated table, memory design, disclosure copy, voice enforcement stack, escalation and refusal]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Four-lens ethics check
    owner: gibson
    chain_node: "Chain 3 NODE 2 (mandatory)"
    skills: [thoughtful-ai-output, ai-product-prompting]
    models:
      draft: claude:opus
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [Empathy, Strategic Judgment, Guardianship, Verification sections; verdict; standing obligations]
    checkpoint: true
    checkpoint_prompt: "Four-lens check complete. Verdict: [verdict]. Standing obligations: [n]. Accept them as constraints and continue to feasibility?"
    gate: "Ethics gate: verdict must be pass or pass-with-obligations"
    exit_allowed: false
  - id: s5
    name: Feasibility and phase ladder
    owner: gibson
    chain_node: "Chain 3 NODE 3"
    skills: [ai-product-architecture, product-playbook]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [integration seams, phase ladder with rollback target, pilot strategy, honest risks, what-this-is-not list]
    checkpoint: true
    checkpoint_prompt: "Concept is complete and stops at the feasibility notes. Build the working prototype, hand to Neo for production, or ship the concept as the deliverable?"
    gate: null
    exit_allowed: true
  - id: s6
    name: Asset kit
    owner: snake-eyes
    chain_node: null
    skills: [adobe-batch-edit-photos]
    models:
      draft: runninghub:nano-banana
      standard: google:nano-banana-pro
      hero: runninghub:midjourney-v7
    tools: [playwright-mcp, pillow, runninghub]
    produces: [product assets captured from source, generated ambient assets, MANIFEST.md]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Manifest gate: every asset has source, method, dimensions, rights class, and placement; Tár verifies"
    exit_allowed: false
  - id: s7
    name: Working prototype
    owner: gibson
    chain_node: "Chain 3 NODE 3"
    skills: [web-artifacts-builder, frontend-aesthetics, web-animation]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code]
    produces: [self-contained index.html, demo affordances, export and destroy flows]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s8
    name: Polish and accessibility
    owner: gandalf
    chain_node: "Chain 3 NODE 4 (Gandalf call point)"
    skills: [polish, fixing-accessibility, harden]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [claude-code]
    produces: [skip link, ARIA tabs, live region, dialog focus return, reduced-motion kill switch]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s9
    name: Route to launch or handoff
    owner: tar
    chain_node: "Chain 3 NODE 5"
    skills: []
    models: null
    tools: []
    produces: [handoff decision]
    checkpoint: true
    checkpoint_prompt: "Prototype is live at [path]. Package a pitch with Morpheus, hand to Neo for production, or stop here?"
    gate: null
    exit_allowed: true
deliverables:
  - type: markdown
    dual_with: html
  - type: html
    dual_with: markdown
  - type: manifest
    dual_with: null
cost_envelope_usd: [10, 60]
time_envelope: "Concept 30 to 90 minutes; prototype 60 to 180 minutes; the Aesop concept and prototype together landed in about 70 minutes of wall clock"
exit_criteria:
  - "Concept doc has header with Mode (A, B, or AB), evidence base cited by section, and industry posture rider"
  - "Four-lens check embedded with a verdict and standing obligations written as constraints"
  - "Phase ladder where phase one has no AI and is the rollback target"
  - "Prototype is a single self-contained HTML file with zero dependencies, lang set to the brand's orthography, and every data line carrying provenance"
  - "Asset MANIFEST.md verified by Tár"
memory_writes:
  - "project.concept_thesis (one sentence)"
  - "project.standing_obligations (from the four-lens verdict)"
  - "project.phase_ladder"
  - "project.prototype_path and project.asset_manifest_path"
  - "persona and journey records if produced in s0"
open_questions: []
---

# AI Product Concept and Prototype

## Purpose

Take a brand's real constraints and design the AI layer that belongs there, then prove it with a working prototype the client can click. The Aesop Formulary is the reference: an AI that "does not converse; it keeps the book," a deterministic core with a thin generative skin, a four-lens ethics check embedded in the spec, and a prototype that renders the system's entire memory on screen. This workflow exists so the next one holds to that bar.

## Stages

### s0. Prototype prerequisites

Chain 3 NODE 0. Persona and journey must exist in project memory before anything else. On Aesop they did not exist as separate artifacts; the concept produced them inline (the persona appears inside the Empathy lens; the journey is the "how a member encounters it" section). The workflow now makes them a named stage, because the rule was added to DZNR after that project and because "prototypes that ship without persona and journey context tend to solve the wrong problem beautifully." If the audit already carries them, s0 is a read, not a write.

### s1. Organizing idea

One sentence that the whole concept hangs on. Gibson declares the mode: **A** experience-driven, **B** AI-architecture-driven, **AB** joint, and tags every later decision with which mode produced it. The Aesop thesis was "the AI does not converse; it keeps the book." This is the first checkpoint because a wrong thesis wastes everything after it.

### s2. Experience architecture

The surfaces (Aesop had five), the doors in (three), the interaction-by-interaction walkthrough, the cadence rules ("four notes a year, at most"), the connection table to every existing surface, and the **felt-experience paragraph** used as the acceptance test: "If any implementation decision makes the felt experience diverge from that paragraph, the implementation is wrong."

### s3. AI architecture

Mode B work. Where the model sits (deterministic core, generative composition desk, human consultants); the generated / deterministic / curated table; context and memory design (Aesop chose an event-sourced append-only log and no vector store); honesty copy ("Composed by the clerk, an attentive instrument, not a consultant"); the voice-fidelity enforcement stack ordered cheapest gate first; escalation and refusal rules. Rules that carried: "No model ever chooses a product." "Safety language is quoted, not generated." "Replies arrive whole. Never streamed token-by-token."

### s4. Four-lens ethics check

Mandatory (Gibson's AGENT.md). Empathy, Strategic Judgment, Guardianship, Verification, each with its fixed sub-prompts, ending in a verdict and standing obligations "written into the spec as constraints, not recommendations." The gate: a fail verdict loops to s2 or s3, never forward. The checkpoint reads the obligations aloud in voice mode because they become law for the build.

### s5. Feasibility and phase ladder

Integration seams (Aesop: three, all thin, into SFCC); a phase ladder where **phase one contains no AI** and is the rollback target; pilot strategy (one market, one season); honest risks; a "what this is not" list. The concept stops here by design ("This stops here. No Neo phase is scoped."). Checkpoint: prototype, production, or ship the concept.

### s6. Asset kit

Snake Eyes harvests authentic product imagery from the brand's own image service (Playwright same-origin fetch; direct curl is usually blocked) and generates ambient plates. Aesop used Runway-hosted nano-banana-pro with a Pillow warm-tone pass, all recorded in the manifest with prompt summaries. Under this workflow's `confidential_default: true`, generation runs on direct accounts; RunningHub is available only when the flag is cleared. Manifest gate before Tár verifies.

### s7. Working prototype

One self-contained `index.html`, vanilla, zero dependencies, opened directly in a browser. `lang` set to the brand's orthography (`en-GB` for Aesop). Concept copy lifted verbatim into the UI. Every data entry carries a provenance line ("Computed against your city, and against nothing else; never inferred."). Demo affordances are explicit and labelled "prototype only." The system's memory is rendered on screen ("Glass memory: everything rendered below IS the system's memory"). The one real confirmation gate in the UI is destruction, with the safe option focused by default.

### s8. Polish and accessibility

Gandalf's `polish`, `fixing-accessibility`, and `harden`. Skip link, ARIA tab pattern with keyboard, visually hidden live region, dialog focus return, reduced-motion kill switch. The Aesop prototype had all of these; whether Gandalf was invoked is not recorded, so the workflow names the stage.

### s9. Route to launch or handoff

Tár's checkpoint. The usual next step is the pitch workflow (Morpheus), which links to this prototype by relative path.

## Checkpoints

- **s1** thesis: continue or re-angle.
- **s4** obligations: accept as constraints.
- **s5** scope: prototype, production, or concept-only.
- **s9** next: pitch, production, or stop.

Four checkpoints, all substantive. Everything else runs quiet.

## Deliverables

Concept markdown and prototype HTML as a dual pair, plus the asset MANIFEST.md they share. The prototype is later linked from the pitch deck; keep the folder structure stable (`<project>-prototype/index.html`, `<project>-prototype/assets/`).

## What this is not

- Not a chatbot. If the mandate is "add a chat window," Gibson pushes back with the anti-chatbot interaction patterns first.
- Not production code. Neo is not in this workflow; the concept explicitly stops before him.
- Not a generic AI feature spec (`product-management:write-spec` for that).
- Not an experience build without AI (the brand activation workflow).

## Grounding notes

Source: Aesop AI consultation concept (267 lines, Mode AB, 2026-06-12 11:31) and the Formulary prototype (1,730-line index.html plus 8-asset manifest, complete 12:34 the same day). The concept was written five minutes after the audit landed; the prototype about an hour later.

Deliberate differences from the real run: s0 prerequisites are a named stage (they were embedded); s6 asset generation defaults to direct accounts under the confidential flag (Aesop's ambient plates were generated on a Runway-hosted model, which was fine for a concept demo but the workflow now asks); s8 Gandalf pass is named. Everything else matches the artifact, including the rule that the concept ends at feasibility.

## Changelog

- 1.0 (2026-09-04): created from the Aesop Formulary concept and prototype, Chain 3, and the Prototype Prerequisites Rule.
