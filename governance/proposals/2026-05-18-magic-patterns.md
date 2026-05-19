# DZNR Change Proposal

**Proposer:** Kevin (with Claude drafting)
**Date:** 2026-05-18
**Type:** New MCP integration
**Status:** PROPOSED → REVIEW

---

## What

Integrate Magic Patterns MCP into DZNR.

**MCP details:**
- Name: Magic Patterns
- URL: https://mcp.magicpatterns.com/mcp
- Tools exposed: `get_design`, `read_files`, `update_design`
- Connected status: not yet connected (must be connected before integration is live)

Magic Patterns generates fresh UI designs from prompts (text-to-UI). Used across concept exploration, design system build, and refinement phases.

---

## Why

Kevin actively uses Magic Patterns in his design workflow. Currently it lives outside DZNR — meaning Kevin has to context-switch out of DZNR to use it. By integrating, the tool becomes part of compound design requests automatically.

Specific use cases this unlocks:
- **Concept exploration:** "Generate 5 UI directions for [client]'s onboarding" → Snape uses Magic Patterns to produce options before committing to a direction
- **Design system component variants:** "Show me variants of this card component" → Snape calls Magic Patterns mid-design-system-build
- **Refinement:** "Iterate on this design to feel more high-end" → Snape calls Magic Patterns with the current design as input

Team impact: Kevin + 1-2 designers actively use Magic Patterns. Routing needs to be clear enough for two non-Kevin designers to use it correctly.

---

## Which subagent claims it

**Primary owner: Snape** (Brand & Design Systems)
- Snape's domain is design generation and design system work
- Magic Patterns produces design output — exactly Snape's primary deliverable
- Snape's existing skills (design-systems, ds-theming, design-language, figma-*) compose naturally with Magic Patterns

**Secondary tool-callers:**
- **Gibson** can call Magic Patterns when exploring AI product or experience UI quickly (concept boards, prototype direction)
- **Gandalf** doesn't directly call Magic Patterns. Gandalf's role is refinement of OUTPUTS, not generation of options. But Snape may call Magic Patterns and then Gandalf in sequence: generate options → polish the chosen direction.

**Not owned by:**
- Sherlock (Magic Patterns generates, doesn't research)
- Neo (Magic Patterns produces design, not code)
- Morpheus (not a presentation tool)
- Snake Eyes (active design tool, not parked)

---

## Overlap analysis

**Adjacent skills:**
- `design-systems` (Snape) — system-level work; Magic Patterns generates components that feed into the system. Complementary, not duplicative.
- `figma-generate-design` (Snape via figma plugin) — also generates designs but specifically into Figma files. Magic Patterns produces standalone outputs. Different output medium.
- `web-artifacts-builder` (Neo) — builds interactive HTML artifacts. Magic Patterns generates the UI design that web-artifacts-builder would then implement. Sequential, not duplicate.
- `imagegen-frontend-web` / `imagegen-frontend-mobile` (Gandalf workshop) — also generate frontend visuals. THIS IS WHERE OVERLAP IS REAL.

**Overlap resolution (Gandalf vs Magic Patterns):**

Kevin's workshop `imagegen-frontend-*` skills are personal craft. Magic Patterns is an external service. Two real questions:

1. When generating frontend visuals, does Snape default to Magic Patterns or to Gandalf's imagegen-frontend-*?
2. What if they conflict?

**Proposed rule:**
- **Default to Magic Patterns** when request mentions "options", "variants", "explore", "iterate" — Magic Patterns is built for iteration
- **Default to Gandalf** when request mentions "in my style", "high-end-visual", "my taste" — workshop is personal craft
- **Snape clarifies** when unclear

This preserves the existing Gandalf-override authority for personal craft while giving Magic Patterns space for exploration work.

---

## Routing impact

### New TRIGGERS.md additions

**Snape's primary triggers (additions):**
- "Magic Patterns", "magicpatterns"
- "generate UI options", "show me design variants", "explore UI directions"
- "iterate on this design", "variants of this component"
- "text to UI", "generate from prompt"

**Snape's context-dependent (additions):**
- "explore" (when about UI) — Magic Patterns context
- "options for the design" — Magic Patterns vs design-systems decision

**Gibson's secondary tool-call (new entry):**
- Gibson can call Magic Patterns for concept exploration in Chain 3 NODE 2 (prototype direction phase)

### New SHARED_SKILLS.md entry

Magic Patterns is a Tier 2.5-adjacent integration: external service called by multiple subagents.

```
EXTERNAL MCP: Magic Patterns
DEFAULT CALLER: Snape
SECONDARY CALLER: Gibson (for AI product/experience UI concepts)
GANDALF OVERRIDE: No, but coordination needed for imagegen-frontend-* overlap

ROUTING RULES:
  IF request contains "Magic Patterns" / "magicpatterns" explicit invocation
    → Snape calls directly (peer mode)
  ELSE IF Snape is mid-design-system-work AND user wants component variants
    → Snape calls Magic Patterns
  ELSE IF Gibson is exploring AI product or experience UI
    → Gibson calls Magic Patterns
  ELSE IF user says "generate UI options" or similar
    → Snape calls Magic Patterns

OVERLAP RULE (Magic Patterns vs Gandalf imagegen-frontend-*):
  IF request mentions "in my style" / "high-end-visual" / "my taste" / "Kevin's aesthetic"
    → Gandalf's imagegen-frontend-* wins
  ELSE IF request mentions "options" / "variants" / "explore" / "iterate"
    → Magic Patterns wins
  ELSE → <Snape clarifies>

CLARIFICATION TRIGGER:
  Snape: "Generate fresh options (Magic Patterns) or apply Kevin's taste (Gandalf imagegen)?"
```

### CHAINS.md impact

Minor updates:

**Chain 2 (Brand Build) NODE 2 — Snape produces foundation:**
- Add bullet: "Snape may call Magic Patterns for component variants if request implies exploration"

**Chain 3 (Experience Build) NODE 2 — Gibson concept:**
- Add bullet: "Gibson may call Magic Patterns for AI product UI concept exploration"

---

## Test coverage

Re-trace these existing stress tests to verify no regression:

- TEST 3 (Brand from scratch) — Should now include Magic Patterns as an exploration option in Phase 2. Confirm Snape can pull it in without breaking the chain.
- TEST 12 (Brand-extracted modern site) — Phase 2 (Snape) might call Magic Patterns for component options. Confirm routing.
- TEST 15 (Design system from scratch) — Most likely beneficiary of Magic Patterns. Snape calls Magic Patterns for component variants.
- TEST 20 (Native chat prototype) — Gibson + Snape work — Magic Patterns may be called for chat UI options.

**Propose 2 new tests specific to Magic Patterns:**

**NEW TEST 21:** "Generate 5 UI variants for our client's checkout flow using Magic Patterns"
- Expected: Snape direct invocation of Magic Patterns
- Pass criteria: Snape uses get_design / update_design tools without ambiguity

**NEW TEST 22:** "Help me explore some UI options for the new feature — I want to see different directions before committing"
- Expected: Snape calls Magic Patterns (no explicit "Magic Patterns" mention, but "explore options" triggers)
- Pass criteria: Routing fires without clarification, Snape uses Magic Patterns

---

## Risks

**Risk 1: Overlap confusion with Gandalf imagegen-frontend-***
- Severity: Medium
- Mitigation: Explicit overlap rule above. Snape clarifies when ambiguous.

**Risk 2: Tool not connected**
- Severity: High (blocks integration)
- Mitigation: Integration is DRAFT-ONLY until MCP is connected. Once Kevin connects it, integration goes live.

**Risk 3: Team members don't know about it**
- Severity: Low
- Mitigation: Document in team failure summary card. Add to onboarding doc.

**Risk 4: Magic Patterns becomes too dominant, crowds out Gandalf imagegen-frontend-***
- Severity: Low-Medium
- Mitigation: Gandalf has override authority. The "in my style" / "high-end-visual" rule preserves Gandalf's role.

---

## Decision

**Status:** APPROVED (pending Magic Patterns MCP connection)

**Approver:** Kevin
**Approval date:** 2026-05-18
**Conditional:** Routing rules go live ONLY when Magic Patterns MCP is connected. Until then, this proposal is a queued integration.

**Rationale:** Magic Patterns fits Snape's domain cleanly. Use cases are real (Kevin uses it actively). Overlap with Gandalf is manageable via explicit rule. Team usage is small but real (2-3 designers). Low risk integration.

---

## Next steps (Steps 3-5 of Evolution Workflow)

- ✅ Step 1: Proposal written (this doc)
- ✅ Step 2: Reviewed and approved
- ⏭ Step 3: Update routing docs (TRIGGERS.md, SHARED_SKILLS.md, SUBAGENT_ROSTERS.md, CHAINS.md)
- ⏭ Step 4: Regression test (re-trace tests 3, 12, 15, 20 + add 21, 22)
- ⏭ Step 5: Deploy when MCP is connected

---

## CHANGELOG entry (to add to DECISIONS.md)

```
2026-05-18 — Magic Patterns MCP integration proposed and approved.
Primary owner: Snape. Secondary caller: Gibson. Overlap rule with Gandalf imagegen-frontend-* established.
Live status: pending MCP connection. Routing rules drafted in TRIGGERS.md, SHARED_SKILLS.md.
This was the first run of the Evolution Protocol — used as the canonical worked example.
```
