---
project: aesop
industry: luxury
industry-secondary: cpg/personal-care
status: active
created: 2026-06-12
---

# Aesop

Speculative engagement. Audit of aesop.com plus an AI-augmented future-state concept.

## Scope
- Site + brand voice audit of aesop.com (Sherlock) — current digital experience baseline
- AI-augmented personal care consultation surface concept (Gibson, Mode AB) — tied to a member dimension; must respect Aesop's voice; explicitly NOT chatbot-shaped
- No build phase. No pitch phase. Deliverable is concept + audit documents.

## Routing precedents
- Industry tag written from explicit user statement (luxury primary, CPG/personal-care secondary) — no inference needed
- Voice-respect constraint is Gibson's to carry; Sherlock extracts voice evidence during audit to feed it
- Gibson four-lens AI ethics check mandatory (Mode AB)

## Phase plan
- Phase 1: Sherlock — site audit + brand voice extraction on aesop.com (done — aesop-audit.md)
- Phase 2 (sequential): Gibson — consultation surface concept "The Formulary" (done — aesop-ai-consultation-concept.md)
- Phase 3 (parallel): Morpheus pitch deck (aesop-pitch/index.html, 17 slides) || Neo prototype (aesop-formulary-prototype/index.html, 4 scenes) — both delivered 2026-06-12

## Format precedents
- Pitch deliverables for this project ship as self-contained HTML web decks (Aesop font/style fidelity over PPTX); user can request PPTX export later
- Prototypes: vanilla single-file HTML, no build step, demo data hardcoded; preview server config in DZNR EXPERIMENTS/.claude/launch.json (formulary, port 8431)
- Suisse Int'l is licensed — never hotlink; Helvetica Neue stack + understated serif as the standing fallback
- Visual assets: Snake Eyes sourced authentic product shots from aesop.com PDP og:image (Akamai blocks curl — fetch base64 inside a Playwright page session instead) + generated ambient stills; kit + rights notes in aesop-formulary-prototype/assets/MANIFEST.md. Product imagery is Aesop property, pitch-internal use only.
- Imagery precedent: prototype no longer single-file — index.html + assets/ travel together
- Deck imagery (2026-06-13): Snake Eyes 2nd deployment harvested 10 curated authentic Aesop editorial plates (store, basin ritual, treatment room, consultant desk, bottle walls, sepia hand) to aesop-pitch/assets/ + ~42 review pool in _review/. Morpheus art-directed all 17 slides: 8 imaged (full-bleed emotional beats + inset evidence), 9 left typographic for rhythm. Citations intact. Tár spot-checked 5 hero slides — luxury register confirmed.
- Note: Snake Eyes dispatch initially failed on a model-access error (claude-fable-5[1m]); harvest had completed but manifest had not — Tár wrote the manifest from verified images rather than re-running the harvest.
