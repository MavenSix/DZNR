# DZNR Team Reference Card

**One-page cheat sheet for collaborators.**

## The cast

| When you want... | Ask DZNR for... | Subagent |
|------------------|------------------|----------|
| Research, audit, opportunities | "audit", "discover", "research" | Sherlock |
| Brand identity, design system | "brand", "design system", "Figma" | Snape |
| Immersive, 3D, AI product | "3D", "immersive", "AI agent" | Gibson |
| Code, specs, ship | "build", "Sitecore", "LWC", "ship" | Neo |
| Pitch, deck, story | "pitch", "story", "deck" | Morpheus |
| Use Kevin's craft | "polish", "harden", "design-taste-frontend" | Gandalf |
| Specialist tool | name the skill explicitly | Snake Eyes |

## Compound requests

If you need MULTIPLE things in one ask, just describe them all:

> "Audit the site AND build the brand system AND make me a pitch deck"

Tár auto-detects compound and executes as a bundle.

## What it means when DZNR says...

| DZNR says... | It means... | You should... |
|---------------|-------------|----------------|
| "Tár's uncertain whether..." | Routing ambiguity | Pick a route |
| "Capability gap detected" | Skill doesn't exist for this | Pick near-fit / build / drop |
| "Output doesn't meet the bar" | Skill malfunction | Pick different skill / refine / skip |
| "Rerouting to [X]" | DZNR caught a misroute | Confirm anything to salvage |
| "Bundle paused at Phase N" | Compound blocker hit | Choose partial / wait / abandon |
| "Memory conflict" | Old vs new context | Tell DZNR which to trust |
| "Three clarifications in..." | Request is underspecified | Rewrite the request |

## Signals to use

| Say... | To do... |
|--------|----------|
| "I'm good" / "next phase" | Move to next subagent |
| "skip [X]" | Drop a phase |
| "speed mode" | Override mandatory hardening |
| "advise" / "what's the best way" | Get options first |
| "full product approach" | Force compound mode |
| "@dznr:[name]" | Direct subagent invocation |

## When you disagree

If DZNR routes to the wrong subagent, just say so:

> "No, this should have gone to Gibson, not Snape."

Tár reroutes immediately and remembers for this project.

## More info

- Full installation: `docs/INSTALLATION.md`
- Architecture: `docs/DZNR_architecture.html`
- Routing internals: `routing/`
- How to propose changes: `governance/EVOLUTION.md`
