# DZNR Shared-Skill Disambiguation Matrix

**Phase 2.3 of the DZNR routing system**
**Status:** Draft v1
**Last updated:** 2026-05-18

This document defines explicit ownership rules for skills that legitimately serve multiple subagents. Each shared skill has:

- **Default owner** — who gets it when no other signal is present
- **Routing rules** — keyword/context conditions that override the default
- **Gandalf override** — whether Gandalf's workshop version takes precedence
- **Clarification trigger** — when Snape needs to ask the user

**Core principle:** Same request type produces same routing every time. Ambiguity always goes through Snape.

---

## How to read this document

For each shared skill:

```
SKILL: [name]
DEFAULT OWNER: [subagent]
GANDALF OVERRIDE: [yes/no — if Gandalf has a workshop version, it wins]
ROUTING RULES:
  IF [condition] → [owner]
  ELSE IF [condition] → [owner]
  ELSE → [default]
CLARIFICATION TRIGGER:
  [the case where Snape asks the user]
```

---

## Tier 1: Cross-subagent shared skills (9)

### journey-mapping

**Default owner:** Sherlock
**Gandalf override:** No

**Routing rules:**
```
IF request contains "customer journey" / "user journey" / "purchase funnel" / "onboarding journey" / "buyer journey" / "CX map"
  → Sherlock (uses journey-mapping for user research context)
ELSE IF request contains "spatial journey" / "immersive journey" / "experience map" / "physical journey" / "AR journey" / "in-world progression"
  → Gibson (uses journey-mapping for spatial/immersive design)
ELSE IF request mentions a specific user persona or research input
  → Sherlock (continues from research context)
ELSE IF request mentions a specific 3D / immersive / AR / VR context
  → Gibson (continues from experience context)
ELSE
  → Sherlock (default — user-focused journey mapping is more common)
```

**Clarification trigger:**
> Triggered when request says "build a journey map for [X]" and X is ambiguous (e.g. "the activation" — could be a marketing campaign journey OR an immersive activation journey).
>
> Snape: "Tár's uncertain — is this a user/customer journey (Sherlock) or a spatial/immersive journey (Gibson)?"

---

### theme-factory

**Default owner:** Snape
**Gandalf override:** No (theme-factory is a plugin skill, not a workshop skill)

**Routing rules:**
```
IF request contains "brand theme" / "brand kit" / "theming" / "white-label" / "design system theme"
  → Snape (theming a brand identity)
ELSE IF request contains "experience theme" / "world theme" / "narrative theme" / "immersive aesthetic"
  → Gibson (theming an experience)
ELSE IF request comes mid-chain from Snape (Chain 2)
  → Snape continues
ELSE IF request comes mid-chain from Gibson (Chain 3)
  → Gibson continues
ELSE
  → Snape (default — brand theming is more common)
```

**Clarification trigger:**
> Triggered when the word "theme" is used without context (e.g. "create a theme for this").
>
> Snape: "Is this a brand theme (Snape) or an experiential theme for a world/installation (Gibson)?"

---

### svg-generative

**Default owner:** Snape
**Gandalf override:** No

**Routing rules:**
```
IF request contains "brand pattern" / "brand visual system" / "logo system" / "brand identity asset" / "marketing visual"
  → Snape (generative SVG for brand)
ELSE IF request contains "experiential visual" / "data art" / "generative experience" / "immersive visual" / "live generative"
  → Gibson (generative SVG for experience)
ELSE IF request mentions D3 / data visualization in a design context
  → Snape (data art in brand context)
ELSE IF request mentions D3 / data viz in an experience/installation context
  → Gibson
ELSE IF request is purely about generative art with no brand or experience framing
  → Snape (default — most generative work in Kevin's portfolio is brand-side)
```

**Clarification trigger:**
> Triggered when request says "make generative SVG art" with no clear context.
>
> Snape: "Is this for brand identity (Snape) or for an experience/installation (Gibson)?"

---

### algorithmic-art

**Default owner:** Snape
**Gandalf override:** No

**Routing rules:**
```
IF request contains "p5.js" / "flow field" / "particle system" with brand framing
  → Snape (algorithmic art for brand)
ELSE IF request contains "p5.js" / "flow field" / "particle system" with experience framing
  → Gibson (algorithmic art for experience)
ELSE IF request explicitly says "generative art for [client/brand]"
  → Snape
ELSE IF request explicitly says "generative art for [installation/experience]"
  → Gibson
ELSE
  → Snape (default — same logic as svg-generative)
```

**Clarification trigger:**
> Same pattern as svg-generative.

---

### canvas-design (3-way shared)

**Default owner:** Snape
**Gandalf override:** No

**Routing rules:**
```
IF request contains "poster" / "print piece" / "brand artifact" / "physical design"
  → Snape (canvas-design for brand artifacts)
ELSE IF request contains "experiential visual" / "in-world artifact" / "installation visual"
  → Gibson (canvas-design for experience artifacts)
ELSE IF request contains "pitch visual" / "deck cover" / "pitch artwork" / "presentation visual"
  → Morpheus (canvas-design for pitch materials)
ELSE
  → Snape (default — most canvas-design work is brand-side)
```

**Clarification trigger:**
> Triggered when request says "design a visual" with no clear destination.
>
> Snape: "Is this for the brand system (Snape), a pitch deck (Morpheus), or an experience (Gibson)?"

---

### brand-review

**Default owner:** Snape (for system-level work) / Morpheus (for outbound copy)
**Gandalf override:** No

**Routing rules:**
```
IF request contains "review the brand voice" / "is this on-brand" / "brand consistency"
  → Snape (system-level brand review)
ELSE IF request contains "review this copy" / "review this email" / "review this pitch" / "review this campaign"
  → Morpheus (outbound content review)
ELSE IF request is part of a Brand Build chain (Chain 2) NODE 2
  → Snape
ELSE IF request is part of an outbound effort (Chain 2 NODE 6 or standalone Morpheus work)
  → Morpheus
ELSE
  → <Snape clarifies>
```

**Clarification trigger:**
> Triggered when request says "review this for brand alignment" without specifying what "this" is.
>
> Snape: "Is this system-level brand work (Snape) or outbound content (Morpheus)?"

---

### content-creation

**Default owner:** Morpheus
**Gandalf override:** No, but Gandalf's `quieter` can be called for tone adjustment

**Routing rules:**
```
IF request contains "marketing content" / "blog post" / "social post" / "email content" / "campaign content"
  → Morpheus (default outbound content)
ELSE IF request contains "brand-voice content" / "voice-defining content" / "content that establishes our voice"
  → Snape (content that IS the brand voice work)
ELSE IF request explicitly references a brand-build context (mid-Chain 2)
  → Snape
ELSE IF request explicitly references a campaign or outbound context
  → Morpheus
ELSE
  → Morpheus (default — outbound content is more common request)
```

**Clarification trigger:**
> Triggered when request says "write content for [X]" and X is ambiguous (e.g. "the homepage" — could be brand-voice work OR outbound marketing).
>
> Snape: "Is this content that defines your brand voice (Snape) or outbound content using an established voice (Morpheus)?"

---

### status-report

**Default owner:** Morpheus (for stakeholder/external) / Snake Eyes (operations plugin, for internal ops)
**Gandalf override:** No

**Routing rules:**
```
IF request contains "stakeholder update" / "executive summary" / "client status" / "leadership update"
  → Morpheus (outbound status)
ELSE IF request contains "ops status" / "process compliance" / "internal report" / "team status"
  → Snake Eyes (operations:status-report)
ELSE IF request is part of a Delivery chain (Chain 4 NODE 9)
  → Morpheus (sprint comms)
ELSE
  → Morpheus (default — most status reports Kevin produces are stakeholder-facing)
```

**Clarification trigger:**
> Triggered when request says "give me a status report" without audience context.
>
> Snape: "Stakeholder/client-facing (Morpheus) or internal ops (Snake Eyes)?"

---

### figma-code-connect

**Default owner:** Neo (because the END use is code mapping)
**Gandalf override:** No

**Routing rules:**
```
IF request is about generating or maintaining .figma.ts / .figma.js Code Connect files
  → Neo (the code side)
ELSE IF request is about mapping Figma component metadata for design-system documentation
  → Snape (the design-system side)
ELSE IF request is part of Delivery chain (Chain 4)
  → Neo
ELSE IF request is part of Brand Build chain Snape's work (Chain 2 NODE 2)
  → Snape (Snape sets up the mappings as part of system docs)
ELSE
  → Neo (default — code-connect is a code-side concern)
```

**Clarification trigger:**
> Rarely needed. Code Connect almost always ends in Neo's hands. Only ambiguous if user says "set up the design system to code mappings" with no further context.
>
> Snape: "Should Snape define the mappings as part of the design system docs, or Neo wire them up in code?"

---

## Tier 2: Gandalf override cases (workshop wins)

These are skills that exist in BOTH Gandalf's workshop AND in a subagent's plugin/core roster. **When the workshop version exists, Gandalf wins.**

### frontend-design

**Default owner:** Gandalf (workshop version)
**Why:** Kevin's authored personal version is explicitly preferred over any plugin frontend-design skill (locked in DECISIONS.md).

**Routing rule:**
```
ANY request involving "frontend design" / "front-end design" / "frontend taste"
  → Gandalf's frontend-design (workshop version)
```

No clarification needed. Locked.

---

### polish

**Default owner:** Gandalf (workshop version) for code/output polish; Snape for visual polish

**Routing rule:**
```
IF request contains "polish the design" / "polish the visual" / "polish the brand"
  → Snape (visual polish — Snape's craft)
ELSE IF request contains "polish the code" / "polish this output" / "polish this for production"
  → Gandalf's `polish` workshop skill
ELSE IF request comes from a subagent mid-chain (Chain 2 NODE 4, Chain 4 NODE 5)
  → Subagent calls Gandalf's `polish`
ELSE
  → Gandalf (default — workshop version is the most general-purpose polish skill)
```

**Clarification trigger:**
> Rarely. Only if "polish" appears with no other context.
>
> Snape: "Polish the visual/brand (Snape) or polish the output/code (Gandalf)?"

---

### harden

**Default owner:** Gandalf (workshop version)
**Why:** No subagent has a "harden" skill — this is uniquely Gandalf's.

**Routing rule:**
```
ANY request involving "harden" / "production-harden" / "edge-case proof"
  → Gandalf's `harden` skill
```

Mandatory call in Chain 4 NODE 5. Locked.

---

### optimize

**Default owner:** Gandalf (workshop version)

**Routing rule:**
```
IF request contains "optimize" / "performance optimize" / "tighten this"
  → Gandalf's `optimize` skill
ELSE IF request is specifically about SEO optimization
  → Snake Eyes (searchfit-seo:on-page-seo)
ELSE
  → Gandalf
```

---

### fixing-* (accessibility, metadata, motion-performance)

**Default owner:** Gandalf
**Why:** These are Gandalf's specialized remediation skills.

**Routing rule:**
```
IF request contains "fix accessibility" / "fix a11y" / "accessibility remediation"
  → Gandalf's `fixing-accessibility` skill
ELSE IF request contains "fix metadata" / "metadata cleanup" / "fix SEO metadata"
  → Gandalf's `fixing-metadata` skill (note: NOT Snake Eyes, because this is code-level metadata)
ELSE IF request contains "motion performance" / "animation performance" / "scroll perf"
  → Gandalf's `fixing-motion-performance` skill
```

Note: Snape's `accessibility-review` (design plugin) is DIFFERENT — that's a design-phase accessibility audit. Gandalf's `fixing-accessibility` is the implementation-phase remediation. Both exist; they're not duplicates.

---

### audit, critique, distill, extract, clarify, normalize, redesign-existing-projects

**Default owner:** Each subagent uses their primary "audit/critique/etc" skill, AND calls Gandalf's workshop version for sharper distillation.

**Pattern:**
- Subagent does the primary audit/critique with its own skill (e.g. Sherlock uses site-audit)
- Subagent calls Gandalf's workshop version mid-work for refinement (e.g. Sherlock calls Gandalf's `audit` for a sharper second pass)

**Routing rule:**
```
IF user explicitly says "use Gandalf's [skill]" / "use the workshop audit"
  → Gandalf directly (peer mode)
ELSE
  → Subagent does primary work, calls Gandalf as tool when their output needs sharpening
```

---

## Tier 2.5: Interactive artifact packaging (NEW)

**The pattern:** Sherlock (and other research/analysis subagents) produce data — journey maps, personas, audit findings, opportunity playbooks. When the user wants those outputs to be INTERACTIVE (clickable, hoverable, navigable HTML rather than a static doc), a packaging subagent has to take Sherlock's data and build the interactive layer.

**Default packaging owner:** Neo
**Why:** Neo owns web-artifacts-builder. Interactive HTML artifacts are his territory.

**Routing rule:**
```
IF Sherlock produces research output (journey, persona, audit, findings)
   AND user requested "interactive" / "clickable" / "navigable" / "URL deliverable"
   AND the interactivity is web-based (not spatial/immersive/3D)
  → Neo packages using web-artifacts-builder
ELSE IF interactivity is spatial / immersive / 3D / AR / VR
  → Gibson packages using webgl-threejs / 3d-experience-design
ELSE IF user wants a Figma artifact (not HTML)
  → Snape packages using figma-use / figma-generate-design
ELSE
  → Neo (default — HTML artifact is the most common)
```

**Examples:**
- "Interactive journey map" → Sherlock (journey-mapping) → Neo (web-artifacts-builder packages it)
- "Interactive 3D journey through this experience" → Sherlock (journey data) → Gibson (3D packaging)
- "Synthesis template I can deliver as URL" → Sherlock (synthesis logic) → Neo (web-artifacts-builder)

**Clarification trigger:**
> Triggered when user says "interactive" without specifying medium (HTML / 3D / Figma).
>
> Snape: "Interactive how — clickable HTML artifact (Neo), spatial/3D (Gibson), or Figma prototype (Snape)?"

---

## Tier 2.6: External MCP integrations (NEW — Evolution Protocol product)

External MCPs called by multiple subagents. Routing rules below.

### Magic Patterns MCP (PENDING connection)

**Status:** Approved 2026-05-18, awaiting MCP connection to go live.
**Default caller:** Snape
**Secondary callers:** Gibson (AI product / experience UI concepts)
**Tools exposed:** get_design, read_files, update_design

**Routing rules:**
```
IF request contains "Magic Patterns" / "magicpatterns" / explicit invocation
  → Snape calls directly (peer mode)
ELSE IF Snape is mid-design-system-work AND user wants component variants
  → Snape calls Magic Patterns
ELSE IF Gibson is exploring AI product or experience UI concepts
  → Gibson calls Magic Patterns
ELSE IF user says "generate UI options" / "show me UI variants" / "explore UI directions"
  → Snape calls Magic Patterns
ELSE
  → Not invoked
```

**Overlap rule with Gandalf `imagegen-frontend-web` / `imagegen-frontend-mobile`:**
```
IF request mentions "in my style" / "high-end-visual" / "my taste" / "Kevin's aesthetic"
  → Gandalf imagegen-frontend-* wins (workshop preserves Kevin's personal craft)
ELSE IF request mentions "options" / "variants" / "explore" / "iterate"
  → Magic Patterns wins (built for iteration)
ELSE → <Snape clarifies>
```

**Clarification trigger:**
> Snape: "Generate fresh options (Magic Patterns) or apply Kevin's taste (Gandalf imagegen)?"

---

## Tier 3: Skills with no real ambiguity (locked, no rules needed)

These were listed earlier as "shared" but on inspection they're not actually ambiguous. Listing for completeness:

- **figma-* skills** (besides figma-code-connect) — all live with Snape, no ambiguity
- **xcm-* skills** — all live with Neo, no ambiguity
- **product-tracking-* skills** — all live with Snake Eyes, no ambiguity
- **All anthropic-skills core skills not listed in Tier 1 or 2** — single-owner, no ambiguity

---

## Routing precedence (when multiple rules apply)

When a request triggers MULTIPLE shared-skill rules, Tár applies precedence in this order:

1. **Explicit user invocation** — "Use Gandalf's polish" beats all other rules
2. **Chain context** — if we're mid-chain, the chain's owner gets the skill
3. **Gandalf override** — if Gandalf has the workshop version, Gandalf wins
4. **Keyword match** — most specific keyword match wins (e.g. "spatial journey" beats generic "journey")
5. **Default owner** — fallback when nothing else applies
6. **Snape clarifies** — if precedence is still ambiguous after all the above

---

## What this enables in Phase 2.4 (Stress Test)

Now that shared skills have explicit ownership:
- Each of your 15-20 stress test requests can be traced to ONE owner
- We can verify no request gets routed to the wrong subagent because of vague shared-skill rules
- We can verify Snape's clarification only fires when truly ambiguous (not too often)
- We can verify Gandalf gets called when appropriate (not too rarely)

---

## What this enables in Phase 2.5 (Failure Modes)

The clarification triggers in this doc become the seed for Snape's clarification phrasing library. Phase 2.5 will refine those into exact templates.

---

## Status

- ✅ Phase 2.1 — Trigger keyword maps (TRIGGERS.md)
- ✅ Phase 2.2 — Chain decision trees (CHAINS.md)
- ✅ Phase 2.3 — Shared-skill disambiguation matrix (this doc)
- ⏭ Phase 2.4 — Stress test with Kevin's 15-20 real requests
- ⏭ Phase 2.5 — Failure-mode playbook

---

## Open questions for Kevin to review

1. **journey-mapping default** — I set Sherlock as default. Is that right, or do you do more spatial/immersive journey mapping than user journey mapping?

2. **content-creation default** — I set Morpheus as default. Is that right, or does brand-voice content (Snape) come up as often?

3. **status-report default** — I set Morpheus as default (stakeholder-facing). Is that right, or do you produce more internal/ops status reports?

4. **figma-code-connect** — I default to Neo. Is that right, or does this typically start with Snape setting up the mapping concept?

5. **`polish` ambiguity** — I have Snape claiming "polish the visual" and Gandalf claiming "polish the code." Is that the right split, or should "polish" almost always be Gandalf?

6. **Gandalf workshop calls in audit/critique** — I described a pattern where subagents do primary audit work and call Gandalf for sharper refinement. Is that realistic to how you'd actually use Gandalf, or would you call Gandalf directly more often?
