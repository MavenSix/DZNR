# DZNR Architecture

DZNR is a Claude Code plugin built on a deliberate architecture: deterministic routing, documented chains, eight specialist subagents, and a set of cross-cutting patterns that make the system predictable under scrutiny. This document captures the architecture as of v1.11.0.

For a visual reference, open [DZNR_architecture.html](./DZNR_architecture.html) in a browser. Note: the visual was generated 2026-05-18 and predates the Phase 3 additions (industry posture, MCP framework, four-lens check, three-mode Gandalf). A visual refresh is planned.

## High-level flow

```
User request
    │
    ▼
Tár (Orchestrator)
    │
    │ 1. Memory check (project state, industry tag, prior decisions)
    │ 2. Compound detection
    │ 3. Explicit specialist scan (Snake Eyes invocations)
    │ 4. Primary trigger scan
    │ 5. Disambiguation (default rules + auto-trigger + advise-first)
    │ 6. Compound Request Protocol (if compound)
    │ 7. Dispatch
    │ 8. Handoff inference
    │
    ▼
Subagent (or compound chain across subagents)
    │
    ├──► Snape (brand, design, clarifier)
    ├──► Sherlock (discovery, research, industry inference)
    ├──► Gibson (experience, AI product, four-lens check)
    ├──► Neo (delivery, code, validation loops)
    ├──► Morpheus (pitch, story, per-claim attribution)
    ├──► Gandalf (workshop, peer + tool + orchestrator)
    └──► Snake Eyes (specialist arsenal, mostly explicit invocation)
    │
    ▼
Artifacts (with source attribution, industry context, four-lens findings, etc.)
```

## The cast

| Character | Subagent | Role | Skills |
|-----------|----------|------|--------|
| Tár | Orchestrator | Routing, memory, dispatch | 8 |
| Snape | Brand and Design Systems + Clarifier | Identity, design system. Voices clarifying questions when routing is ambiguous. | 32 |
| Sherlock | Discovery and Research | Audit, research, synthesis. Sets the project industry tag. | 22 |
| Gibson | Experience Engineering + AI Product | Immersive, 3D, spatial, AI architecture. Two co-equal modes plus overlap. | 19 |
| Neo | Delivery and Code | Specs, components, ship. Platform-pure. Hard validation loops. | 24 |
| Morpheus | Pitch and Story | Outbound communications. Per-claim source attribution. | 19 |
| Gandalf | Workshop tri-mode | Personal craft (Kevin's 44 skills). The ONLY subagent who can call others (orchestrator mode, IA only). | 44 |
| Snake Eyes | Specialist Arsenal | Seven specialist clusters. Mostly explicit invocation, one soft-route (SEO). | ~55 |

Each subagent's full prompt lives in `agents/[name]/AGENT.md`. The prompts are versioned and documented; future changes go through the Evolution Protocol.

## Architectural patterns

These are the patterns developed across the cast that make DZNR practitioner-grade. Adopters who fork DZNR can study and replicate them.

### 1. Dispatch-context-driven mode determination

Some subagents operate in multiple modes (Snape: subagent vs clarifier; Gandalf: peer vs tool vs orchestrator). Mode selection is NOT chosen by the subagent. The mode is determined by how Tár dispatched the request, and switches only at dispatch boundary, never mid-conversation.

Why: predictability. A subagent that picks its own mode introduces non-determinism into a system that depends on chains being traceable.

### 2. Industry posture system

Every project carries an industry tag in project memory frontmatter (`memory/project_[name].md`). Nine industries across four clusters: luxury, automotive, retail, CPG, fintech, healthcare, technology, media/entertainment, public sector. Each industry has a posture profile (aesthetic defaults, tone defaults, research weights, compliance considerations, pitch vocabulary).

Sherlock sets the tag during initial discovery via the `identify-industry` step. Other subagents read the tag and adjust their defaults:

- Snape (heaviest reader): aesthetic and design system priorities
- Morpheus (second heaviest): pitch vocabulary and reference patterns
- Sherlock: research weighting
- Gibson: experience conventions
- Neo: light touch, only platform-expectation flags

Industry as input vs industry as driver varies by subagent. Snape uses it as primary default (deviations logged). Morpheus uses it as input, content drives narrative arc selection. Sherlock infers and sets. Others read situationally.

Full spec: [routing/INDUSTRIES.md](../routing/INDUSTRIES.md).

### 3. Per-claim source attribution

Morpheus's outbound artifacts cite their sources inline ("[Sherlock, site-audit]", "[Gibson, 3d-experience-design concept doc]"). External sources preserved in the citation chain. Quotes attributed with anonymization where appropriate.

Why: outbound artifacts (pitches, case studies, campaigns) are high-stakes and need to defend under scrutiny. Per-claim attribution is bulletproof; section-level attribution is the lighter touch for internal status reports.

### 4. Mandatory four-lens AI ethics check

Every AI product spec Gibson produces ships with a Four-Lens Check artifact: Empathy, Strategic Judgment, Guardianship, Verification. Non-optional. Same posture as Neo's mandatory Gandalf calls.

The four lenses come from Anthropic's `ai-product-prompting` and `thoughtful-ai-output` skills. Practitioner-grade reliability on AI work means the lenses are not aspirational; they are required.

If Guardianship surfaces a hard regulatory block, Gibson voices it before building.

### 5. Confirm-before-auto-run on rebuild language

When the user's request contains "rebuild" / "redesign" / "replatform" / "modernize" / "refresh" / "revamp" / "overhaul" / "reimagine" AND downstream chain triggers (pitch, brand, build), Sherlock does NOT silently run discovery. Sherlock asks the user to confirm.

Reasoning: discovery passes consume meaningful time; auto-running surprises the user; sometimes rebuild is a quick-pivot signal, not a from-scratch signal. Transparency over speed; collaborative tempo over surprise.

This reversed an earlier design (silent auto-invoke) during Phase 3.7 based on practitioner feedback.

### 6. Three-mode architecture with bounded orchestrator exception

Gandalf operates in three modes:

- **Peer:** Tár routes directly for workshop-specific requests
- **Tool:** Another subagent calls Gandalf mid-work
- **Orchestrator:** IA-explicit triggers only; Gandalf calls other subagents (the only chain in DZNR where this happens)

Orchestrator mode is bounded: only the Innovation Accelerator chain uses it. New skill packs that want orchestrator mode require Evolution Protocol approval.

Why bounded: preserving DZNR's overall architecture (Tár conducts, subagents play) while allowing IA to operate as a self-contained methodology.

### 7. MCP integration framework

Every MCP DZNR routes through has a documented spec at `routing/mcps/[name].md` covering ownership, triggers, workflow, status, fallback, and memory tags. Status lifecycle: PROPOSED, DOCUMENTED, PENDING, CONFIGURED-NOT-ACTIVE, ACTIVE, DEPRECATED.

Subagent prompts reference MCPs by pointer (spec file plus status flag), never by embedded detail. This keeps subagent prompts focused on subagent logic and makes MCP updates cheap.

Adopters add their own MCPs by dropping a spec file in `routing/mcps/`. The architecture transfers cleanly.

Full spec: [routing/MCPS.md](../routing/MCPS.md).

### 8. Hard validation loops on consequential gates

Neo has two hard validation loops in Chain 4 (delivery):

- NODE 4: Layer 1 (spec accuracy) validation. No override.
- NODE 6: Layer 2 (visual fidelity) validation. No override.

If validation fails, Neo loops back. The user CAN override Gandalf mandatory calls at NODE 5 (with explicit phrasing logged), but cannot override validation. Spec mismatches and visual fidelity gaps produce shipped bugs.

### 9. Cross-call patterns

Subagents call each other for specific reasons:

- Snape calls Gandalf for design taste and workshop polish (most frequent cross-call in DZNR)
- Gibson calls Snape for brand integration into experiences and AI product UI
- Morpheus calls Snape directly for brand voice; calls Gandalf via Snape (not directly)
- Sherlock cross-calls Snake Eyes for specialist skills mid-research (most common: Data Analytics cluster)
- Neo calls Snape for design fidelity reviews when Layer 1 validation flags spec/Figma mismatch

Each cross-call has a documented purpose. No cross-call is ad-hoc.

### 10. Confidence-threshold escalation

Subagents that make routing or inference decisions (Tár for routing, Sherlock for industry identification) use confidence-driven action:

- High confidence: act silently
- Medium confidence: act and log
- Low confidence: ask the user (Snape voices via clarifier mode for routing; Sherlock returns top 2 candidates for industry inference)

The threshold is heuristic, not numeric, but the pattern is consistent across the system.

## Routing system

The routing system is documented across eight files in `routing/`:

- [TRIGGERS.md](../routing/TRIGGERS.md): keyword maps per subagent
- [CHAINS.md](../routing/CHAINS.md): six chain decision trees plus compound request handling
- [SHARED_SKILLS.md](../routing/SHARED_SKILLS.md): disambiguation matrix for shared skills
- [FAILURE_MODES.md](../routing/FAILURE_MODES.md): six failure categories with detection and recovery
- [SUBAGENT_ROSTERS.md](../routing/SUBAGENT_ROSTERS.md): full skill rosters per subagent
- [INDUSTRIES.md](../routing/INDUSTRIES.md): industry posture system
- [MCPS.md](../routing/MCPS.md): MCP integration framework
- `mcps/` directory: per-MCP specs

The routing is deterministic by design. The same request type produces the same routing every time. When routing changes, the stress test suite re-runs to verify nothing regressed.

## Evolution

The architecture is not frozen. New MCPs, skills, subagents, and chains can be added via the 5-step Evolution Protocol documented in [governance/EVOLUTION.md](../governance/EVOLUTION.md):

1. **Propose** in `governance/proposals/`
2. **Review** (Kevin signs off on architecture changes; team can propose)
3. **Update routing** (TRIGGERS, CHAINS, etc.)
4. **Regression test** (stress test suite re-runs)
5. **Deploy** (commit, push, release)

Architectural patterns (the ten above) are protected. Changes to them require explicit Evolution Protocol approval. Stable patterns reduce cognitive load for the team and for adopters.

## Stress testing

The stress test suite at [tests/STRESS_TEST.md](../tests/STRESS_TEST.md) currently contains 30 traced test cases covering simple routing, compound requests, ambiguity, default disambiguation, rebuild auto-discovery, advise-first, four-lens checks, and Gandalf orchestrator mode.

Tests get re-run whenever routing changes. `scripts/validate-routing.sh` runs a minimal check on routing doc integrity; full stress test execution is currently manual but stress test results are documented in the test file itself.

## Adopters

If you want to fork DZNR for your own practice or team, see [ADOPTERS.md](./ADOPTERS.md). The architectural patterns transfer cleanly. The specific content (Kevin's 44-skill Gandalf workshop, the specific industry posture profiles, the Kevin-specific routing decisions) is configurable.

What's universal:
- The eight-subagent cast structure
- The ten architectural patterns above
- The routing system files (TRIGGERS, CHAINS, SHARED_SKILLS, FAILURE_MODES, SUBAGENT_ROSTERS, INDUSTRIES, MCPS)
- The Evolution Protocol
- The MCP integration framework

What's Kevin-specific (substitute your own):
- Gandalf's 44 workshop skills
- The specific industry posture profiles (you can extend, prune, or rewrite)
- Particular routing decisions logged in his project memory files

The architecture is the gift; the content is the example.
