# DZNR Industry Posture System

**Status:** v1.0 (Phase 3.5.2, 2026-05-26)
**Purpose:** Industry is a first-class concept in DZNR. Every project carries an industry tag that adjusts how Snape, Sherlock, Gibson, and Morpheus do their work. Neo mostly ignores it (code is code), with rare flags for industry-typical platform expectations.

This document defines the supported industries, how the tag is set on a project, where it lives, and how each subagent reads and applies it.

---

## Why industries (not companies) are the right branch

DZNR is platform-pure on the technical side (Neo treats every platform as a peer, no client or employer privileged). On the human side, DZNR needs a different organizing axis: the vocabulary, conventions, audience expectations, and risk profile of the industry the work lives in.

A luxury hospitality brand and a fintech challenger are both legitimate DZNR projects, but their work feels different at every layer:

- Snape's aesthetic defaults: restraint and craft for luxury, trust signals and accessibility for fintech
- Sherlock's research patterns: craft signals and brand heritage for luxury, regulatory landscape and trust competitors for fintech
- Morpheus's pitch vocabulary: storytelling and materiality for luxury, KPIs and compliance posture for fintech
- Gibson's experience conventions: tactile and sensory for luxury, clear-task-completion for fintech

Industry is the variable that lets DZNR adjust without splintering into separate subagents per vertical.

Company name is the wrong organizing branch. XCentium, ISHIR, in-house teams, independent freelancers, and any other shop can all do work in any industry. The work is shaped by the industry, not the org delivering it.

---

## Supported industries (v1)

DZNR supports 9 industries across 4 clusters (public-sector was added to the technology and public cluster after the original eight). Each industry has a posture profile that subagents read.

### Cluster 1: Luxury and automotive

#### `luxury`
Hospitality, fashion houses, fine jewelry, premium real estate, fine wine and spirits, luxury watches.

**Posture profile:**
- Aesthetic defaults: craft, restraint, materiality, silence, ample whitespace, considered typography (often serif or carefully chosen sans), muted-to-rich color palettes, subtle motion
- Tone defaults: confident understatement, sensory specificity, heritage and provenance signals
- Research weights: craft signals, brand heritage, materiality details, ritual and ceremony, exclusivity dynamics
- Compliance: minimal (some luxury cosmetic and food categories have regulatory overlap)
- Pitch vocabulary: never KPIs first, always experience first; brand equity language; long horizons

#### `automotive`
OEMs, dealership networks, aftermarket, mobility services, EVs.

**Posture profile:**
- Aesthetic defaults: engineering language, performance signals, cinematic visuals of vehicles in motion, premium-but-functional palettes, technical detail emphasis
- Tone defaults: precision, performance claims with specifics, heritage of engineering, sometimes aspirational lifestyle framing
- Research weights: performance benchmarks, dealer/buyer journey friction, configurator UX, financing patterns, total cost of ownership
- Compliance: safety claims regulated, fuel economy claims regulated, advertising practices regulated
- Pitch vocabulary: technical specs supported by emotional outcomes; never one without the other

### Cluster 2: Retail and CPG

#### `retail`
Commerce, fashion (non-luxury), marketplaces, DTC brands, omnichannel retailers.

**Posture profile:**
- Aesthetic defaults: conversion-focused but brand-coherent, merchandising patterns, clear product photography, urgency signals where appropriate, mobile-first
- Tone defaults: clear value proposition, trust signals (reviews, returns, shipping), social proof, sometimes playful or aspirational depending on category
- Research weights: conversion funnel friction, search and discovery UX, cart abandonment patterns, returns experience, loyalty program design
- Compliance: pricing transparency, claims accuracy, accessibility for e-commerce, GDPR/CCPA for customer data
- Pitch vocabulary: conversion lift, AOV, CLV, retention, the unit economics language

#### `cpg`
Consumer packaged goods, food and beverage (non-luxury), household goods.

**Posture profile:**
- Aesthetic defaults: brand-shelf coherence (work must look right next to retail stocking it), packaging-system thinking, claims-friendly layouts
- Tone defaults: benefit-led, claims-supported, often warm and inclusive, family-relevant where applicable
- Research weights: packaging shelf-impact, claims hierarchy, household decision-maker patterns, occasion-based usage
- Compliance: labeling, nutrition claims, allergen disclosure, FDA/USDA/FTC depending on product category
- Pitch vocabulary: brand equity, share-of-shelf, household penetration, occasion-based growth

### Cluster 3: Fintech and healthcare

#### `fintech`
Banking, payments, insurance, investing, lending, crypto where applicable.

**Posture profile:**
- Aesthetic defaults: trust-first (clean typography, restrained color, generous whitespace, no decorative noise), accessibility-first, dark-mode-quality light-mode (looks good in either)
- Tone defaults: clarity over cleverness, plain language for money topics, no false urgency, no hidden fees in microcopy
- Research weights: trust signals competitors use, regulatory landscape, compliance language patterns, accessibility for all customers, security claims architecture
- Compliance: SOC 2, PCI DSS, KYC/AML, regulatory bodies vary by region (SEC, FINRA, FDIC, OCC in US; FCA in UK; etc.). Snape and Sherlock both flag this.
- Pitch vocabulary: trust as primary, security and compliance as table stakes, clear cost transparency, regulatory awareness

#### `healthcare`
Provider systems, pharma, medtech, digital health, payer plans.

**Posture profile:**
- Aesthetic defaults: clinical-but-warm (varies: B2B medtech is clinical, consumer digital health is warm-clinical), accessibility-first (WCAG AA minimum, often AAA on critical paths), highly tested color contrast
- Tone defaults: clarity, empathy, precision on clinical facts, never-condescending plain language, defer-to-doctor framing where appropriate
- Research weights: HIPAA implications, clinical workflow integration, patient vs provider vs payer audience separation, accessibility for diverse abilities
- Compliance: HIPAA (US), GDPR health-data provisions (EU), HITRUST, FDA where medical device claims exist, state-level variations
- Pitch vocabulary: outcomes language, clinical evidence references, workflow integration, total-cost-of-care arguments

### Cluster 4: Technology, media, and public sector

#### `technology`
SaaS, dev tools, enterprise software, platforms, marketplaces in B2B context.

**Posture profile:**
- Aesthetic defaults: clean, system-driven, often-dark-mode-first, documentation-quality typography, code-friendly visuals
- Tone defaults: technical accuracy, developer-respectful (no condescension toward technical audience), benefit-led for non-technical audiences, growth-loop framing
- Research weights: developer experience, time-to-first-value, integration friction, pricing model fit, growth loops competitors run
- Compliance: SOC 2, sometimes HIPAA or PCI depending on data handled, GDPR/CCPA for customer data
- Pitch vocabulary: technical depth where audience earns it, growth metrics where stage demands it, expansion revenue framing for SaaS

#### `media-entertainment`
Film, TV, streaming, music, gaming, publishing, sports leagues.

**Posture profile:**
- Aesthetic defaults: narrative-first, expressive typography, dramatic imagery, often dark-mode (cinema feel), brand-as-character thinking
- Tone defaults: storytelling, emotional resonance, fandom-aware vocabulary, IP-respectful, occasionally playful and irreverent depending on franchise
- Research weights: fandom dynamics, social/community behaviors around the property, lifecycle of attention (release windows, seasons), platform vs audience separation
- Compliance: IP licensing, talent agreements, music rights, age-appropriate content classifications, COPPA for any youth-facing work
- Pitch vocabulary: attention, engagement, retention, fandom depth, transmedia opportunity, audience LTV in entertainment terms

#### `public-sector`
Government (federal, state, local), civic tech, education, nonprofits.

**Posture profile:**
- Aesthetic defaults: plain-language design, generous accessibility margins, neutral institutional palettes, never-flashy, never-condescending
- Tone defaults: plain language standards (US: Plain Writing Act), accountability framing, inclusive of all reading levels, sometimes multi-language by default
- Research weights: accessibility (Section 508 in US, EN 301 549 in EU), plain language compliance, multi-language requirements, low-bandwidth and old-device usage patterns
- Compliance: Section 508, WCAG AA minimum (often AAA), state and federal plain language requirements, FOIA implications, FERPA for education
- Pitch vocabulary: accessibility-first, public-good outcomes, accountability and transparency, inclusive design as foundation not feature

---

## How the industry tag is set

**Hybrid model (locked in Phase 3.5.2):** Sherlock infers a default during discovery, user can override or refine. Best of both worlds: automatic for common cases, correctable for edge cases.

### Tagging trigger flow

```
NEW PROJECT ENTERS DZNR
  ↓
TAR creates project memory file (memory/project_[name].md)
  ↓
IF user explicitly stated industry in initial request:
  → write industry tag to project memory frontmatter, skip inference
ELSE IF Sherlock is triggered (almost always for new projects via Chain 1 or rebuild auto-discovery):
  → during discovery, Sherlock runs `identify-industry` step
  → writes inferred industry tag to project memory frontmatter
  → Tár surfaces the inference in her status update: "Tagged [project] as [industry]. Confirm or refine?"
ELSE:
  → no tag set yet (rare)
  → first subagent to touch the project asks the user, or proceeds without industry posture
USER OVERRIDE PATH:
  → at any point, user says "this is luxury, not retail" or similar
  → Tár updates project memory tag
  → subagents pick up the new tag on next memory read
```

### Industry inference signals (for Sherlock)

When Sherlock runs the `identify-industry` step, infer from these signals in priority order:

1. **Explicit user mention**: if user named the industry, use it
2. **Client domain signals**: brand name, URL, products, services, target customer described in request
3. **Vocabulary in request**: "shopping cart" = retail, "patient portal" = healthcare, "fund manager" = fintech, etc.
4. **Web research during discovery**: Sherlock's discover-brand and site-audit produce signals (industry-typical patterns in the site, regulatory disclosures, "industries served" pages on B2B sites)
5. **Competitive set**: if Sherlock pulls a competitive brief, the competitors usually anchor the industry

**Confidence threshold:** if inference is below medium confidence, Sherlock returns the top 2 candidates and Tár asks the user to pick.

**Multi-industry projects:** some projects span multiple industries (a fintech-flavored retail commerce platform, a healthcare-flavored SaaS tool). Tag the primary, list secondaries in project memory. Subagents read primary first, secondary as modifier.

---

## Where the tag lives

Industry tag lives in the frontmatter of each project's memory file at `memory/project_[name].md`.

**Frontmatter shape:**

```yaml
---
name: project-[name]
description: [project one-liner]
metadata:
  type: project
  industry: luxury
  industry-secondary: hospitality  # optional, for sub-vertical specificity
---
```

**Memory file location:** `memory/project_[name].md` in the user's auto-memory directory (not in the DZNR repo, which is shared code; memory is per-user).

**Read protocol:** Every subagent that touches the project reads project memory before producing work. Tár's routing algorithm Step 1 already includes this read; other subagents follow the same pattern.

---

## How each subagent applies industry posture

### Snape (heaviest reader)

Snape reads the industry tag and adjusts:

- **Brand-from-scratch defaults**: industry-typical aesthetic conventions inform initial style direction (luxury defaults to restraint and craft; fintech defaults to trust-first; etc.)
- **Design system priorities**: industry-typical token weights (luxury cares more about typography hierarchy and whitespace; fintech cares more about color contrast and accessibility; etc.)
- **Brand voice defaults**: industry-typical tone (luxury never KPI-first; fintech never urgency-faked; healthcare never condescending)
- **Magic Patterns variant prompts**: when calling Magic Patterns for UI exploration, Snape includes industry context in the prompt so generated variants land in-vertical
- **Critique and review filters**: Snape's design critique reads through the industry lens (a luxury site getting "needs more conversion urgency" feedback would be wrong critique)

### Sherlock (sets the tag, applies in research)

Sherlock reads and applies:

- **Research weighting**: which signals to prioritize during discovery and audit (see posture profiles above)
- **Heuristic frameworks**: WCAG always, but supplement with industry-specific heuristics (fintech adds compliance heuristics; healthcare adds clinical-workflow heuristics; e-commerce adds Baymard Institute patterns)
- **Competitive set selection**: industry tag scopes which competitors are relevant
- **Audience persona priors**: industry-typical audience archetypes inform synthetic audience generation

### Morpheus (heaviest reader for outbound work)

Morpheus reads and applies:

- **Pitch vocabulary**: industry-appropriate language (no KPIs first for luxury, no "delight" framing for healthcare in clinical contexts, no growth-loop language for public sector)
- **Reference patterns**: industry-typical analogies, case studies, and proof points
- **Narrative architecture defaults**: some industries respond to Burning Platform (fintech often does), others to Vision Cast (luxury, automotive often), others to Recommendation Stack (B2B SaaS often), others to Discovery Arc (research-led work)
- **Compliance flags in copy**: industries with regulatory exposure get auto-flagged copy reviews (fintech, healthcare, public sector especially)

### Gibson

Gibson reads and applies:

- **Experience conventions**: industry-typical immersive and interactive patterns (museum installations differ from retail activations differ from corporate immersive)
- **AI product UX patterns**: industries vary in tolerance for AI uncertainty and human-in-the-loop expectations (healthcare and fintech high, media and gaming lower)
- **Sensory and tactile defaults**: luxury weights tactile and sensory; fintech weights clarity and confidence; public sector weights accessibility and plainness

### Neo (lightest reader, mostly ignores)

Neo reads and flags:

- **Platform expectations**: some industries have de-facto platform conventions (healthcare often wants HIPAA-ready stacks; luxury often wants asset-heavy CMS; fintech often wants compliance-aware hosting)
- **Compliance constraints on code**: WCAG AAA expectations in public sector; HIPAA-aware data handling in healthcare; PCI DSS scope for fintech
- **Otherwise platform-neutral**: code is code; the industry tag does not change Neo's core delivery logic

### Gandalf and Snake Eyes

Gandalf workshop skills are mostly industry-neutral (taste, polish, hardening). When industry-specific aesthetic work is needed, Snape calls Gandalf with industry context in the request, not in Gandalf's own logic.

Snake Eyes specialist arsenal is invoked by name; industry tag is contextual metadata but does not change Snake Eyes' routing.

---

## When industry posture conflicts with explicit user direction

User intent always wins. If a luxury brand explicitly asks for "make this feel like fintech trust signaling" (rare but real), Snape and Sherlock execute that request despite the luxury tag. The tag is a default, not a constraint.

When user direction conflicts with industry posture, the responsible subagent flags the divergence in their output so QA can see: "Note: client is tagged luxury but requested fintech-pattern trust signaling on the checkout page. Applied per request."

---

## Adding new industries (post-v1)

The 9 industries above are the current set. To add a new industry:

1. Propose via Evolution Protocol (`governance/EVOLUTION.md`)
2. Add posture profile to this file with all five sections (aesthetic, tone, research weights, compliance, pitch vocabulary)
3. Update Sherlock's `identify-industry` skill with new inference signals
4. Update Snape, Morpheus, and Gibson's industry-application logic if the new industry has meaningfully different posture from existing clusters
5. Add stress test entries to verify the new industry routes correctly

Industries to consider in v1.1 or later:
- Real estate (residential and commercial)
- Travel and hospitality (subset of luxury but distinct enough to warrant its own tag)
- Manufacturing and industrial B2B
- Energy and utilities
- Telecommunications
- Logistics and supply chain
- Sports (subset of media but distinct enough)
- Higher education (subset of public sector but distinct enough)

---

## Sherlock's identify-industry step (stub until Phase 3.6+)

When Sherlock is built in Phase 3.6+, his AGENT.md will include an `identify-industry` step in his discovery skill flow. The step:

1. Scans Sherlock's discovery outputs (discover-brand, site-audit, competitive-brief, idea-to-brief)
2. Applies the inference signals listed above (vocabulary, competitive set, brand context, etc.)
3. Outputs a tag with confidence level (high, medium, low)
4. If confidence is medium or high, writes tag to project memory; Tár surfaces for confirmation
5. If confidence is low, returns top 2 candidates; Tár asks user to pick

Until Sherlock is built, industry tagging is manual: user declares at project start, or Tár asks during initial routing.

---

## Status

- ✅ v1.0 — Industry posture system documented (this file)
- 🔄 Stub Sherlock `identify-industry` protocol (full implementation in Phase 3.6+ when Sherlock is built)
- ⏭ Per-subagent application sections will be expanded as each subagent is built (Snape Phase 3.6+ heaviest reader; Morpheus, Gibson follow)
- ⏭ Industry-specific reference files (luxury-aesthetics.md, fintech-compliance.md, etc.) added as adopters request them
