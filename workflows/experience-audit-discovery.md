---
workflow: experience-audit-discovery
name: Experience Audit and Discovery
status: complete
version: 1.0
lead: sherlock
supporting: [tar, snape, gandalf, morpheus]
chains: [1]
grounded_in:
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-audit.md
    date: 2026-06-12
  - path: ~/DZNR/routing/CHAINS.md (Chain 1)
    date: 2026-05-18
industry_posture_sensitive: true
confidential_default: false
triggers:
  typed: ["audit [brand or URL]", "site audit for", "discovery for", "what's wrong with [site]", "review [brand]'s experience", "brand voice extraction for"]
  spoken: ["Hey DZNR, audit aesop dot com", "Hey DZNR, run discovery on [brand]", "Hey DZNR, what would you change about [brand]'s site"]
inputs_required:
  - id: target
    source: inline
    on_missing: ask
  - id: downstream_purpose
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Frame the audit
    owner: sherlock
    chain_node: "Chain 1 NODE 1"
    skills: [site-audit, brand-from-scratch]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: []
    produces: [audit header, methodology note, industry posture with confidence]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s2
    name: Primary evidence capture
    owner: sherlock
    chain_node: "Chain 1 NODE 1"
    skills: [site-audit]
    models: null
    tools: [playwright-mcp or claude-in-chrome, web-fetch, web-search]
    produces: [browser session snapshots, verbatim quotes, structured page fields]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Evidence gate: every claim tagged primary, secondary, or deduction"
    exit_allowed: false
  - id: s3
    name: Write the audit
    owner: sherlock
    chain_node: "Chain 1 NODE 1"
    skills: [site-audit, hcd-heuristics, ux-taxonomy]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [audit markdown]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Distill and sharpen
    owner: gandalf
    chain_node: "Chain 1 NODE 1 (Gandalf call point)"
    skills: [distill, extract, clarify]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: []
    produces: [executive observations, opportunity map]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Route downstream
    owner: tar
    chain_node: "Chain 1 NODE 2"
    skills: []
    models: null
    tools: []
    produces: [handoff decision]
    checkpoint: true
    checkpoint_prompt: "Audit is done. Next: brand build with Snape, experience build with Gibson, delivery with Neo, a deck with Morpheus, or stop here?"
    gate: null
    exit_allowed: true
deliverables:
  - type: markdown
    dual_with: null
cost_envelope_usd: [2, 15]
time_envelope: "60 to 120 minutes of wall clock; the Aesop audit was written while its browser session was still running"
exit_criteria:
  - "Header carries Prepared by, Date, Subject, For, and Industry posture with confidence"
  - "Every claim is marked primary, secondary, or deduction"
  - "Executive observations (3 to 6), a constraints section, and an opportunity map for the named downstream subagent"
  - "Brand voice profile with quoted evidence if the downstream work will generate copy"
memory_writes:
  - "project.industry_primary and industry_secondary with confidence"
  - "project.brand_voice_rule (the one-line voice spec for downstream generation)"
  - "project.constraints (numbered)"
  - "project.opportunity_map (gaps with attachment points)"
open_questions: []
---

# Experience Audit and Discovery

## Purpose

A client, a prospect, or Kevin himself has a brand or product and no clear direction yet. Sherlock reads the world: the live experience, the brand's own voice, the constraints it operates under, and the gaps a later build could fill. The output is one audit document written explicitly *for* the next subagent, so the handoff needs no clarification. This is Chain 1 with the Aesop discipline layered on: methodology stated, evidence graded, voice extracted, and an opportunity map addressed to a named reader.

## Stages

### s1. Frame the audit

Sherlock writes the header first: Prepared by, Date, Subject, **For** (the downstream subagent and their mandate, e.g. "Gibson, Phase 2 AI-augmented consultation surface, explicitly not a chatbot"), and Industry posture with a confidence rating. The `For:` line is the routing decision made in advance; on Aesop it let Chain 1 NODE 2 resolve without a Snape clarification. Sherlock also writes the methodology note up front: what was fetched directly, what needed a live browser, what came from secondary sources, and the rule that quotes are verbatim unless noted.

### s2. Primary evidence capture

A live browser session (Playwright MCP or Claude in Chrome) against the real site. Direct fetches often fail on brand sites behind Akamai or similar; Aesop returned 403. Sherlock captures navigation verbatim, structured PDP fields, personalisation surfaces as a table (surface, mechanics, state), account infrastructure, and content taxonomy with counts. Secondary sources via web search are marked as secondary. Nothing that is a guess is presented as observed. The evidence gate: no claim leaves this stage without a primary, secondary, or deduction tag.

### s3. Write the audit

Sections in the order the Aesop audit used, because it read well and handed off cleanly: executive observations (3 to 6, each one a finding not a summary); digital experience baseline (platform, IA, key journeys, personalisation, member infrastructure, content); brand voice profile with quoted evidence (register, sentence rhythm, vocabulary, what the voice never does, and a one-line voice rule for downstream generation); how the core ritual works today, in store and digital, and what the digital version loses; constraints (numbered, including ownership, privacy posture, regional fragmentation); opportunity map addressed to the `For:` reader; sources footer split primary and secondary.

Industry posture shapes the constraints section, not the styling. Luxury CPG produced "discounts, urgency, and gamification disqualified on arrival"; fintech would produce compliance and trust constraints; retail would produce conversion and merchandising constraints. `routing/INDUSTRIES.md` holds the posture profiles.

### s4. Distill and sharpen

Sherlock calls Gandalf as a tool for `distill` on the executive observations and `extract` on the opportunity map. This is the Chain 1 Gandalf call point. On Aesop it is not recorded in the artifact, which is why the workflow makes it explicit: the observations are the part of the audit the client reads twice.

### s5. Route downstream

Tár reads the `For:` line. If it names a subagent, that chain starts. If not, Snape asks the checkpoint question. If the audit *is* the deliverable (a prospect wants the read, not the build), the workflow ends here and Morpheus optionally packages it as a short deck or one-page brief.

## Checkpoints

- **s5** is the only checkpoint. Everything before it runs quiet. Voice mode speaks once at the end: "Audit's done. Six observations, seven constraints, opportunity map addressed to Gibson. Continue into the experience build?"

## Deliverables

One markdown audit. Single artifact. It becomes the evidence base every later document cites by section number, so section numbering is stable once written.

## What this is not

- Not a competitive brief (Sherlock's `competitive-brief` skill; different shape, same chain).
- Not user research (interviews, synthetic audience); those are Chain 1 branches with their own outputs.
- Not a content audit at scale (that is `ux-taxonomy`, which can be called from s3 when the site has hundreds of pages).
- Not an SEO audit (Chain 5, Snake Eyes).
- Not a critique. The audit surfaces gaps and attachment points; the concept belongs to the next subagent. "I surface gaps and attachment points. The concept is yours."

## Grounding notes

The Aesop audit (2026-06-12) is the source for every stage. It ran in about an hour, with the browser session still live while the document was being written (session logs run 16:17 to 17:09 UTC; the file landed at 11:26 local). It was written for Gibson by name, with a Phase 2 mandate in the header, which is why the downstream chain started without a clarification.

Deliberate differences from the real run: the Gandalf distillation step (s4) is now explicit; the real artifact does not record one. The evidence gate (s2) is now named; the real artifact enforced it by convention ("Quotes are verbatim from the live pages unless noted") rather than as a stage.

## Changelog

- 1.0 (2026-09-04): created from the Aesop audit and Chain 1.
