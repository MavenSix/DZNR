---
workflow: landing-page-marketing-site
name: Landing Page and Marketing Site
status: complete
version: 1.0
lead: snape
supporting: [neo, snake-eyes, morpheus, gandalf, sherlock, tar]
chains: [2, 4, 5]
grounded_in:
  - path: ~/DZNR/routing/CHAINS.md (Chain 2 NODE 4, Chain 4, Chain 5)
    date: 2026-05-18
  - path: ~/Documents/DZNR EXPERIMENTS/DZNR_OS_BUILD_PLAN.md (Aura pattern, design principle 6)
    date: 2026-09-03
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-formulary-prototype/index.html (single-file vanilla build discipline)
    date: 2026-06-12
industry_posture_sensitive: true
confidential_default: false
triggers:
  typed: ["landing page for", "marketing site for", "hero page for", "one-pager for", "launch page", "campaign site"]
  spoken: ["Hey DZNR, build a landing page for [product]", "Hey DZNR, make a launch page for [thing]", "Hey DZNR, one-pager for [brand]"]
inputs_required:
  - id: brand_tokens
    source: memory
    on_missing: route:snape:brand-from-scratch
  - id: audience
    source: memory
    on_missing: ask
  - id: the_one_action
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Brief and structure
    owner: snape
    chain_node: "Chain 2 NODE 1"
    skills: [idea-to-brief, wireframe, presentation-storytelling]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [page brief, section outline, the one action, low-fi wireframe]
    checkpoint: true
    checkpoint_prompt: "Seven sections, one action: [action]. Approve the structure?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Ideation with dual export
    owner: snape
    chain_node: null
    skills: [frontend-aesthetics, aesthetic-system, theme-factory]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [aura-web, figma-mcp, magic-patterns-mcp]
    produces: [two or three directions as HTML plus Figma, style pack chosen]
    checkpoint: true
    checkpoint_prompt: "Three directions in Figma and HTML. Which one, or blend?"
    gate: null
    exit_allowed: false
  - id: s3
    name: Copy
    owner: morpheus
    chain_node: null
    skills: [marketing:draft-content, ux-copy, brand-voice:brand-voice-enforcement]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [headline options, section copy, CTA variants, in the brand voice rule]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Imagery
    owner: snake-eyes
    chain_node: null
    skills: [adobe-create-social-variations, adobe-resize-photos-and-videos]
    models:
      draft: runninghub:flux-2-klein
      standard: google:nano-banana-pro
      hero: runninghub:midjourney-v7
    tools: [adobe-mcp, runninghub, playwright-mcp]
    produces: [hero and section imagery, MANIFEST.md]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Manifest gate: rights class per asset"
    exit_allowed: false
  - id: s5
    name: Build
    owner: neo
    chain_node: "Chain 2 NODE 4 or Chain 4"
    skills: [web-artifacts-builder, repo-scaffold, web-animation, webgl-threejs]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code, vercel-mcp, netlify-mcp]
    produces: [static site or platform components, responsive at three breakpoints]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Fidelity gate: matches the chosen Figma direction at desktop, tablet, mobile"
    exit_allowed: false
  - id: s6
    name: SEO and schema
    owner: snake-eyes
    chain_node: "Chain 5 NODE 2"
    skills: [searchfit-seo:on-page-seo, searchfit-seo:schema-markup, searchfit-seo:technical-seo]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:sonnet
    tools: []
    produces: [title and meta, JSON-LD, technical checklist]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s7
    name: Harden and polish
    owner: gandalf
    chain_node: "Chain 2 NODE 4 (Gandalf call point)"
    skills: [harden, polish, fixing-accessibility, fixing-motion-performance]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: [claude-code]
    produces: [accessibility pass, motion performance pass, Lighthouse check]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s8
    name: Deploy
    owner: neo
    chain_node: "Chain 4"
    skills: []
    models: null
    tools: [vercel-mcp, netlify-mcp]
    produces: [live URL, analytics wired]
    checkpoint: true
    checkpoint_prompt: "Live at [url]. Run it past the synthetic audience, ship the campaign, or done?"
    gate: null
    exit_allowed: true
  - id: s9
    name: Audience test
    owner: sherlock
    chain_node: null
    skills: [synthetic-audience]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [panel reactions, copy and hierarchy notes]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: code
    dual_with: figma
  - type: figma
    dual_with: code
  - type: manifest
    dual_with: null
cost_envelope_usd: [5, 60]
time_envelope: "Half a day to two days depending on imagery and platform"
exit_criteria:
  - "One primary action, stated in the brief and present above the fold"
  - "Chosen direction exists in both Figma and HTML"
  - "Copy passes the brand voice rule"
  - "Every image in the manifest with a rights class"
  - "JSON-LD present; Lighthouse accessibility 95 or above"
  - "Live URL"
memory_writes:
  - "project.page_brief and the_one_action"
  - "project.chosen_direction (Figma frame id)"
  - "project.deploy_url"
  - "brand.style_pack_used"
open_questions: []
---

# Landing Page and Marketing Site

## Purpose

The fast path from a brand and an offer to a live page. Snape sets the structure and direction, Morpheus writes the copy, Snake Eyes makes the imagery, Neo builds and deploys, Gandalf hardens, Snake Eyes closes with SEO. The Aura pattern governs ideation: every direction exists as HTML *and* Figma from the first pass, so nothing is trapped.

## Stages

### s1. Brief and structure

`idea-to-brief` for the four lenses (who, what problem, constraints, how we know it worked), then `wireframe` at low fidelity. The brief names **the one action** the page exists for. Checkpoint on structure.

### s2. Ideation with dual export

Two or three directions. Aura for AI landing-page ideation when available (it ships HTML plus Figma natively); otherwise Snape drives `frontend-aesthetics` and `aesthetic-system` and pushes each direction to Figma via MCP. Style packs (`theme-factory` presets, or the brand's own pack from the design-system workflow) are the starting move; "pick a preset, then tune." Checkpoint picks a direction.

### s3. Copy

Morpheus, against the brand voice rule in memory. Headline options, section copy, CTA variants. `brand-voice:brand-voice-enforcement` when guidelines exist.

### s4. Imagery

Snake Eyes. Brand photography harvested with rights class recorded; generated imagery on the tiers in the frontmatter (RunningHub for draft and Midjourney-via-API for hero when `confidential_default` is false, which it is here; flip it for NDA clients).

### s5. Build

Neo. Static site (`web-artifacts-builder`, single file where it fits, otherwise `repo-scaffold` with Vite) or platform components via Chain 4 when the page lives inside Sitecore, Salesforce, or AEM. The Aesop prototype's discipline applies to static builds: zero dependencies where possible, `lang` set to the brand's orthography, reduced-motion kill switch. Fidelity gate against the chosen Figma direction at three breakpoints.

### s6. SEO and schema

Chain 5 soft-route to Snake Eyes. Title, meta, JSON-LD, technical checklist. No clarification needed; this is specialist work.

### s7. Harden and polish

Gandalf's four. Lighthouse accessibility at 95 or above before deploy.

### s8. Deploy

Vercel or Netlify via MCP. Analytics wired. Checkpoint: audience test, campaign, or done.

### s9. Audience test

Optional `synthetic-audience` pass with the persona in memory.

## Checkpoints

- **s1** structure and the one action.
- **s2** direction.
- **s8** after deploy.

## Deliverables

Live site (dual with the Figma direction it was built from) and the image manifest.

## What this is not

- Not a full brand system (previous workflow; this one consumes its tokens).
- Not a multi-page marketing site with a CMS (Chain 4 delivery with Neo leading, and a content workflow).
- Not an SEO engagement (Chain 5 standalone).
- Not a pitch (the pitch workflow; a web pitch is a deck, not a landing page).

## Grounding notes

No single past project ran this workflow end to end. It is grounded in Chain 2 NODE 4 and Chain 4 (build and platform branching), Chain 5 (SEO leg), the Aura dual-export pattern documented in the Build Plan, and the Aesop prototype's static-build discipline. When the first real landing page ships through DZNR, revise from it.

## Changelog

- 1.0 (2026-09-04): created from Chains 2, 4, 5 and the Aura pattern.
