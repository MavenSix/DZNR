# DZNR Prompt Library

Thirty-five prompts your team can copy, swap brackets, send. Organized by discipline. Each prompt is a real workflow we run.

**Version:** 2.0.0
**Last updated:** 2026-07-01

---

## Install (one time, takes a minute)

```bash
# 1. Clone the repo
git clone https://github.com/MavenSix/DZNR.git ~/DZNR

# 2. Install the plain /dznr slash command at the user level
mkdir -p ~/.claude/commands && cp ~/DZNR/commands/conduct.md ~/.claude/commands/dznr.md

# 3. Launch Claude Code with DZNR loaded
claude --plugin-dir ~/DZNR
```

Inside Claude Code, type `/d` and pick `/dznr`. Tár introduces the cast. You are ready.

---

## The prompt pattern

Every prompt in this library follows the same shape:

> `/dznr [verb] [subject] [outcome you want]. Industry is [INDUSTRY], sub-vertical [SUB-VERTICAL]. [Optional constraints].`

Swap the brackets, send. Tár picks the routing from there.

**Industry tags DZNR knows:** luxury, automotive, retail, CPG, fintech, healthcare, technology, media-entertainment, public-sector. Naming the industry up front sharpens every subagent's defaults.

---

## Category 1: Discovery & Audits

### 1. Site experience audit

**Use case.** Comprehensive audit of an existing site across UX, brand, content, and technical health.

```
/dznr audit [URL] across UX, brand, content, and technical health.
Industry is [INDUSTRY], sub-vertical [SUB-VERTICAL]. Deliver as a
prioritized findings list with severity and recovery steps.
```

**What you get.** Sherlock-led audit report. Findings tiered by severity, each with a recovery step. Industry tag set in project memory for the rest of the engagement.

**Variation.** Replace `prioritized findings list` with `executive scorecard` for leadership audiences, or `sprint backlog` for engineering teams.

### 2. Brand decode

**Use case.** Decode another brand's design language so you can reference it, differentiate from it, or learn from it.

```
/dznr decode the visual design language of [BRAND] from their website
[URL]. Capture typography, color, spacing rhythm, photographic grammar,
and the underlying brand posture. Industry is [INDUSTRY].
```

**What you get.** Visual language extraction from Snape. Brand posture analysis. Pattern library you can reference in your own work.

**Variation.** Add `compare against [COMPETITOR BRAND]` to get a side-by-side decode showing where the two brands diverge.

### 3. Competitive read

**Use case.** Compare your client against direct competitors on positioning, design, and messaging.

```
/dznr run a competitive read on [CLIENT/BRAND] against [COMPETITOR 1],
[COMPETITOR 2], and [COMPETITOR 3]. Industry is [INDUSTRY]. I need
positioning gaps, messaging differentiation opportunities, and design
language deltas.
```

**What you get.** Sherlock + Morpheus competitive analysis. Positioning matrix. Three to five differentiation opportunities your client could own.

**Variation.** Add `prepare it as a sales battlecard` for outbound use, or `prepare it as a strategy brief` for internal planning.

---

## Category 2: Brand & Design Systems

### 4. Brand from scratch

**Use case.** Build a complete visual identity from a logo, mood board, reference images, or just a vibe description.

```
/dznr build a brand from scratch for [CLIENT NAME]. They make
[PRODUCT/SERVICE] for [AUDIENCE]. Industry is [INDUSTRY], sub-vertical
[SUB-VERTICAL]. The vibe is [DESCRIBE: e.g., warm minimalist with
editorial undertones]. I have [LOGO / MOODBOARD / REFERENCE IMAGES /
NOTHING] to start from.
```

**What you get.** Snape-led brand foundation. Voice and tone, typography pairing, color system with light and dark modes, motion principles, design tokens ready to drop into a config file.

**Variation.** Add `produce a brand one-pager I can show the client` to get an outbound-ready summary alongside the tokens.

### 5. Design system audit

**Use case.** Audit an existing design system for token inconsistencies, component drift, and accessibility gaps.

```
/dznr audit the design system at [REPO URL or FIGMA URL] for
[CLIENT/BRAND]. I need findings on token inconsistencies, component
drift, missing patterns, and accessibility gaps. Industry is [INDUSTRY].
Output as a prioritized backlog the team can work from.
```

**What you get.** System audit from Snape. Prioritized backlog of fixes. Accessibility findings tied to WCAG criteria. Recommendations for missing patterns.

**Variation.** Replace `prioritized backlog` with `health scorecard` for leadership reviews, or `migration plan` if the goal is a system rebuild.

### 6. Theme a design system for a brand

**Use case.** Apply a brand identity to an off-the-shelf design system. Produces production-ready config files.

```
/dznr theme [DESIGN SYSTEM: shadcn / MUI / Hero UI / Radix / Chakra]
for [BRAND/CLIENT]. Brand inputs: [LIVE URL / FIGMA / BRAND GUIDE PDF /
DESCRIPTION]. Industry is [INDUSTRY]. Output production-ready config
files: CSS variables, Tailwind config, theme provider.
```

**What you get.** Production-ready token files. Theme configuration. Example components rendered in the new theme. Drop-in code your engineering team can merge.

**Variation.** Add `light and dark mode` or `white-label across [N] brands` if the system needs multi-theme support.

---

## Category 3: UX & Product Design

### 7. Customer journey map

**Use case.** Map how a customer moves through a real or proposed experience, with emotional arc and opportunities.

```
/dznr build a customer journey map for [CLIENT/BRAND]'s [JOURNEY: e.g.,
new customer onboarding, purchase flow, loyalty enrollment]. Industry
is [INDUSTRY], sub-vertical [SUB-VERTICAL]. Map touchpoints, emotional
arc, pain points, and opportunities. Deliver as a journey artifact I
can hand to stakeholders.
```

**What you get.** Gibson-led journey map. Touchpoint inventory. Emotional arc. Three to five opportunities ranked by impact. Stakeholder-ready artifact.

**Variation.** Replace `customer journey map` with `service blueprint` for back-stage operational mapping, or `experience map` for cross-channel work.

### 8. Wireframe a feature

**Use case.** Wireframe a new feature, page, or flow at the right fidelity for the audience reviewing it.

```
/dznr wireframe [FEATURE: e.g., a multi-step checkout, a member
dashboard, a content discovery flow] for [CLIENT/BRAND]. Industry is
[INDUSTRY]. Form factor is [WEB / MOBILE / KIOSK / XR]. Fidelity
needed: [LOW / MID / HIGH]. Audience: [WHO WILL REVIEW THIS].
```

**What you get.** Wireframes at requested fidelity. Screen flow. Interaction notes. Edge cases. Handoff annotations if fidelity is high.

**Variation.** Add `with content and microcopy filled in` if the wireframe needs to feel real for stakeholder review, or `with annotations for engineering handoff` if next stop is build.

### 9. Content taxonomy audit

**Use case.** Decide what content lives, dies, and consolidates on a large site. Includes language to push back on SEO objections.

```
/dznr run a content taxonomy audit on [URL or SITEMAP]. Industry is
[INDUSTRY]. I need a page-by-page inventory with keep, improve,
consolidate, deprecate, and delete decisions, plus a redirect strategy.
The stakeholder owns SEO and is protective of page count, so include
the rebuttal toolkit.
```

**What you get.** Scored page inventory. Information architecture recommendation. Redirect map. Stakeholder rebuttal language for the conversations where SEO leads push back on deletions.

**Variation.** Add `compare against [COMPETITOR URL]` to ground the recommendation in industry benchmarks.

---

## Category 4: AI Product & Experience

### 10. AI feature spec with four-lens check

**Use case.** Spec an AI feature with the mandatory Empathy, Strategic Judgment, Guardianship, and Verification check.

```
/dznr spec an AI feature for [CLIENT/BRAND]: [FEATURE: e.g., an AI
shopping advisor, a content recommendation engine, an in-product
copilot]. Industry is [INDUSTRY], sub-vertical [SUB-VERTICAL]. The
audience is [WHO]. Run the four-lens check and flag any surfaces that
should not ship as AI.
```

**What you get.** Gibson-led AI feature spec. Four-lens artifact attached. Decline list naming surfaces that should not ship as AI (with reasoning). Verification plan.

**Variation.** Add `compare a fine-tune approach against a RAG approach` if the architecture is still open, or `with safety review for [REGULATION: HIPAA / GDPR / fiduciary]` for regulated industries.

### 11. Immersive experience concept

**Use case.** Concept an immersive or interactive experience: web 3D, installation, AR, VR, hybrid physical-digital.

```
/dznr concept an immersive experience for [CLIENT/BRAND]: [BRIEF: e.g.,
a scroll-driven 3D product story, an in-store interactive installation,
an AR try-on]. Industry is [INDUSTRY]. Tech surface: [WEB 3D / SPATIAL
/ AR / VR / PHYSICAL-DIGITAL HYBRID]. I need narrative architecture,
technical sketch, and feasibility flags.
```

**What you get.** Gibson concept doc. Narrative arc. Technical sketch with stack recommendation. Feasibility flags. Production budget tier estimate.

**Variation.** Add `with a participant journey overlay` if the experience is live or installation-based, or `with platform comparison [Three.js vs Unity vs WebGL]` if the tech surface is contested.

### 12. Synthetic audience test

**Use case.** Stress-test a concept against a constructed audience panel before exposing it to real users.

```
/dznr run a synthetic audience test on this concept: [PASTE CONCEPT or
LINK]. The target audience is [DEMOGRAPHIC / PSYCHOGRAPHIC: e.g., $200k+
HHI urban professionals, Gen Z streetwear collectors]. Industry is
[INDUSTRY]. Surface where it lands, where it falls flat, and what would
make it land harder.
```

**What you get.** Synthetic audience reactions across three to five constructed personas. Blind spots. Refinement recommendations ranked by impact.

**Variation.** Add `test the messaging variants A, B, and C` for multi-variant testing, or `against [COMPETITOR BRAND]'s positioning` to find the differentiation gap.

---

## Category 5: Pitch & Story

### 13. Pitch deck from upstream work

**Use case.** Package research and design work into a pitch deck with per-claim source attribution.

```
/dznr build a pitch deck for [CLIENT/BRAND] from the work we have so
far. The audience is [INVESTORS / BOARD / PROSPECT / INTERNAL
LEADERSHIP]. Industry is [INDUSTRY]. The ask is [WHAT YOU ARE PITCHING
FOR: e.g., a $250k engagement, board approval, project green-light].
Use [DISCOVERY ARC / VISION CAST / BURNING PLATFORM / RECOMMENDATION
STACK] as the narrative architecture, or let Morpheus pick the right
one based on audience and ask.
```

**What you get.** Morpheus-led pitch deck. Slide-by-slide. Per-claim source attribution inline (every claim cites Sherlock, Snape, Gibson, or named benchmark). Speaker notes optional.

**Variation.** Add `as a PPTX file` for editable handoff, `as a Gamma deck` for web presentation, or `as a long-form web pitch` for high-context audiences.

### 14. Investor pitch script

**Use case.** Turn a deck into a slide-by-slide talking-points script for live presentation.

```
/dznr write a pitch script for [CLIENT/BRAND]'s [DECK FILE OR LINK].
The presenter is [FOUNDER / EXEC / DESIGNER]. The audience is [WHO].
The duration is [LENGTH]. The ask is [WHAT THEY ARE PITCHING FOR].
Industry is [INDUSTRY].
```

**What you get.** Slide-by-slide script. Transition language between slides. Handle-the-question prep for the three to five questions the audience is most likely to ask.

**Variation.** Add `with a 30-second elevator version up top` for the cold open, or `with anticipated objections and responses` for difficult audiences.

### 15. Proposal write-up

**Use case.** Long-form proposal narrative (not a deck) for high-context audiences who prefer to read.

```
/dznr write a proposal for [CLIENT/BRAND] covering [WHAT YOU ARE
PROPOSING]. The audience is [WHO]. Industry is [INDUSTRY], sub-vertical
[SUB-VERTICAL]. Format as a long-form narrative write-up, not a deck.
Length [SHORT / MEDIUM / LONG]. Tone [FORMAL / WARM / TECHNICAL].
```

**What you get.** Long-form proposal narrative from Morpheus. Per-claim source attribution. Executive summary up top. Appendices with supporting work.

**Variation.** Add `as a DOCX file` for editable handoff, or `with a one-pager summary` for cover-letter use.

---

## Category 6: Delivery & Polish

### 16. Spec from Figma

**Use case.** Turn a Figma design into a functional and technical spec offshore can build from.

```
/dznr write a functional and technical spec from [FIGMA URL] for
[CLIENT/BRAND]. Target platform is [SITECORE XM CLOUD / SALESFORCE LWC
/ AEM / REACT / NATIVE MOBILE / SHOPIFY HYDROGEN]. Include component
anatomy, props, states, edge cases, and offshore-ready acceptance
criteria.
```

**What you get.** Functional spec. Technical spec for the target platform. Jobs-to-be-done hybrid user stories. QA narrative covering experiential quality, not just functional pass-fail.

**Variation.** Add `with three-layer validation against the Figma` to get Layer 1 spec accuracy, Layer 2 visual fidelity, and Layer 3 experiential checks baked into the handoff.

### 17. Repo scaffold

**Use case.** Generate a production-ready repo with cursor rules, CI/CD config, and pre-populated docs.

```
/dznr scaffold a repo for [PROJECT NAME]. Stack is [REACT NATIVE /
NEXT.JS / SHOPIFY HYDROGEN / NATIVE IOS / OTHER]. Include cursor rules,
CI/CD config, a /docs folder with the planning artifacts, and a README
that hands off cleanly to engineering. Industry is [INDUSTRY].
```

**What you get.** Full repo scaffold. Cursor rules tuned to the stack. CI/CD configuration. Populated /docs folder. README that bridges planning work to implementation work.

**Variation.** Add `with the design system at [DS REPO] pre-integrated` to wire the system in from the start, or `with telemetry instrumented for [ANALYTICS PLATFORM]` to ship tracking baseline.

### 18. QA handoff package

**Use case.** Generate test scenarios, acceptance criteria, and a QA narrative for a component or feature.

```
/dznr generate a QA handoff package for [COMPONENT/FEATURE] in
[PROJECT]. Stack is [STACK]. Industry is [INDUSTRY]. Include test
scenarios, edge cases, browser and device matrix, accessibility
checklist, and the n8n-ready JSON payload for automated dispatch.
```

**What you get.** Full QA package. Test matrix. Browser and device coverage. Accessibility checklist tied to WCAG. Automation payload ready to dispatch.

**Variation.** Add `as a QA-first workflow` if QA needs to be defined before development begins, or `with offshore handoff narrative` for distributed teams.

---

## Category 7: Craft & Workshop (Gandalf)

Gandalf is DZNR's craft layer. The 44 personally-authored skills cover polish, hardening, aesthetic recipes, immersive experience design, workshop facilitation, and the four-lens AI ethics framework. Call him directly when you need craft depth that Snape's brand work or Gibson's product work would not reach.

### 19. Polish pass

**Use case.** Accessibility, motion, and aesthetic refinement on a component, page, or artifact before it ships.

```
@dznr:gandalf:gandalf run a polish pass on [COMPONENT/PAGE/ARTIFACT: e.g.,
this React component, this landing page hero, this presentation slide].
Industry is [INDUSTRY]. Tighten accessibility (WCAG AA at minimum), motion
budget, focus order, type rhythm, and overall aesthetic refinement. Return
findings and the polished output.
```

**What you get.** Polished output. Specific craft moves named (tightened heading rhythm, pulled secondary CTA out of competition, etc.). WCAG AA compliance check. Motion budget verification.

**Variation.** Add `for high-contrast environments` if the surface needs WCAG AAA, or `with reduced motion` if accessibility takes priority over visual richness.

### 20. Apply a named aesthetic direction

**Use case.** Take a brand, component, or scene and apply a named aesthetic movement from Gandalf's aesthetic system.

```
@dznr:gandalf:gandalf apply the [AESTHETIC: Brutalism / Dark Luxe /
Wabi-Sabi / New Minimalism / Retro-Futurism / Solarpunk / Cyberpunk /
Swiss Modernism / Organic-Digital / Maximalism / Vaporwave / Biomimicry]
aesthetic to [SUBJECT: this component / this landing page / this brand
identity / this Three.js scene]. Industry is [INDUSTRY]. Return the
aesthetic spec, sample tokens, and the applied output.
```

**What you get.** Aesthetic specification (typography, color, spacing, motion). Sample tokens. Applied output rendered in the new aesthetic. Cross-medium consistency notes if the aesthetic spans multiple surfaces.

**Variation.** Add `as a compound aesthetic mixing [X] and [Y]` for hybrid directions, or `for [domain: UI / spatial / generative art / presentation]` to target a specific output surface.

### 21. Innovation Accelerator workshop

**Use case.** Run the 5-stage end-to-end client engagement framework. Takes a fuzzy idea to build-ready specification in two days plus pre-work. This is the one DZNR workflow where Gandalf orchestrates other subagents (Sherlock, Snape, Morpheus, Neo) as tools.

```
@dznr:gandalf:gandalf run an Innovation Accelerator for [CLIENT/PROJECT].
The fuzzy idea is [DESCRIBE THE IDEA]. Industry is [INDUSTRY],
sub-vertical [SUB-VERTICAL]. The team running it is [WHO]. The desired
outcome is [WHAT YOU WANT AT THE END: e.g., build-ready spec, board
approval, prototype scope].
```

**What you get.** Stage-by-stage IA execution: Prepare, Discover (Day 1), Define (Day 2), Synthesize, Build Handoff. Gandalf calls Sherlock for discovery, Snape for brand work, Morpheus for synthesis, Neo for build feasibility. Final deliverable is a build-ready specification.

**Variation.** Add `condensed to 1 day` for faster cycles, or `with synthetic audience validation built in` to pressure-test the concept against constructed personas mid-workshop.

### 22. Web 3D scene from a creative brief

**Use case.** Build an interactive 3D web scene (Three.js, React Three Fiber, shaders, post-processing) from a creative brief or narrative direction.

```
@dznr:gandalf:gandalf build a Three.js scene for [CLIENT/PROJECT]: [BRIEF:
e.g., a scroll-driven product hero, a generative particle field for a
campaign landing, an interactive 3D logo reveal]. Industry is [INDUSTRY].
Aesthetic direction: [DESCRIBE OR NAME]. Performance budget: [TARGET
DEVICE / FPS]. Deliver scene code, shaders if needed, and production notes.
```

**What you get.** Three.js or React Three Fiber scene code. Custom GLSL shaders if the brief calls for them. Performance optimization notes. Camera rig and lighting setup. Production handoff doc with stack rationale.

**Variation.** Add `with scroll-driven camera and post-processing` for editorial story-driven scenes, or `with WebGL fallback for low-power devices` if mobile is a target.

---

## Category 8: Specialist Arsenal (Snake Eyes)

Snake Eyes is silent by design. He deploys when explicitly named, runs the specialist cluster, returns findings, exits. Each cluster connects to a specific MCP family. Use him when you need a domain capability outside the eight-character cast.

**Available clusters:** SEO (searchfit-seo), PDF Tools (pdf-viewer), Adobe (adobe-for-creativity), Operations (operations), Legal (legal, often parked for design teams), Telemetry (product-tracking-skills), Bio Research (bio-research, often parked).

### 23. SEO audit and content strategy

**Use case.** Run the SEO cluster on a site or codebase. Covers technical SEO, content strategy, keyword clustering, schema markup, broken link checks, and AI visibility analysis (how the brand surfaces in ChatGPT, Claude, Gemini, Perplexity).

```
@dznr:snake-eyes:snake-eyes deploy the SEO cluster on [URL]. I need
[SEO AUDIT / CONTENT STRATEGY / KEYWORD CLUSTERING / SCHEMA MARKUP / AI
VISIBILITY ANALYSIS / BROKEN LINK CHECK]. Industry is [INDUSTRY]. Target
audience: [WHO]. Primary keywords or content goals: [WHAT].
```

**What you get.** Findings from the SEO cluster. Prioritized recommendations. Schema markup ready to paste. Content gap analysis. AI visibility report.

**Variation.** Add `compared against [COMPETITOR URL]` for competitive SEO, or `with content briefs for the top 5 opportunities` to get drafting kits alongside the audit.

### 24. PDF workflow

**Use case.** Fill forms, place signatures, merge or split documents, extract text or tables from PDFs at scale.

```
@dznr:snake-eyes:snake-eyes deploy the PDF Tools cluster on [PDF FILE OR
URL]. I need to [FILL THE FORM / SIGN AT FIELD X / MERGE WITH ANOTHER PDF
/ SPLIT INTO PAGES / EXTRACT TEXT TO CSV / ANNOTATE FOR REVIEW]. Output as
[PDF / CSV / TEXT].
```

**What you get.** Modified PDF or extracted data. Form filled with values you provided. Signature placed at the right field. Merged or split documents. Tabular extraction for downstream use.

**Variation.** Add `with a signing packet for multiple signers` for contract workflows, or `with bulk fill from this CSV` to populate forms at scale.

### 25. Adobe batch creative workflow

**Use case.** Process a folder of photos or videos through Adobe tools at scale. Designed for photographers, content teams, and social production work.

```
@dznr:snake-eyes:snake-eyes deploy the Adobe cluster on [FOLDER OR FILE].
I need [BATCH EDIT FOR COHESIVE LOOK / RETOUCH PORTRAITS / RESIZE FOR
SOCIAL PLATFORMS / RESIZE TO EXACT DIMENSIONS / DESIGN FROM TEMPLATE /
QUICK CUT VIDEO]. Style or target: [DESCRIBE LOOK OR SPEC]. Industry is
[INDUSTRY].
```

**What you get.** Batch-processed images or videos. Cohesive style across the set. Platform-optimized variants if requested. Direct file URLs and an in-chat preview grid. Optional Firefly Board link for client review.

**Variation.** Add `with Firefly board for client review` for stakeholder approval flow, or `prepare all of them for Instagram, LinkedIn, and TikTok` for multi-platform social production.

### 26. Operations runbook or status report

**Use case.** Generate operational documentation: runbooks, SOPs, status reports, change requests, capacity plans, vendor reviews, compliance tracking.

```
@dznr:snake-eyes:snake-eyes deploy the Operations cluster. I need [A
RUNBOOK FOR (PROCESS) / A STATUS REPORT FOR (PROJECT) / A CHANGE REQUEST
FOR (CHANGE) / A CAPACITY PLAN FOR (TEAM) / A VENDOR REVIEW FOR (VENDOR)
/ A COMPLIANCE TRACKING DOC FOR (REQUIREMENT)]. Audience: [WHO]. Cadence:
[WEEKLY / MONTHLY / ONE-TIME].
```

**What you get.** Production-ready ops document tailored to the audience and cadence. Risk flags. Escalation paths where appropriate. KPI structure if the doc is a status report.

**Variation.** Add `with KPIs from [DATA SOURCE]` for data-driven reports, or `with green-yellow-red status` for executive readability.

---

## Category 9: Specialty Connector Briefs

This category covers the tools that live outside DZNR's eight-character cast: video generators, voice production, AI IDEs, pattern libraries, presentation builders.

**Tools DZNR drives directly via active MCPs** (used inside other prompts, not here):

- Figma (cited across the library)
- Blender (Gandalf prompt 22 for 3D scene work)
- Adobe (Snake Eyes prompt 25 deploys the cluster)
- Magic Patterns (Snape calls it on-demand for brand work)
- Pencil (design file workflows)

**Tools DZNR generates a brief for** (you paste DZNR's output into the external tool):

- Generative video: Runway, Higgsfield, Pika, Kling (no MCPs available)
- Voice and audio: ElevenLabs (MCP available, pending DZNR integration)
- AI IDE pairing: Cursor, Windsurf, Codeium (no MCPs by design)
- Pattern research: Mobbin (pending DZNR MCP integration)
- Presentation generation: Gamma (MCP available, pending DZNR integration)
- Commerce: Shopify (MCP active, used inline during commerce audits)
- Design app handoff: Affinity Designer, Sketch (covered under prompt 16 by naming the tool in target platform)

As MCPs land for the brief-generation tools below, these prompts upgrade from brief-generation to direct invocation without changing how the team writes the prompt.

### 27. Generative video brief

**Use case.** DZNR produces a complete brief for AI video generation tools: shot list, camera direction, motion notes, the exact prompt you paste into the tool.

```
@dznr:morpheus:morpheus generate a video brief for [TOOL: Runway / Higgsfield
/ Pika / Kling] to produce [DESCRIBE VIDEO: e.g., a 10-second product hero,
a brand mood film, a campaign teaser]. Industry is [INDUSTRY]. Brand
reference: [LINK OR DESCRIPTION]. Aesthetic direction: [DESCRIBE]. Audio
direction: [DESCRIBE OR "no audio"]. Output: shot list, camera direction,
motion notes, and the exact prompt I paste into [TOOL].
```

**What you get.** Shot list. Camera direction. Motion vocabulary. Aesthetic specification. The exact paste-ready prompt for the chosen tool, calibrated to that tool's prompt syntax (Runway's style words vs Higgsfield's motion grammar).

**Variation.** Add `with three variant prompts so I can test approaches` to get A/B/C generations, or `as a 30-second sequence built from 3 shots` for longer-form storytelling.

### 28. Voice and audio production brief

**Use case.** DZNR writes the script with delivery notes and the ElevenLabs parameters (voice selection guidance, stability, style, pacing).

```
@dznr:morpheus:morpheus generate an ElevenLabs production brief for
[PROJECT/BRAND]. Content: [WHAT NEEDS VOICING: e.g., a 60-second brand
spot, character dialogue for an experience, narration for a product
video]. Industry is [INDUSTRY]. Voice direction: [DESCRIBE: e.g., warm
female narrator, gravelly conspirator, ambient voiceover]. Pacing:
[DESCRIBE]. Output: full script with delivery notes, voice selection
guidance, and ElevenLabs parameter recommendations.
```

**What you get.** Full script with line-by-line delivery notes (pause, emphasis, breath). Voice character profile to guide ElevenLabs voice selection. Suggested ElevenLabs parameters (stability, similarity, style exaggeration). Production notes for the recording session.

**Variation.** Add `with multiple voice candidates for A/B test` to spec out two or three voice options, or `with background music direction` to brief the audio bed alongside the voice.

### 29. Cursor build session brief

**Use case.** DZNR plans the work, Cursor implements it. Produces the `.cursorrules`, the system prompt for the Cursor agent, the task breakdown, and the validation checklist.

```
@dznr:neo:neo generate a Cursor build session brief for [PROJECT/FEATURE].
The work to do is [WHAT NEEDS BUILDING]. Stack is [STACK]. Industry is
[INDUSTRY]. I have [DESIGN ARTIFACTS / SPEC / REPO LINK]. Output: the
.cursorrules file, the system prompt for the Cursor agent, the task
breakdown in dependency order, and the validation checklist I run after
Cursor finishes.
```

**What you get.** Production-ready `.cursorrules` tuned to your stack. System prompt that gives Cursor the right scope and the right constraints (no package hallucination, install validation, no scope creep). Task breakdown in dependency order. Validation checklist you run before merging.

**Variation.** Add `with parallel agent strategy` if the work splits across two or three Cursor sessions, or `with test-first instructions` if you want Cursor writing the failing tests before the implementation.

### 30. Pattern research brief

**Use case.** Find production UI patterns for a feature, or research how leading apps solve a specific problem. Pulls from Mobbin-style pattern libraries.

```
@dznr:sherlock:sherlock generate a pattern research brief for [FEATURE /
INTERACTION PATTERN: e.g., a multi-step onboarding, an account
recovery flow, a content discovery surface]. Industry is [INDUSTRY].
Reference apps to study: [LIST: e.g., Linear, Notion, Hermès, Stripe].
Tool to search: [Mobbin / Dribbble / Behance / direct app screenshots].
Output: pattern variations observed, what each does well, what fails,
and the synthesized recommendation for our use case.
```

**What you get.** Pattern variations observed across the reference apps. Strengths and weaknesses per pattern. Synthesized recommendation grounded in the comparison. Annotated screenshots if available. Decision criteria for picking between patterns.

**Variation.** Add `for [FORM FACTOR: web / mobile / kiosk]` to constrain the search, or `with annotated screenshots saved as a reference doc` for stakeholder review.

### 31. Presentation generation brief (Gamma, Beautiful.ai, Pitch)

**Use case.** DZNR writes the full presentation structure and the paste-ready prompt for Gamma (or any AI presentation tool). The deck comes back from Gamma already on-brand because the prompt does the heavy lifting.

```
@dznr:morpheus:morpheus generate a Gamma presentation prompt for
[CLIENT/PROJECT]. Audience: [WHO]. Industry is [INDUSTRY]. Length:
[SLIDE COUNT or DURATION]. Narrative architecture: [DISCOVERY ARC /
VISION CAST / BURNING PLATFORM / RECOMMENDATION STACK or "let Morpheus
pick"]. Brand reference: [LINK OR DESCRIPTION]. Output: slide-by-slide
outline with speaker notes, the exact prompt I paste into Gamma, and
the visual direction guidance.
```

**What you get.** Slide-by-slide outline with speaker notes. The paste-ready Gamma prompt (or Beautiful.ai, Pitch, etc.) calibrated to that tool's structure. Visual direction guidance. Brand color and typography hints Gamma will respect.

**Variation.** Add `as a web pitch instead of slides` for high-context audiences who prefer to read, or `with theme reference to match [BRAND] aesthetic` to lock the visual language up front.

---

## Category 10: QKI Worldbuilding (Cheetara)

Cheetara owns aesthetic-first serialized-world asset generation using the QKI (Quantum Kinetic Ink) engine. Every asset (character, place, object) is drawn art with a fixed style DNA and a swappable world pack. She loads the engine first, resolves the active pack, dispatches the right generator, enforces the Prime Gate on every render, and writes the asset manifest.

**Before you can generate:** a world pack must exist. If you have no pack yet, run prompt 35 (New QKI World Pack) first. If you already have a pack (F&A is the reference pack), skip to 32, 33, or 34.

### 32. Create a QKI character

**Use case.** Generate a character node plus the full character sheet (hero, turnaround, expressions, motion states) in QKI style, with a Higgsfield Soul Character identity lock for serialized-world consistency.

```
@dznr:cheetara:cheetara create a [FACTION] character in QKI. Pack:
[PACK NAME, e.g., Friends-and-Anarchists / F&A]. Role: [DESCRIBE, e.g.,
warrior, ritualist, elder, defector]. Motion states needed: [LIST, e.g.,
idle, combat, ritual, dialogue]. Identity lock: [YES for recurring
character / NO for one-off].
```

**What you get.** Character node record. MidJourney hero prompt with QKI sref anchor (you drop the keeper in `inbox/character/`). Higgsfield Soul Character registration + `--cref` capture if identity lock is YES. Full sheet (turnaround, expression sheet, motion-state key poses) composited in Weavy. Manifest entry with pack, faction, motion states, layer, source tool, and identity lock reference.

**Variation.** Add `background-tier only` for non-hero characters (skips identity lock, single sheet), or `with faction material override` if the character carries a specific material treatment beyond the pack default.

### 33. Create a QKI place

**Use case.** Generate an environment, location, cityscape, or building in QKI, with Layer 1 (spatial framework and camera) blocked in Blender MCP first and the drawn establishing shot layered on top.

```
@dznr:cheetara:cheetara create a [PLACE TYPE, e.g., contested Tier 2
site, faction stronghold, ritual chamber, urban district] in QKI. Pack:
[PACK NAME]. Faction control: [WHICH FACTION or CONTESTED]. Camera
direction: [DESCRIBE or "wide establishing"]. Detail views needed:
[LIST, e.g., interior, alternate lighting, night version].
```

**What you get.** Location node record. Blender MCP block-out of Layer 1 (spatial framework + camera). MidJourney establishing shot with QKI sref anchor and the pack overrides. Higgsfield reference element registered for the location. Detail views generated per the list. Manifest entry with pack, faction, tier, layer, and location lock reference.

**Variation.** Add `with faction-overlay variants for [OTHER FACTIONS]` when the location changes hands across the narrative, or `as a level blockout for real-time engine` when the place needs to exist in the experience layer, not just as concept art.

### 34. Design a QKI hero object

**Use case.** Generate a hero-tier vehicle, weapon, or prop in QKI style with orthographic angles, detail callouts, and an optional 3D-ready mesh via Weavy (Tripo / Meshy).

```
@dznr:cheetara:cheetara design a [FACTION] [OBJECT TYPE, e.g., sidearm,
transport, ritual implement] in QKI. Pack: [PACK NAME]. Material
language: [DESCRIBE, e.g., worn metal, ceremonial lacquer, exposed
mechanism]. Tier: [HERO for identity-locked recurring object / BACKGROUND
for one-off prop]. Mesh: [YES if needs to exist in the experience layer
/ NO for drawn only].
```

**What you get.** Object node record. MidJourney hero design with QKI sref anchor and the faction material overrides. Orthographic angles and detail callouts. Higgsfield reference element registered if HERO tier. Weavy Tripo / Meshy mesh generation if mesh is YES. Manifest entry with pack, faction, material, tier, and mesh reference.

**Variation.** Add `with a companion variant for [OTHER FACTION]` when the object appears in modified form across factions, or `with in-hand pose` for weapons and tools that need to be seen wielded by a character.

### 35. New QKI World Pack setup

**Use case.** Author a new world pack (palette + factions + temperament) so future QKI generation can render against it. Required prerequisite before Chain 8 (asset generation) can run for a new world.

```
@dznr:cheetara:cheetara set up a new QKI world pack. World name: [NAME].
Faction seeds: [LIST, e.g., Wound Keeper (grief-based ritualists),
Synthesis (retrofit tech collective), The Order (quiet enforcers)].
Palette direction: [DESCRIBE OR UPLOAD moodboard / colour list / brand
reference]. Temperament per faction: [DESCRIBE OR "let Snape extract"].
```

**What you get.** Validated pack file at `packs/<pack-id>.md` following the qki-style-authority pack schema. Palette per faction, material temperament per faction, motion state overrides if any, sref override if the pack calls for one. Pack set active in project memory so Chain 8 can proceed immediately. Snape called for palette extraction if the input is a moodboard or brand reference.

**Variation.** Add `with critique before I confirm` to route the drafted pack through Gandalf for a taste pass first, or `import from [BRAND URL]` to extract the palette and temperament from an existing brand as the starting point.

---

## A few patterns worth knowing

**Compound requests trigger DZNR's compound dispatch.** If you ask for two or more things in one prompt (`audit and pitch`, `decode and theme`, `spec and scaffold`), Tár builds a phased plan, asks scope questions if needed, then dispatches across multiple subagents and delivers everything together.

**Industry tags propagate.** Name the industry in your first prompt. Sherlock sets the tag in project memory. Every subagent reads the tag and adjusts defaults. You do not need to re-state it on every prompt in the same session.

**Direct subagent invocation is available for power users.** When you know exactly who you want, skip Tár and call the subagent directly:

```
@dznr:gandalf:gandalf polish this React component for accessibility
@dznr:sherlock:sherlock audit https://example.com
@dznr:morpheus:morpheus write a launch narrative from these inputs
```

**The visibility narration is the feature.** At each handoff DZNR announces who is working and what they are doing in that character's voice. Watch the orchestration happen, not just the final output.

---

## Asking for more prompts

Send a request to Kevin or open an issue on the DZNR repo. The library will grow as the team identifies workflows that recur. v2 of this library will incorporate the patterns the team actually asks for.

## Where this document lives

- Markdown source: `docs/PROMPT_LIBRARY.md` in the DZNR repo
- HTML interactive version: `docs/prompt-library.html`, openable in any browser

Both ship from the same source on every release.
