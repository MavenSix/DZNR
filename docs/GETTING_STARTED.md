# Getting Started with DZNR

DZNR is designed to be talked to like any other Claude agent — you describe what you need, Tár routes it.

## Simple requests (single-subagent)

> "Audit this website: example.com"

Tár routes to Sherlock (audit default). You get a site audit back.

> "Generate the LWC for this Figma file"

Tár routes to Neo. You get the component spec.

> "I need a brand voice guide for a fintech startup"

Tár routes to Snape. You get the voice guide.

## Compound requests (multi-subagent)

This is where DZNR shines. Describe everything you need in one shot:

> "I need a discovery and heuristic analysis for this site, a brand and style breakdown with synthetic audiences and user journeys, with a project plan of key opportunity areas."

Tár detects the compound request, presents the bundle plan, then executes:
- Phase 1 (Sherlock): site discovery, heuristics, brand inputs, audiences, journeys, opportunities
- Phase 2 (Snape): brand & style breakdown
- Phase 3 (Morpheus): project plan with opportunity areas
- Gandalf called for distill/extract/critique throughout

All 6 deliverables come back together.

## Direct subagent invocation

When you know exactly who you want:

> "@dznr:gandalf — run polish and harden on this code"

Skips Tár's routing and goes straight to Gandalf.

## Specialist tools

For SEO, legal, telemetry, ops — name the skill:

> "Run legal-risk-assessment on this contract"

Snake Eyes deploys.

## When DZNR asks a question

If Tár can't route confidently, Snape voices a clarifying question. The voice is terse and precise:

> "Tár's uncertain — Snape or Gibson? Brand visual system or immersive experience?"

Pick one, and Tár proceeds.

## Helpful signals to use

These phrases help Tár route faster:

- "I'm good" / "ready for next phase" — handoff to next subagent
- "skip [X]" — drop a phase from a compound request
- "speed mode" / "skip hardening" — override mandatory Gandalf calls
- "advise" / "what's the best way" — get options before execution
- "full product approach" / "end-to-end" — force compound mode

## When something feels wrong

DZNR has 6 failure modes documented in `routing/FAILURE_MODES.md`. Common ones:

- **"I wanted Y to handle this, not X"** → Tár reroutes immediately and remembers
- **"This isn't good enough"** → subagent auto-retries with Gandalf polish
- **"Stop"** → bundle pauses, you decide what to keep

Hand teammates `docs/TEAM_REFERENCE_CARD.md` for a one-page guide.

## What's next

See `docs/ARCHITECTURE.md` for the full architecture diagram.
See `routing/TRIGGERS.md` to understand exactly how Tár routes.
