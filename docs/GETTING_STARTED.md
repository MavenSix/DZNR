# Getting Started with DZNR

DZNR is designed to be talked to like any other Claude agent. You describe what you need; Tár routes it; the right subagent (or subagents) deliver. The routing is deterministic, documented, and traceable.

## Simple requests (single-subagent)

> "Audit this website: example.com"

Tár routes to Sherlock (audit default). You get a site audit back. Sherlock may run the `identify-industry` step during the audit, writing the project industry tag to memory.

> "Generate the LWC for this Figma file"

Tár routes to Neo. Neo enters Chain 4, generates the spec, applies mandatory Gandalf hardening at NODE 5, and ships the component.

> "I need a brand voice guide for a fintech startup"

Tár routes to Snape. Snape reads the fintech industry posture from `routing/INDUSTRIES.md` and applies fintech-typical defaults (trust signals, clarity over cleverness, no urgency hype) unless you direct otherwise.

## Compound requests (multi-subagent)

This is where DZNR shines. Describe everything you need in one request:

> "I need a discovery and heuristic analysis for this site, a brand and style breakdown with synthetic audiences and user journeys, with a project plan of key opportunity areas."

Tár detects the compound, presents the bundle plan, then executes:

- **Phase 1 (Sherlock, parallel):** site discovery, heuristics, brand inputs, audiences, journeys, opportunities
- **Phase 2 (Snape):** brand and style breakdown
- **Phase 3 (Morpheus):** project plan with opportunity areas

Gandalf is called for distill, extract, and critique along the way. All six deliverables come back together with per-claim source attribution.

## Phrases that change DZNR's behavior

| Say... | Effect |
|--------|--------|
| "I'm good" / "ready for next phase" | Handoff to the next subagent |
| "skip [X]" | Drop a phase from a compound request |
| "speed mode" / "skip hardening" | Override Neo's mandatory Gandalf calls (logged for QA) |
| "advise" / "what's the best way" / "should I" / "recommend" / "tell me which" | Get options before execution |
| "full product approach" / "end-to-end" | Force compound mode |
| "@dznr-os:[name]" | Direct subagent invocation |

> The `@dznr-os:[name]` direct-invocation syntax follows Claude Code plugin conventions as of 2026-05-26. Verify the exact syntax with your Claude CLI version (`claude agent --help`) if the prefix differs.

## Industry tagging

When you start a new project, DZNR will identify (or ask about) the industry. The tag affects how Snape designs, how Sherlock weights research, how Morpheus chooses pitch vocabulary, and how Gibson approaches experience conventions.

You can declare the industry up front:

> "I'm starting a fintech project for [client]."

Tár writes the tag immediately. Or Sherlock can infer it during initial discovery from your client's site, vocabulary, and competitive set. Either way, the tag lives in project memory and propagates to every subagent.

Supported industries: luxury, automotive, retail, CPG, fintech, healthcare, technology, media/entertainment, public sector. Multi-industry projects (a fintech-flavored retail commerce platform) get a primary plus secondary tag.

## When DZNR asks a question

If Tár cannot route confidently, Snape voices a clarifying question in clarifier mode. The voice is terse and slightly impatient:

> "Tár's uncertain whether this is Snape's work or Gibson's. Are you asking for a brand visual system or an immersive experience?"

Pick one and Tár proceeds. The choice is logged for the project so the same question does not get asked twice on the same engagement.

## When the rebuild question appears

If you say "rebuild" / "redesign" / "replatform" / "modernize" / "refresh" / "revamp" / "overhaul" / "reimagine" alongside downstream work (pitch, brand, build), Sherlock will ask before running a discovery pass:

> "You mentioned 'rebuild'. Want me to run a quick current-state discovery before [Snape/Gibson/Neo] starts? Takes about 5 to 10 minutes and downstream work will be much sharper with the baseline. Or skip and proceed directly."

Confirm or decline. If you decline, downstream subagents proceed without the baseline and flag any assumptions in their outputs.

## Advise-first

When you ask for advice on technical or design choices, DZNR's subagents present options before executing:

> "What's the best way to build a scroll-driven 3D product model that's lightweight?"

Gibson does not pick. Gibson produces a 2-to-4-option recommendation doc with trade-offs across effort, performance, cost, complexity, ecosystem fit, feasibility risk, and (Gibson-specific) experiential fidelity. You pick; Gibson executes.

Neo applies the same pattern for platform decisions (Sitecore vs Salesforce vs generic React vs native).

## Direct subagent invocation

When you know exactly who you want:

> "@dznr-os:gandalf, run polish and harden on this code"

Skips Tár's routing and goes straight to Gandalf.

## Specialist tools

For SEO, legal, telemetry, ops, Adobe, bio research, data analytics, name the skill:

> "Run legal-risk-assessment on this contract"
> "Use adobe-design-from-template for a flyer"
> "Run sql-queries on the warehouse"

Snake Eyes deploys.

The one exception: SEO-flavored requests soft-route to Snake Eyes automatically. Ambiguous cases (like "SEO blog content" which could be Morpheus or Snake Eyes) trigger a Snape clarifier.

## AI product work

When you ask DZNR to design an AI product (chat agent, AI feature, system prompt, agentic workflow), Gibson runs the mandatory four-lens ethics check before shipping the spec:

- **Empathy:** who is the end user, what state are they in
- **Strategic Judgment:** is AI generation the right answer here
- **Guardianship:** regulatory, accuracy, privacy, safety, bias considerations
- **Verification:** how the team will test the AI product over time

The four-lens artifact ships with every Mode B (AI Product) and Mode AB (overlap) spec. Non-optional. If Guardianship surfaces a hard regulatory block, Gibson voices it before building.

## Outbound work

When Morpheus produces a pitch deck, case study, stakeholder update, or campaign brief, every factual claim cites its source inline:

> "Page-load times exceed industry baseline by 3.2 seconds [Sherlock, site-audit]. The product has 24 articulating parts [Gibson, 3d-experience-design concept doc]."

Source attribution drops to section-level for lightweight internal deliverables. Per-claim attribution returns for external audiences.

## When something feels wrong

DZNR has six failure modes documented in `routing/FAILURE_MODES.md`. Common ones:

- **"I wanted Y to handle this, not X."** Tár reroutes immediately and remembers the correction for the project.
- **"This isn't good enough."** Subagent auto-retries with Gandalf polish or escalates if retries do not land.
- **"Stop."** Compound bundle pauses. You decide what to keep.

Hand teammates [`docs/TEAM_REFERENCE_CARD.md`](./TEAM_REFERENCE_CARD.md) for a one-page guide.

## What's next

- See [`docs/ARCHITECTURE.md`](./ARCHITECTURE.md) for the full architectural patterns
- See [`routing/TRIGGERS.md`](../routing/TRIGGERS.md) to understand exactly how Tár routes
- See [`docs/ADOPTERS.md`](./ADOPTERS.md) if you want to fork DZNR for your own practice
