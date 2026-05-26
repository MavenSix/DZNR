# DZNR Team Reference Card

**One-page cheat sheet for collaborators using DZNR.**

## The cast

| When you want... | Ask DZNR for... | Subagent |
|------------------|------------------|----------|
| Research, audit, opportunities | "audit", "discover", "research", "synthesize" | Sherlock |
| Brand identity, design system, Figma | "brand", "design system", "Figma", "design language" | Snape |
| Immersive, 3D, AI product, AI agent | "3D", "immersive", "AI agent", "AI product", "system prompt" | Gibson |
| Code, specs, ship to a platform | "build", "Sitecore", "LWC", "React", "ship", "deploy" | Neo |
| Pitch, deck, narrative, campaign | "pitch", "story", "deck", "campaign", "case study" | Morpheus |
| Workshop craft (polish, harden, taste) | "polish", "harden", "design-taste-frontend", "distill" | Gandalf |
| Specialist tool (legal, SEO, adobe, data) | Name the skill explicitly | Snake Eyes |

## Compound requests

If you need multiple things in one ask, describe them all:

> "Audit the site AND build the brand system AND make me a pitch deck"

Tár auto-detects compound and executes as a bundled chain. Phase-by-phase output comes back together with per-claim source attribution.

Force compound mode with: "full product approach" / "end-to-end" / "the whole stack" / "soup to nuts".

## Industry tagging

When you start a project, declare the industry up front:

> "Starting a fintech project for [client]."

Or let Sherlock infer during initial discovery. The tag affects how Snape designs, how Morpheus pitches, how Sherlock weights research. Multi-industry projects get a primary plus secondary tag.

Supported industries: luxury, automotive, retail, CPG, fintech, healthcare, technology, media/entertainment, public sector.

## What it means when DZNR says...

| DZNR says... | It means... | You should... |
|--------------|-------------|---------------|
| "Tár's uncertain whether..." | Routing ambiguity | Pick a route |
| "Tagged [project] as [industry]" | Sherlock inferred industry | Confirm or refine |
| "You mentioned rebuild..." | Sherlock asking before discovery pass | Confirm or skip |
| "Two architecture candidates..." | Morpheus offering narrative arc choices | Pick one |
| "Industry posture deviation logged" | Snape diverged from industry default | Confirm intentional, or correct |
| "Four-lens findings:" | Gibson surfacing AI ethics check | Read; address Guardianship flags |
| "Source: [Sherlock, site-audit]" | Morpheus citing per-claim attribution | Verify source if needed |
| "Capability gap detected" | Skill does not exist for this | Pick near-fit / build / drop |
| "Output doesn't meet the bar" | Skill malfunction or retry needed | Pick different skill / refine / skip |
| "Rerouting to [X]" | DZNR caught a misroute | Confirm to salvage |
| "Bundle paused at Phase N" | Compound blocker hit | Choose partial / wait / abandon |
| "Override confirmed. Shipping without [harden/polish/...]" | Mandatory remediation skipped per your request | Verify QA path adjusts |
| "Memory conflict" | Old vs new context | Tell DZNR which to trust |

## Signals to use

| Say... | To do... |
|--------|----------|
| "I'm good" / "next phase" | Move to next subagent |
| "skip [X]" | Drop a phase from compound |
| "speed mode" / "skip hardening" | Override mandatory Gandalf calls |
| "advise" / "what's the best way" / "tell me which" / "recommend" | Get options before execution |
| "full product approach" / "end-to-end" | Force compound mode |
| "@dznr:[name]" | Direct subagent invocation |
| "this is [industry]" | Lock the industry tag |
| "no, this should go to [subagent]" | Reroute Tár (remembered for project) |

## When you disagree

If DZNR routes to the wrong subagent, just say so:

> "No, this should have gone to Gibson, not Snape."

Tár reroutes immediately and remembers for this project.

If you disagree with an industry posture default:

> "This is luxury but the audience wants a more aggressive pitch."

Morpheus or Snape will log the deviation and adjust.

## Direct subagent invocation

When you know exactly who you want:

> "@dznr:gandalf, run polish and harden on this code"
> "@dznr:morpheus, write me a status update for the team"

Skips Tár's routing. Useful when you know the path.

> Direct-invocation syntax follows Claude Code plugin conventions as of 2026-05-26. Verify with `claude agent --help` if the prefix differs in your CLI version.

## More info

- Full installation: [`docs/INSTALLATION.md`](./INSTALLATION.md)
- Architecture: [`docs/ARCHITECTURE.md`](./ARCHITECTURE.md)
- Getting started: [`docs/GETTING_STARTED.md`](./GETTING_STARTED.md)
- Routing internals: [`routing/`](../routing/)
- How to propose changes: [`governance/EVOLUTION.md`](../governance/EVOLUTION.md)
- Forking DZNR for your practice: [`docs/ADOPTERS.md`](./ADOPTERS.md)
