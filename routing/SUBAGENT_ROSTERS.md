# DZNR Subagent Rosters

**Locked:** 2026-05-18
**Architecture:** DZNR Agent (front door) → Tár (orchestrator) → 5 specialist subagents → skills → artifacts
**Source:** Confirmed against Kevin's FigJam board (DZNR-AGENT)

---

## The cast

| Character | Subagent | Domain | Skill count |
|-----------|----------|--------|-------------|
| **Tár** | Orchestrator | Routing, memory, tempo | 8 |
| **Snape** | Brand & Design Systems + Clarifier | Identity + visual scaffolding. Also voices Tár's clarifications. | 32 |
| **Sherlock** | Discovery & Research | Reading the world, finding patterns | 22 |
| **Gibson** | Experience Engineering + AI Product | Immersive, 3D, spatial, AI-driven futures | 22 |
| **Neo** | Delivery & Code | Specs, components, ship it | 24 |
| **Morpheus** | Pitch & Story | Present, persuade, narrate | 19 |
| **Gandalf** | Workshop (peer + tool + orchestrator) | Kevin's personal craft + Innovation Accelerator pack. Called by Tár OR by other subagents. Orchestrates other subagents for IA (documented exception). | 44 |
| **Cheetara** | QKI Worldbuilding | Aesthetic-first serialized-world asset generation. Engine + three generators + manifest contract. Prime Gate enforced. Coordinates MidJourney, Higgsfield, Weavy, Blender MCP. | 4 |
| **Snake Eyes** | Parked specialist arsenal | Silent. Deployed by name. Soft-routed for SEO. | ~55 |

**Total skills routed through DZNR (Tár → 6 active subagents):** ~165
**Total skills in Snake Eyes' arsenal (parked, callable by name):** ~55
**Total skills in Gandalf's workshop:** 38 (already counted in 162 above)

---

## Tár — Orchestrator

**Archetype:** Lydia Tár, the conductor. Commands tempo. Decides who plays when. The brain that holds the score in her head and signals the entrance.

**Role:** Receives the user request from the DZNR front door, consults memory, decides which subagent (or combination) handles it, monitors the work, returns the artifact.

**Skills:**

| Skill | Source | Purpose |
|-------|--------|---------|
| orchestrator | anthropic-skills | The routing brain — checks memory, proposes skill chains |
| memory-management | productivity | Two-tier memory system for context across conversations |
| consolidate-memory | anthropic-skills | Reflective pass over memory files, merge duplicates |
| task-management | productivity | TASKS.md tracking commitments |
| update | productivity | Sync tasks and refresh memory |
| productivity-start | productivity (renamed) | Initialize the productivity dashboard |
| schedule | anthropic-skills | Create scheduled tasks |
| setup-cowork | anthropic-skills | Guided Cowork setup |

**Trigger keywords:** every user request goes through Tár first. She decides whether to handle it herself or delegate.

---

## Snape — Brand & Design Systems

**Archetype:** Master of dark arts. Precision under pressure. The alchemist who mixes exact proportions of voice, identity, and visual scaffolding into something that feels both classical and modern.

**Role:** Owns everything related to how a brand looks, sounds, and behaves — from raw identity creation to component-level design system architecture. Handles brand voice, design tokens, themes, and the visual language scaffolding that the rest of the team builds on top of.

**Skills (32 total):**

### Brand & Voice (12)
| Skill | Source |
|-------|--------|
| brand-from-scratch | anthropic-skills |
| brand-guidelines | anthropic-skills |
| brand-voice-enforcement | brand-voice plugin |
| brand-review | marketing plugin |
| guideline-generation | brand-voice plugin |
| discover-brand | brand-voice plugin |
| design-language | anthropic-skills |
| aesthetic-system | anthropic-skills |
| frontend-aesthetics | anthropic-skills |
| ux-copy | design plugin |
| draft-content | marketing plugin |
| content-creation | marketing plugin |

### Design Systems & UI (12)
| Skill | Source |
|-------|--------|
| design-systems | anthropic-skills |
| ds-theming | anthropic-skills |
| ds-documentation | anthropic-skills |
| design-system | design plugin |
| design-critique | design plugin |
| design-handoff | design plugin |
| accessibility-review | design plugin |
| wireframe | anthropic-skills |
| theme-factory | anthropic-skills |
| canvas-design | anthropic-skills |
| svg-generative | anthropic-skills |
| algorithmic-art | anthropic-skills |

### Figma Integration (8)
| Skill | Source |
|-------|--------|
| figma-use | figma plugin |
| figma-use-figjam | figma plugin |
| figma-create-new-file | figma plugin |
| figma-generate-design | figma plugin |
| figma-generate-diagram | figma plugin |
| figma-generate-library | figma plugin |
| figma-code-connect | figma plugin |
| generate-project-plan | figma plugin (workflow) |

**Workshop skills Snape commonly CALLS Gandalf for:**
frontend-design, design-taste-frontend, ui-ux-pro-max, high-end-visual-design, stitch-design-taste, gpt-taste, baseline-ui, industrial-brutalist-ui, minimalist-ui, typeset, colorize, bolder, brandkit, polish, redesign-existing-projects

(These belong to Gandalf's roster — Snape pulls Gandalf in when needed.)

**Trigger keywords:** brand, identity, voice, tone, design system, components, tokens, theme, visual language, Figma, audit a design, design language, brand voice, brand-from-scratch.

---

## Sherlock — Discovery & Research

**Archetype:** Observation. Deduction. Sees the patterns others miss. Reads the room before speaking. Gathers evidence before opining.

**Role:** Owns the input side of any project: research, audits, competitive analysis, user understanding, opportunity mapping. Sherlock arrives first, scopes the problem, surfaces the truths, and hands findings to the right subagent. Never builds — only investigates and synthesizes.

**Skills (22 total):**

### Discovery & Brief (6)
| Skill | Source |
|-------|--------|
| idea-to-brief | anthropic-skills |
| discovery | anthropic-skills |
| site-audit | anthropic-skills |
| ux-taxonomy | anthropic-skills |
| hcd-heuristics | anthropic-skills |
| hcd-ai-design | anthropic-skills |

### Research & Synthesis (8)
| Skill | Source |
|-------|--------|
| user-research | design plugin |
| research-synthesis | design plugin |
| synthesize-research | product-management plugin |
| synthetic-audience | anthropic-skills |
| product-brainstorming | product-management plugin |
| journey-mapping | anthropic-skills |
| communications | anthropic-skills |
| internal-comms | anthropic-skills |

### Competitive & Market (3)
| Skill | Source |
|-------|--------|
| competitive-brief-pm | product-management plugin (DZNR-renamed) |
| competitive-brief-marketing | marketing plugin (DZNR-renamed) |
| campaign-plan | marketing plugin |

### Search & Knowledge (5)
| Skill | Source |
|-------|--------|
| search | enterprise-search plugin |
| search-strategy | enterprise-search plugin |
| knowledge-synthesis | enterprise-search plugin |
| source-management | enterprise-search plugin |
| digest | enterprise-search plugin |

**Workshop skills Sherlock commonly CALLS Gandalf for:**
critique, audit, distill, extract, clarify, normalize

(These belong to Gandalf's roster — Sherlock pulls Gandalf in when needed.)

**Trigger keywords:** research, audit, discover, find, investigate, understand, who is, what do users want, competitive, opportunity, brief, idea-to-brief, journey map, persona, synthesize, search.

---

## Gibson — Experience Engineering & AI Product

**Archetype:** William Gibson. Sees the near-future already arriving. Builds the speculative thing that pulls reality forward. Cyberpunk pragmatist — equally at home with shaders and system prompts.

**Role:** Owns immersive experience design, 3D, generative visuals, AI product architecture, and the AI-driven outputs that live inside experiences. Gibson handles everything where the medium is the message — where the experience itself is the product. Bridges the imagination side (immersive narrative) with the engineering side (AI architecture).

**Skills (22 total):**

### Experience Engineering (8)
| Skill | Source |
|-------|--------|
| 3d-experience-design | anthropic-skills |
| immersive-experience-design | anthropic-skills |
| live-experience | anthropic-skills |
| experience-output-design | anthropic-skills |
| webgl-threejs | anthropic-skills |
| web-animation | anthropic-skills |
| journey-mapping | anthropic-skills (shared with Sherlock) |
| journey-mapping | anthropic-skills |

### AI Product (6)
| Skill | Source |
|-------|--------|
| ai-product-architecture | anthropic-skills |
| ai-product-prompting | anthropic-skills |
| thoughtful-ai-output | anthropic-skills |
| mcp-builder | anthropic-skills |
| prompt-iteration | anthropic-skills |
| skill-creator | anthropic-skills |

### Creative Tech & Generative (5)
| Skill | Source |
|-------|--------|
| web-artifacts-builder | anthropic-skills |
| theme-factory | anthropic-skills (shared with Snape) |
| svg-generative | anthropic-skills (shared with Snape) |
| algorithmic-art | anthropic-skills (shared with Snape) |
| canvas-design | anthropic-skills (shared with Snape) |

### Generative Media Production (3, Kevin-authored, routed to Gibson)
| Skill | Source |
|-------|--------|
| seedance-director | kevin-authored (workshop folder) |
| seedance-shotlist-director | kevin-authored (workshop folder) |
| game-studio | kevin-authored (workshop folder) |

These three are Kevin-authored skills physically in `skills/workshop/` but routed to Gibson, not Gandalf. game-studio uses the Higgsfield MCP (ACTIVE).

**Workshop skills Gibson commonly CALLS Gandalf for:**
image-to-code, imagegen-frontend-web, imagegen-frontend-mobile, animate, delight, overdrive, full-output-enforcement

(These belong to Gandalf's roster — Gibson pulls Gandalf in when needed.)

**Trigger keywords:** immersive, 3D, experience, world-building, AI product, agent, system prompt, generative, shader, three.js, WebGL, narrative arc, real-time, interactive installation, near-future, AI character, NPC, Seedance, video prompt, shotlist, game studio, build a game, browser game.

**Note:** Some skills (theme-factory, svg-generative, algorithmic-art, canvas-design, journey-mapping) are shared between Snape and Gibson. Tár routes based on context — if the work is about brand identity, Snape gets it. If it's about an immersive/AI experience, Gibson gets it.

---

## Neo — Delivery & Code

**Archetype:** The one who sees the code. Bends reality through implementation. The "make it real" subagent that turns specs into shipping software.

**Role:** Owns specs, code generation, QA, repo scaffolding, engineering documentation, and the full delivery pipeline across any platform (Sitecore, Salesforce, AEM, generic React/Next/Vue, native mobile, static sites, backend services). Neo is where the work goes when it is time to actually build and ship.

**Skills (24 total):**

### Specs, stories, validation, and CMS delivery (8)
| Skill | Source |
|-------|--------|
| xcm-spec-generator | anthropic-skills |
| xcm-user-stories | anthropic-skills |
| xcm-component-gen | anthropic-skills |
| xcm-context-package | anthropic-skills |
| xcm-validation | anthropic-skills |
| qa-handoff | anthropic-skills |
| product-playbook | anthropic-skills |
| aem | anthropic-skills |

### Engineering & Code (8)
| Skill | Source |
|-------|--------|
| repo-scaffold | anthropic-skills |
| code-review | anthropic-skills |
| system-design | engineering plugin |
| testing-strategy | engineering plugin |
| documentation | engineering plugin |
| tech-debt | engineering plugin |
| standup | engineering plugin |
| incident-response | engineering plugin |

### Code Connection (1)
| Skill | Source |
|-------|--------|
| figma-code-connect | figma plugin (shared with Snape) |

### Workshop remediation skills Neo CALLS Gandalf for
| Skill | Owner |
|-------|-------|
| harden | Gandalf |
| polish | Gandalf |
| optimize | Gandalf |
| fixing-accessibility | Gandalf |
| fixing-metadata | Gandalf |
| fixing-motion-performance | Gandalf |
| adapt | Gandalf |

(These belong to Gandalf's roster — Neo pulls Gandalf in mid-work.)

**Trigger keywords:** code, build, scaffold, spec, generate component, XM Cloud, Sitecore, LWC, Salesforce, code review, PR review, test plan, tech debt, ship, deploy, harden, optimize, fix accessibility.

---

## Morpheus — Pitch & Story

**Archetype:** The teacher. The guide. Shows the door. Translates the work into a story that gets a yes. Whether it's a pitch, a presentation, a stakeholder update, or a campaign — Morpheus packages and presents.

**Role:** Owns everything outbound: pitches, decks, presentations, marketing campaigns, stakeholder communications, status reports, and the documents that carry the work into the world. Morpheus is the bridge between what the team built and the audience that needs to receive it.

**Skills (19 total):**

### Pitch & Presentation (6)
| Skill | Source |
|-------|--------|
| pitch | anthropic-skills |
| pitch-script | anthropic-skills |
| presentation-storytelling | anthropic-skills |
| pptx | anthropic-skills |
| docx | anthropic-skills |
| xlsx | anthropic-skills |

### Marketing & Campaigns (5)
| Skill | Source |
|-------|--------|
| email-sequence | marketing plugin |
| performance-report | marketing plugin |
| seo-audit (marketing version) | marketing plugin |
| brand-review | marketing plugin (shared with Snape) |
| content-creation | marketing plugin (shared with Snape) |

### Stakeholder & Status (4)
| Skill | Source |
|-------|--------|
| stakeholder-update | product-management plugin |
| roadmap-update | product-management plugin |
| status-report | operations plugin |
| metrics-review | product-management plugin |

### Documents & Files (4)
| Skill | Source |
|-------|--------|
| pdf | anthropic-skills |
| view-pdf | pdf-viewer plugin |
| doc-coauthoring | anthropic-skills |
| write-spec | product-management plugin |

**Workshop skills Morpheus commonly CALLS Gandalf for:**
onboard, teach-impeccable, quieter

(These belong to Gandalf's roster — Morpheus pulls Gandalf in when needed.)

**Trigger keywords:** pitch, deck, presentation, slides, story, narrative, campaign, stakeholder, status, update, report, write a doc, email sequence, marketing, persuade.

---

## Gandalf — Workshop (peer + tool)

**Archetype:** The wizard who has been around forever. Knows things others don't. Arrives precisely when he means to. Mentor energy. Cross-cutting craftsman.

**Role:** Owns Kevin's 38 personally-authored workshop skills from `~/.claude/skills/`. Operates two ways simultaneously:

1. **As peer subagent:** Tár routes directly to Gandalf when the trigger is workshop-specific (e.g. "use design-taste-frontend", "harden this", "polish this output").
2. **As a tool:** Other subagents pull Gandalf in mid-work when they need one of his specific tools. Snape doing brand work calls Gandalf for `design-taste-frontend`. Neo doing code work calls Gandalf for `harden`. Gibson doing experience work calls Gandalf for `imagegen-frontend-web`.

**Override authority:** When a workshop skill overlaps with a plugin or anthropic-core skill, Gandalf's version wins. Kevin's `frontend-design` beats any plugin version.

### Skills (38 total) — Gandalf's full roster

#### Design taste (6)
| Skill |
|-------|
| design-taste-frontend |
| gpt-taste |
| ui-ux-pro-max |
| high-end-visual-design |
| stitch-design-taste |
| frontend-design |

#### Aesthetic recipes (7)
| Skill |
|-------|
| baseline-ui |
| industrial-brutalist-ui |
| minimalist-ui |
| brandkit |
| typeset |
| colorize |
| bolder |

#### Image to code / generation (3)
| Skill |
|-------|
| image-to-code |
| imagegen-frontend-web |
| imagegen-frontend-mobile |

#### Animation / motion (3)
| Skill |
|-------|
| animate |
| delight |
| overdrive |

#### Code remediation (7)
| Skill |
|-------|
| harden |
| polish |
| optimize |
| fixing-accessibility |
| fixing-metadata |
| fixing-motion-performance |
| adapt |

#### Critical thinking (7)
| Skill |
|-------|
| critique |
| audit |
| distill |
| extract |
| clarify |
| normalize |
| redesign-existing-projects |

#### Meta / process (5)
| Skill |
|-------|
| onboard |
| teach-impeccable |
| quieter |
| arrange |
| full-output-enforcement |

**Trigger keywords (full list in TRIGGERS.md):** workshop skill names, verbs like harden/polish/optimize/clarify/distill, outcome phrases like "give this taste," "make this feel high-end," "redesign this."

**When other subagents call Gandalf:**
- Snape calls Gandalf for design-taste, aesthetic recipes, brandkit
- Neo calls Gandalf for harden, polish, optimize, fixing-* skills
- Gibson calls Gandalf for imagegen-* skills, animate, delight
- Sherlock calls Gandalf for critique, audit, distill, extract
- Morpheus calls Gandalf for onboard, teach-impeccable, quieter

---

## Cheetara: QKI Worldbuilding

**Archetype:** Fast, precise, sensor-based warrior. Moves through the generation pipeline at speed, feels aesthetic drift before it fully surfaces, and strikes the Prime Gate the moment a render tries to sneak in where a drawn layer belongs. Operator, not artist.

**Role:** Owns the QKI (Quantum Kinetic Ink) cluster. Aesthetic-first serialized-world asset generation across characters, places, and objects. Loads the QKI style engine before any generator runs. Resolves the active world pack from context (via Snape clarifier if ambiguous). Coordinates external tools (MidJourney for hero 2D, Higgsfield for identity lock, Weavy for sheet compositing and mesh generation, Blender MCP or Unreal MCP for Layer 1 spatial framework). Writes to the shared asset manifest as the seam between generation and assembly.

**Skills (4 total, plus 1 shared contract):**

### Engine (1)

| Skill | Source | Purpose |
|-------|--------|---------|
| qki-style-authority | anthropic-skills | The canonical QKI style engine. Fixed DNA (four-layer render model, linework law, Prime Gate). Loads the active world pack. Read FIRST on every asset. |

### Generators (3)

| Skill | Source | Purpose |
|-------|--------|---------|
| qki-character-generator | anthropic-skills | Character node + sheet (hero, turnaround, expressions, motion states). Registers Higgsfield Soul Character for identity lock. |
| qki-place-generator | anthropic-skills | Environments, locations, cityscapes, buildings. Layer 1 first (Blender MCP or Unreal MCP), then drawn QKI establishing art on top. |
| qki-object-generator | anthropic-skills | Vehicles, weapons, props. Material-led. Hero design + orthographic angles. Optional Weavy Tripo / Meshy mesh for 3D-ready objects. |

### Shared contract (not a callable skill)

| File | Purpose |
|------|---------|
| qki-asset-pipeline/asset-manifest-schema.md | The seam. Shared record schema every generator writes to and every downstream assembly stage (Gibson, Neo) reads from. |

**Workshop skills Cheetara commonly CALLS Gandalf for:**
design-taste-frontend, gpt-taste, high-end-visual-design, critique

(These belong to Gandalf's roster. Cheetara pulls Gandalf in mid-work for aesthetic taste passes on sheets before manifest write.)

**Trigger keywords:** create a character, character sheet, worldbuilding, world pack, faction, QKI, Quantum Kinetic Ink, populate the world, build the faction, hero object, hero character, hero prop, establishing shot, cityscape, environment, contested site, Wound Keeper, Synthesis, Friends and Anarchists, F&A, drawn art, graphic novel, sref anchor, Soul Character, Prime Gate, add to the world.

**MCP dependencies:**
- MidJourney (human-in-the-loop, no MCP)
- Higgsfield (MCP ACTIVE per v1.14.0)
- Weavy / Figma Weave (cloud, no MCP)
- Blender MCP (ACTIVE when Blender is running locally)
- Unreal MCP (UE 5.8 experimental, alternative to Blender)
- Local ComfyUI (optional, free mesh iteration)

**Cross-subagent relationships:**
- **Upstream (feeds Cheetara):** Sherlock's `idea-to-brief` and `discovery` for world concept; Gibson's `immersive-experience-design` for the world architecture that determines which assets to build.
- **Downstream (reads Cheetara's manifest):** Gibson's `3d-experience-design`, `webgl-threejs`, `live-experience` for experience layer instantiation; Neo's `repo-scaffold` and `qa-handoff` for shipping.

---

## Snake Eyes — Specialist Arsenal (parked, not auto-routed by Tár)

**Archetype:** Silent operator. Master of every weapon in the case. Doesn't speak — gets deployed when the situation calls for the exact, precise tool. Never the default, always the specialist.

**Role:** These skills stay installed and explicitly callable, but Tár doesn't route to them automatically. They live in a separate roster because they're either off-domain (bio-research), require deliberate invocation (legal, telemetry), or are coherent specialist toolkits that the user calls directly by name. Snake Eyes is summoned by name, never assumed.

### Bio Research (6) — off-domain for Kevin
instrument-data-to-allotrope, nextflow-development, scientific-problem-selection, scvi-tools, single-cell-rna-qc, bio-research-start

### Legal (9) — separate concern
brief, compliance-check, legal-response, legal-risk-assessment, meeting-briefing, review-contract, signature-request, triage-nda, vendor-check

### Product Tracking (7) — telemetry/analytics, call explicitly
product-tracking-audit-current-tracking, product-tracking-business-case, product-tracking-design-tracking-plan, product-tracking-generate-implementation-guide, product-tracking-implement-tracking, product-tracking-instrument-new-feature, product-tracking-model-product

### Operations (9) — process/compliance ops
capacity-plan, change-request, compliance-tracking, process-doc, process-optimization, risk-assessment, runbook, vendor-review, status-report (shared with Morpheus)

### Adobe for Creativity (6) — Adobe-specific tooling
adobe-batch-edit-photos, adobe-create-social-variations, adobe-design-from-template, adobe-edit-quick-cut, adobe-resize-photos-and-videos, adobe-retouch-portraits

### SearchFit SEO (11) — coherent SEO toolkit
ai-visibility, broken-links, content-brief, content-strategy, content-translation, internal-linking, keyword-clustering, on-page-seo, schema-markup, seo-audit (searchfit version), technical-seo

### Data (10) — analytics-specific
analyze, build-dashboard, create-viz, data-context-extractor, data-visualization, explore-data, sql-queries, statistical-analysis, validate-data, write-query

### Other / Misc
schedule (handled by Tár), setup-cowork (handled by Tár), cowork-plugin-customizer, create-cowork-plugin

---

## Routing rules for Tár

See TRIGGERS.md for the full algorithm. Summary:

1. **Check memory first** — has this project/domain been touched before?
2. **Scan for explicit Snake Eyes invocation** — user names a specialist skill → deploy directly.
3. **Match primary trigger keywords** across all 7 active subagents.
4. **Apply disambiguation defaults:** "design" → Snape, "audit" → Sherlock, "SEO" → Snake Eyes (soft route)
5. **If ambiguous after defaults** → Snape voices a clarifying question (terse, precise, slightly impatient)
6. **Mid-chain Gandalf calls** — any subagent can pull Gandalf in for workshop skills they need
7. **Handoff inference** — Tár listens for "I'm good" / "ready for next phase" OR infers and asks

### Standard chain flows
- **Discovery flow:** Sherlock → Snape OR Gibson (Snape clarifies if ambiguous) → Neo (with Gandalf for polish/harden) → Morpheus
- **Brand build flow:** Sherlock → Snape (calls Gandalf for taste/polish) → Neo → Morpheus
- **Experience build flow:** Sherlock → Gibson (calls Gandalf for imagegen) → Neo → Morpheus
- **Delivery flow:** Sherlock → Snape → Neo (calls Gandalf for harden) → Morpheus
- **SEO flow:** Snake Eyes (audit/keyword work) OR Morpheus (content) — Snape clarifies if ambiguous

---

## Shared skills (cross-subagent)

Some skills serve multiple domains. Tár disambiguates by context:

| Skill | Owners | Disambiguation |
|-------|--------|----------------|
| journey-mapping | Sherlock + Gibson | Sherlock for customer/user journeys, Gibson for spatial/immersive journeys |
| theme-factory | Snape + Gibson | Snape for brand themes, Gibson for experiential themes |
| svg-generative | Snape + Gibson | Snape for brand visual systems, Gibson for generative art/experience |
| algorithmic-art | Snape + Gibson | Same split as above |
| canvas-design | Snape + Gibson + Morpheus | Snape for brand posters, Gibson for experiential, Morpheus for pitch visuals |
| brand-review | Snape + Morpheus | Snape for system-level voice work, Morpheus for outbound content review |
| content-creation | Snape + Morpheus | Snape for voice-defining content, Morpheus for campaign content |
| status-report | Morpheus + Snake Eyes | Morpheus for outbound stakeholder version, Snake Eyes (ops) for internal version |
| figma-code-connect | Snape + Neo | Snape for design-side, Neo for code-side |

---

## What's next

1. ✅ DECISIONS.md — locked collision resolutions
2. ✅ SUBAGENT_ROSTERS.md — this doc, locked subagent assignments
3. 🔄 FigJam board annotation — add skill counts and legend
4. ⏭ Migration script (dry-run) — physically organize skills into DZNR repo structure
5. ⏭ Repo scaffold — folder layout matching this roster
6. ⏭ Start Subagent 1 build (recommend Tár first as the orchestrator, then Neo for delivery work)
