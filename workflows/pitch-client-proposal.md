---
workflow: pitch-client-proposal
name: Pitch and Client Proposal
status: complete
version: 1.0
lead: morpheus
supporting: [snake-eyes, tar, gandalf, snape]
chains: [3]
grounded_in:
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-pitch/index.html
    date: 2026-06-13
  - path: ~/Documents/DZNR EXPERIMENTS/aesop-pitch/assets/MANIFEST.md
    date: 2026-06-13
  - path: ~/DZNR/routing/CHAINS.md (Chain 3 NODE 6, Chain 2 NODE 6)
    date: 2026-05-18
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["pitch this to", "build the deck for", "client proposal for", "package this for the client", "web pitch for", "present the concept"]
  spoken: ["Hey DZNR, pitch the Formulary to Aesop", "Hey DZNR, build the client deck", "Hey DZNR, package this for [client]"]
inputs_required:
  - id: source_artifacts
    source: memory
    on_missing: block
  - id: audience
    source: inline
    on_missing: ask
  - id: the_ask
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Narrative architecture
    owner: morpheus
    chain_node: "Chain 3 NODE 6"
    skills: [pitch, presentation-storytelling, pitch-script]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [slide-by-slide outline with source citation per slide, chosen narrative arc, the ask]
    checkpoint: true
    checkpoint_prompt: "Seventeen slides, Discovery Arc, the ask is one market one season phase one. Approve the outline?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Visual system from the audit
    owner: snape
    chain_node: null
    skills: [brand-from-scratch, aesthetic-system, theme-factory]
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:opus
    tools: []
    produces: [palette, type pairing, component classes derived from the brand voice profile]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Asset harvest and curation
    owner: snake-eyes
    chain_node: null
    skills: [adobe-batch-edit-photos, adobe-resize-photos-and-videos]
    models: null
    tools: [playwright-mcp, adobe-mcp]
    produces: [curated plates with suggested placement, _review pool, MANIFEST.md with rights class]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Manifest gate: rights class on every plate, no-over-process rule, Tár verifies"
    exit_allowed: false
  - id: s4
    name: Build the deck
    owner: morpheus
    chain_node: "Chain 3 NODE 6"
    skills: [pitch, web-artifacts-builder, pptx]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [claude-code]
    produces: [single-file HTML deck with footnote bar per slide, print stylesheet, keyboard navigation, or PPTX when requested]
    checkpoint: false
    checkpoint_prompt: null
    gate: "Attribution gate: every claim slide carries a footnote to audit or concept by section"
    exit_allowed: false
  - id: s5
    name: Taste pass
    owner: gandalf
    chain_node: "Chain 3 NODE 6 (Gandalf call point)"
    skills: [high-end-visual-design, polish, critique]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [restraint pass, rhythm of image and silence, print check]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s6
    name: Link the instrument and verify
    owner: tar
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: [relative link to prototype, manifest verification line, credit line naming sources]
    checkpoint: true
    checkpoint_prompt: "Deck is built, sixteen footnoted slides, prototype linked. Ready to send, or run the synthetic audience first?"
    gate: null
    exit_allowed: true
  - id: s7
    name: Rehearse against the audience
    owner: sherlock
    chain_node: null
    skills: [synthetic-audience]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [panel reactions, objections, slide-level notes]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: deck
    dual_with: html
  - type: manifest
    dual_with: null
cost_envelope_usd: [5, 40]
time_envelope: "Half a day to a day; Aesop assets were harvested the afternoon of day one, deck finished 9am day two"
exit_criteria:
  - "Every claim slide footnotes the audit or concept by section number"
  - "Palette and type are declared as derived from the audit's voice profile"
  - "One slide is dedicated to what the proposal is not"
  - "The ask is specific: market, season, phase, and the one dependency only the client can supply"
  - "Deck links to the prototype by relative path; both share one asset kit"
  - "Print stylesheet produces one slide per page"
memory_writes:
  - "project.pitch_path"
  - "project.the_ask (verbatim)"
  - "project.client_dependencies (what only they can supply)"
  - "project.source_citations (slide to section map)"
open_questions: []
---

# Pitch and Client Proposal

## Purpose

Turn finished discovery and concept work into the document that gets a yes. Morpheus owns it; every claim carries its source; restraint is sold as the feature. The Aesop Formulary deck is the reference: seventeen slides, Roman-numeral eyebrows, per-slide footnotes to the audit and concept, one slide on what it will not do, and a closing link to the live prototype.

## Stages

### s1. Narrative architecture

Morpheus picks the arc (`presentation-storytelling` gives four: Burning Platform, Discovery Arc, Vision Cast, Recommendation Stack; Aesop was a Discovery Arc) and writes the slide-by-slide outline with a source citation on every slide before any visual work. The ask is drafted here and it is specific: Aesop's was "one market, one season, Phase One, which contains no AI at all," plus the one dependency only the client can supply (the voice corpus and curated quotations). First checkpoint: approve the outline.

### s2. Visual system from the audit

Snape derives palette and type from the audit's brand voice profile, not from the brand's site. Aesop produced parchment, ink, sage, clay, umber; Georgia serif with Helvetica sans; and a CSS comment reading "derived from Sherlock's brand audit §3." Component classes follow: numbered principles ledger, specimen cards for artefacts, a not-list, a phase ladder grid, a four-lens grid, an invitation link.

### s3. Asset harvest and curation

Snake Eyes captures the brand's own photography via same-origin browser fetch (curl is blocked on most brand sites), curates a small set of plates with suggested placement by slide number, keeps a review pool of alternates, and writes MANIFEST.md with a rights class per plate (AESOP-PROPERTY, pitch-internal only) and handling notes ("preserve, do not correct" the brand's own colour grading). Tár verifies the manifest. No AI-generated imagery in the pitch unless the concept is itself generative; the client's own photography carries more authority.

### s4. Build the deck

Single-file HTML by default: horizontal scroll-snap sections, keyboard navigation, counter, print stylesheet with one slide per page, full-bleed plates with scrims, Ken Burns gated by `prefers-reduced-motion`. Each slide has a `.refs` footnote bar. The attribution gate: a claim slide without a footnote does not pass. PPTX via the `pptx` skill when the client's process needs it; the HTML remains the source.

### s5. Taste pass

Gandalf's `high-end-visual-design` and `polish`. The rule from the Aesop CSS: "Silence between images is the rhythm." No exclamation marks. Restraint on every slide.

### s6. Link the instrument and verify

The final slide invites the reader to open the prototype by relative path (`../<project>-prototype/index.html`). Credit line names the subagents and sources. Tár verifies the manifest line and the relative link resolves. Checkpoint: send, or rehearse first.

### s7. Rehearse against the audience

Optional. Sherlock runs `synthetic-audience` with personas built from the audit (design-literate, marketing-averse, for Aesop). Objections feed back to s1 or s4.

## Checkpoints

- **s1** outline and the ask.
- **s6** send or rehearse.

## Deliverables

HTML deck (dual with PPTX when requested) and the shared asset manifest. The deck and the prototype are siblings in adjacent folders and must stay that way for the link to hold.

## What this is not

- Not an internal status update (`stakeholder-update`, `status-report`).
- Not a campaign (`campaign-plan`, `content-creation`).
- Not a pitch script alone (`pitch-script` is s1's talking-points companion, not the deliverable).
- Not an investor deck; the `pitch` skill handles that framing but this workflow assumes a client audience and discovery inputs.

## Grounding notes

Source: aesop-pitch/index.html (1,066 lines, 17 slides) and its MANIFEST.md ("Phase 1 (Snake Eyes) harvest, verified by Tár 2026-06-13"). Assets harvested 2026-06-12 15:01; final plate and deck 2026-06-13 08:41 to 09:03.

Deliberate differences: Chain 3 NODE 6 says the default for experiences is pitch plus case study plus campaign plan; the real run produced the pitch only, and this workflow follows the real run (case study and campaign are separate requests). s5 Gandalf taste pass and s7 synthetic audience are named stages; neither is recorded in the artifact.

## Changelog

- 1.0 (2026-09-04): created from the Aesop pitch deck and manifest.
