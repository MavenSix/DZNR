---
workflow: brand-design-system
name: Brand System and Design System
status: complete
version: 1.0
lead: snape
supporting: [sherlock, gandalf, neo, morpheus, tar]
chains: [1, 2]
grounded_in:
  - path: ~/DZNR/routing/CHAINS.md (Chain 2)
    date: 2026-05-18
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-audit.md (section 3, brand voice profile)
    date: 2026-06-12
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-pitch/index.html (CSS derived from audit section 3)
    date: 2026-06-13
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["brand system for", "design system for", "tokens for", "brand from scratch", "theme [design system] for", "component library for", "design language for"]
  spoken: ["Hey DZNR, build a brand system for [brand]", "Hey DZNR, turn this moodboard into a design system", "Hey DZNR, theme shadcn for [brand]"]
inputs_required:
  - id: brand_input
    source: inline
    on_missing: ask
  - id: industry_posture
    source: memory
    on_missing: route:sherlock:site-audit
stages:
  - id: s1
    name: Read the input
    owner: snape
    chain_node: "Chain 2 NODE 1"
    skills: [brand-from-scratch, design-language, design-systems]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [figma-mcp]
    produces: [input classification: nothing, vibe, existing brand, existing system, Figma file]
    checkpoint: true
    checkpoint_prompt: "What do you have to work with: a vibe, an existing brand, a Figma file, or nothing yet?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Voice and design language
    owner: snape
    chain_node: "Chain 2 NODE 2"
    skills: [brand-from-scratch, design-language, aesthetic-system, brand-voice:guideline-generation]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [figma-mcp, mobbin-mcp]
    produces: [brand voice profile with evidence, design language doc, aesthetic direction]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Taste pass
    owner: gandalf
    chain_node: "Chain 2 NODE 2 (Gandalf call point, almost always)"
    skills: [design-taste-frontend, gpt-taste, stitch-design-taste, polish]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [refined direction, aesthetic recipe]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Tokens
    owner: snape
    chain_node: "Chain 2 NODE 2"
    skills: [ds-theming, design-systems]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [figma-mcp, claude-code]
    produces: [W3C token JSON, CSS variables, Tailwind config, Figma variables in one pass]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Dual-artifact gate: Figma variables and code tokens both exist and match"
    exit_allowed: false
  - id: s5
    name: Components
    owner: snape
    chain_node: "Chain 2 NODE 2"
    skills: [figma-generate-library, design-systems, ds-documentation]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [figma-mcp]
    produces: [Figma component library with variants and variable bindings, component docs]
    checkpoint: true
    checkpoint_prompt: "Brand is defined: voice, language, tokens, [n] components in Figma. Ship components in code, or is the system the deliverable?"
    gate: null
    exit_allowed: true
  - id: s6
    name: Components in code
    owner: neo
    chain_node: "Chain 2 NODE 4"
    skills: [xcm-component-gen, aem, repo-scaffold, web-artifacts-builder, figma-design-to-code]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code, figma-mcp]
    produces: [component code per platform, Code Connect mappings]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s7
    name: Harden and document
    owner: gandalf
    chain_node: "Chain 2 NODE 4 (Gandalf call point)"
    skills: [harden, polish, fixing-accessibility, ds-documentation]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [claude-code]
    produces: [accessibility pass, documentation site]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s8
    name: Launch packaging
    owner: morpheus
    chain_node: "Chain 2 NODE 6"
    skills: [stakeholder-update, pitch, campaign-plan]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [internal update, client pitch, or public campaign]
    checkpoint: true
    checkpoint_prompt: "Who is this launch for: internal team, client, or public?"
    gate: null
    exit_allowed: true
deliverables:
  - type: figma
    dual_with: code
  - type: code
    dual_with: figma
  - type: markdown
    dual_with: null
cost_envelope_usd: [10, 80]
time_envelope: "Foundation half a day; tokens and Figma library one to two days; code components per platform one to three days"
exit_criteria:
  - "Brand voice profile with quoted evidence and a one-line voice rule"
  - "Tokens exist as W3C JSON, CSS variables, Tailwind config, and Figma variables, and they match"
  - "Figma library has variants bound to variables"
  - "If code shipped: Code Connect mappings exist and the accessibility pass ran"
memory_writes:
  - "brand.voice_rule"
  - "brand.tokens_path (JSON) and figma_file_key"
  - "brand.aesthetic_recipe (from the taste pass)"
  - "brand.component_inventory"
open_questions: []
---

# Brand System and Design System

## Purpose

From nothing, a vibe, an existing brand, or a Figma file, to a brand voice, a design language, tokens, and a component library that ships in both Figma and code. Snape leads; Gandalf's taste pass is almost always called; Neo ships the code. Chain 2 is the spine. The Aesop voice extraction is the reference for what a brand voice profile with evidence looks like, and the Aesop pitch CSS is the reference for tokens derived from that profile rather than from the brand's site.

## Stages

### s1. Read the input

Chain 2 NODE 1 branches on what exists. Nothing or a vibe: `brand-from-scratch` in personality-synthesis mode. Existing brand assets: `brand-from-scratch` in logo-reading, visual-signal, or document-mining mode. Existing system: `design-systems` audit plus `design-language` capture. Figma file: the `figma-*` skills. Snape asks the checkpoint question when ambiguous.

### s2. Voice and design language

The brand voice profile follows the Aesop audit's section 3 shape: register (Aesop had three interleaved voices), sentence rhythm, vocabulary lexicon, what the voice never does, and a one-line voice rule for downstream generation. The design language doc covers spacing rhythm, hierarchy, and pattern vocabulary. Industry posture from `routing/INDUSTRIES.md` sets defaults: luxury reads restraint and materiality; fintech reads trust and clarity.

### s3. Taste pass

Gandalf, almost always. `design-taste-frontend`, `gpt-taste` or `stitch-design-taste`, `polish`. Output is an aesthetic recipe Snape carries into tokens.

### s4. Tokens

One pass produces W3C token JSON, CSS variables, a Tailwind config, and Figma variables, and they must match. This is the dual-artifact gate: a token set that exists in only one of the two worlds is not done. `ds-theming` handles the target framework (shadcn, MUI, Radix, custom).

### s5. Components

`figma-generate-library` builds the Figma library with proper variant sets and variable bindings; `ds-documentation` writes the component docs. Checkpoint: is the system the deliverable, or do components ship in code.

### s6. Components in code

Neo, Chain 2 NODE 4. Platform branch: Sitecore XM Cloud (`xcm-spec-generator` plus `xcm-component-gen`), Salesforce LWC, AEM, or generic React (`repo-scaffold` plus `web-artifacts-builder`). `figma-code-connect` maps each Figma component to its code twin.

### s7. Harden and document

Gandalf: `harden`, `polish`, `fixing-accessibility`. `ds-documentation` renders the docs site.

### s8. Launch packaging

Morpheus. Internal update, client pitch, or public campaign, per the checkpoint.

## Checkpoints

- **s1** what exists.
- **s5** system or code.
- **s8** launch audience.

## Deliverables

Figma library and code components as a dual pair; voice and language docs; tokens in four formats; component documentation.

## What this is not

- Not a style sheet for creative work (that stub covers style *types* for generative and illustration work; this is product and interface).
- Not a QKI pack.
- Not a landing page (next workflow; it consumes this one's tokens).
- Not a brand voice guideline alone (`brand-voice:guideline-generation` can be called from s2 but the workflow continues).

## Grounding notes

No single past project ran Chain 2 end to end, so this workflow is grounded in the chain itself plus the two Aesop artifacts that demonstrate its first two stages (voice extraction, and tokens derived from voice). The dual-artifact gate at s4 comes from Build Plan principle 6 and the Aura pattern (HTML plus Figma, neither trapped). When a real Chain 2 engagement ships, revise this file from it.

## Changelog

- 1.0 (2026-09-04): created from Chain 2 and the Aesop voice and pitch artifacts.
