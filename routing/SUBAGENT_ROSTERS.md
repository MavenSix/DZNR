# DZNR Subagent Rosters

**Locked:** 2026-05-18
**Architecture:** DZNR Agent (front door) → Tár (orchestrator) → 5 specialist subagents → skills → artifacts
**Source:** Confirmed against Kevin's FigJam board (DZNR-AGENT)

---

## The cast

| Character | Subagent | Domain | Skill count |
|-----------|----------|--------|-------------|
| **Tár** | Orchestrator | Routing, memory, tempo | 10 |
| **Snape** | Brand & Design Systems + Clarifier | Identity + visual scaffolding, the style library and Kevin's taste profile. Also voices Tár's clarifications. | 35 |
| **Sherlock** | Discovery & Research | Reading the world, finding patterns | 25 |
| **Gibson** | Experience Engineering + AI Product | Immersive, 3D, spatial, AI-driven futures; world-not-a-page sites for Pulse OS | 35 |
| **Neo** | Delivery & Code | Specs, components, ship it | 26 |
| **Morpheus** | Pitch & Story | Present, persuade, narrate | 19 |
| **Gandalf** | Workshop (peer + tool + orchestrator) | Kevin's personal craft + Innovation Accelerator pack, and the quality standard and gate every asset passes. Called by Tár OR by other subagents. Orchestrates other subagents for IA (documented exception). | 48 |
| **Cheetara** | QKI and Author Worldbuilding | Aesthetic-first serialized-world asset generation. Resolves the engine first: QKI (engine + three generators + manifest contract, Prime Gate enforced) for a named QKI pack, the author-world engine (author's approved pack, Fidelity Gate) for an author's world, which is the default for Pulse OS jobs and anything naming no QKI pack, with the lore engine (canon, consistency check, canon questions) under it. Coordinates MidJourney, Higgsfield, Weavy, Blender MCP. Also the style, world-pack, series-bible and motion-clip stages of the video, narrative and Pulse OS workflows, Three.js for worlds that run in the browser, and Wan 3.0 shot briefs. Most asset steps of the quality standard. | 7 + 22 shared |
| **Snake Eyes** | Parked specialist arsenal | Silent. Deployed by name. Soft-routed for SEO. Twelve clusters plus Other/Misc. | ~141 |

**Total skills routed through DZNR (Tár to 8 active subagents including Cheetara):** ~176
**Total skills in Snake Eyes' arsenal (parked, callable by name):** ~141
**Total skills in Gandalf's workshop:** 48 (already counted in the active total above)
**Grand total available across DZNR (active + parked, minus duplicates):** ~300+

---

## Tár: Orchestrator

**Archetype:** Lydia Tár, the conductor. Commands tempo. Decides who plays when. The brain that holds the score in her head and signals the entrance.

**Role:** Receives the user request from the DZNR front door, consults memory, decides which subagent (or combination) handles it, monitors the work, returns the artifact.

**Skills:**

| Skill | Source | Purpose |
|-------|--------|---------|
| orchestrator | anthropic-skills | The routing brain: checks memory, proposes skill chains |
| memory-management | productivity | Two-tier memory system for context across conversations |
| consolidate-memory | anthropic-skills | Reflective pass over memory files, merge duplicates |
| import-memory | anthropic-skills | Import a memory export from another AI assistant (Cursor, ChatGPT, etc.) into Claude's memory |
| task-management | productivity | TASKS.md tracking commitments |
| update | productivity | Sync tasks and refresh memory |
| productivity-start | productivity (renamed) | Initialize the productivity dashboard |
| schedule | anthropic-skills | Create scheduled tasks |
| setup-cowork | anthropic-skills | Guided Cowork setup |
| explain-usage | anthropic-skills | Explain where the session's tokens went with a plain-language chart |

**Trigger keywords:** every user request goes through Tár first. She decides whether to handle it herself or delegate.

---

## Snape: Brand & Design Systems

**Archetype:** Master of dark arts. Precision under pressure. The alchemist who mixes exact proportions of voice, identity, and visual scaffolding into something that feels both classical and modern.

**Role:** Owns everything related to how a brand looks, sounds, and behaves: from raw identity creation to component-level design system architecture. Handles brand voice, design tokens, themes, and the visual language scaffolding that the rest of the team builds on top of.

**Skills (32 total):**

### Brand & Voice (12)
| Skill | Source |
|-------|--------|
| brand-from-scratch | anthropic-skills |
| brand-guidelines | anthropic-skills |
| brand-voice-enforcement | brand-voice plugin |
| brand-review | marketing plugin |
| guideline-generation | brand-voice plugin |
| discover-brand | brand-voice plugin (shared with Sherlock) |
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

### Figma Integration (9)
| Skill | Source |
|-------|--------|
| figma-use | figma plugin |
| figma-use-figjam | figma plugin |
| figma-create-new-file | figma plugin |
| figma-generate-design | figma plugin |
| figma-generate-diagram | figma plugin |
| figma-generate-library | figma plugin |
| figma-code-connect | figma plugin |
| figma-use-motion | figma plugin |
| generate-project-plan | figma plugin (workflow) |

### Quality & Style (2, Kevin-authored, added 2026-10-23)
| Skill | Source | Purpose |
|-------|--------|---------|
| style-library | kevin-authored (workshop folder; shared with Cheetara, Gibson, Neo) | The prompt library of prompt libraries: Kevin's fifteen styles plus eight families from his references, each with cues and hex, anti-patterns, and still, video, UI and Three.js templates. Options for an author, never imposed. |
| kevin-taste | kevin-authored (workshop folder; shared with Gibson) | Kevin's twelve taste principles with tests, from his Cosmos boards, references and DZNR OS decisions. DZNR's own work only. |

These two live physically in `skills/workshop/` but route to Snape, not Gandalf, as the Gibson-routed workshop skills do.

**Workshop skills Snape commonly CALLS Gandalf for:**
frontend-design, design-taste-frontend, ui-ux-pro-max, high-end-visual-design, stitch-design-taste, gpt-taste, baseline-ui, industrial-brutalist-ui, minimalist-ui, typeset, colorize, bolder, brandkit, polish, redesign-existing-projects, legendary-standard, quality-gate, prompt-architecture, midjourney-legendary

(These belong to Gandalf's roster: Snape pulls Gandalf in when needed.)

**Trigger keywords:** brand, identity, voice, tone, design system, components, tokens, theme, visual language, Figma, audit a design, design language, brand voice, brand-from-scratch, style library, which style, Claymorphism, Glassmorphism, Neumorphism, Bento Grid, Swiss Design, Kevin's taste, my taste.

---

## Sherlock: Discovery & Research

**Archetype:** Observation. Deduction. Sees the patterns others miss. Reads the room before speaking. Gathers evidence before opining.

**Role:** Owns the input side of any project: research, audits, competitive analysis, user understanding, opportunity mapping. Sherlock arrives first, scopes the problem, surfaces the truths, and hands findings to the right subagent. Never builds: only investigates and synthesizes.

**Skills (23 total):**

### Discovery & Brief (9)
| Skill | Source |
|-------|--------|
| idea-to-brief | anthropic-skills |
| discovery | anthropic-skills |
| site-audit | anthropic-skills |
| discover-brand | brand-voice plugin (shared with Snape) |
| ux-taxonomy | anthropic-skills |
| hcd-heuristics | anthropic-skills |
| hcd-ai-design | anthropic-skills |
| learn | anthropic-skills |
| morning | anthropic-skills |

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

(These belong to Gandalf's roster: Sherlock pulls Gandalf in when needed.)

**Trigger keywords:** research, audit, discover, find, investigate, understand, who is, what do users want, competitive, opportunity, brief, idea-to-brief, journey map, persona, synthesize, search.

---

## Gibson: Experience Engineering & AI Product

**Archetype:** William Gibson. Sees the near-future already arriving. Builds the speculative thing that pulls reality forward. Cyberpunk pragmatist: equally at home with shaders and system prompts.

**Role:** Owns immersive experience design, 3D, generative visuals, AI product architecture, and the AI-driven outputs that live inside experiences. Gibson handles everything where the medium is the message: where the experience itself is the product. Bridges the imagination side (immersive narrative) with the engineering side (AI architecture).

**Skills (34 total):**

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
| wan-video-prompts | kevin-authored (workshop folder, shared with Cheetara) | Wan 3.0 shot briefs for experience and campaign clips: frame and form, continuity, screen geography, timed beats, native sound (cases CC BY 4.0, imagineVid). |
| game-studio | kevin-authored (workshop folder) |

These three are Kevin-authored skills physically in `skills/workshop/` but routed to Gibson, not Gandalf. game-studio uses the Higgsfield MCP (ACTIVE).

### Three.js Implementation (12, Kevin-authored, routed to Gibson)
| Skill | Source |
|-------|--------|
| threejs-fundamentals | kevin-authored (workshop folder) |
| threejs-geometry | kevin-authored (workshop folder) |
| threejs-materials | kevin-authored (workshop folder) |
| threejs-lighting | kevin-authored (workshop folder) |
| threejs-textures | kevin-authored (workshop folder) |
| threejs-animation | kevin-authored (workshop folder) |
| threejs-loaders | kevin-authored (workshop folder) |
| threejs-shaders | kevin-authored (workshop folder) |
| threejs-postprocessing | kevin-authored (workshop folder) |
| threejs-interaction | kevin-authored (workshop folder) |
| threejs-production-hardening | kevin-authored (workshop folder) |
| threeui-catalog | kevin-authored (workshop folder) |

### Immersive Worlds (1, Kevin-authored, added 2026-10-23)
| Skill | Source | Purpose |
|-------|--------|---------|
| immersive-world-site | kevin-authored (workshop folder; shared with Neo and Cheetara) | A world, not a page (Ledger Stax, Kasane, An Improbable Future): thesis, districts or chapters, scroll as camera, in-world copy and HUD, one art direction, respect controls, a keepsake, a performance budget; maps lore-engine canon into the structure for Pulse OS. |

The Three.js twelve above are Kevin-authored skills physically in `skills/workshop/` but routed to Gibson, not Gandalf. They carry Three.js API-level implementation detail (audited against r160+) behind Gibson's existing `webgl-threejs` and `3d-experience-design` skills: constructor signatures, `three/addons/` import paths, and working examples. Source: https://github.com/MavenSix/threejs-skills

**Workshop skills Gibson commonly CALLS Gandalf for:**
image-to-code, imagegen-frontend-web, imagegen-frontend-mobile, animate, delight, overdrive, full-output-enforcement, legendary-standard, quality-gate, prompt-architecture, midjourney-legendary

(These belong to Gandalf's roster: Gibson pulls Gandalf in when needed.)

**Trigger keywords:** immersive, 3D, experience, world-building, AI product, agent, system prompt, generative, shader, three.js, WebGL, narrative arc, real-time, interactive installation, near-future, AI character, NPC, Seedance, video prompt, shotlist, game studio, build a game, browser game, GLTF, GLB, Draco, raycasting, orbit controls, post-processing, bloom, EffectComposer, BufferGeometry, instancing, PBR material, environment map, HDRI.

**Note:** Some skills (theme-factory, svg-generative, algorithmic-art, canvas-design, journey-mapping) are shared between Snape and Gibson. Tár routes based on context: if the work is about brand identity, Snape gets it. If it's about an immersive/AI experience, Gibson gets it.

---

## Neo: Delivery & Code

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

### Code Connection & Figma-to-Code (3)
| Skill | Source |
|-------|--------|
| figma-code-connect | figma plugin (shared with Snape) |
| figma-implement-motion | figma plugin |
| figma-swiftui | figma plugin |

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

(These belong to Gandalf's roster: Neo pulls Gandalf in mid-work.)

**Trigger keywords:** code, build, scaffold, spec, generate component, XM Cloud, Sitecore, LWC, Salesforce, code review, PR review, test plan, tech debt, ship, deploy, harden, optimize, fix accessibility.

---

## Morpheus: Pitch & Story

**Archetype:** The teacher. The guide. Shows the door. Translates the work into a story that gets a yes. Whether it's a pitch, a presentation, a stakeholder update, or a campaign: Morpheus packages and presents.

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

(These belong to Gandalf's roster: Morpheus pulls Gandalf in when needed.)

**Trigger keywords:** pitch, deck, presentation, slides, story, narrative, campaign, stakeholder, status, update, report, write a doc, email sequence, marketing, persuade.

---

## Gandalf: Workshop (peer + tool)

**Archetype:** The wizard who has been around forever. Knows things others don't. Arrives precisely when he means to. Mentor energy. Cross-cutting craftsman.

**Role:** Owns Kevin's 42 personally-authored workshop skills from `~/.claude/skills/`. Operates two ways simultaneously:

1. **As peer subagent:** Tár routes directly to Gandalf when the trigger is workshop-specific (e.g. "use design-taste-frontend", "harden this", "polish this output").
2. **As a tool:** Other subagents pull Gandalf in mid-work when they need one of his specific tools. Snape doing brand work calls Gandalf for `design-taste-frontend`. Neo doing code work calls Gandalf for `harden`. Gibson doing experience work calls Gandalf for `imagegen-frontend-web`.

**Override authority:** When a workshop skill overlaps with a plugin or anthropic-core skill, Gandalf's version wins. Kevin's `frontend-design` beats any plugin version.

### Skills (42 total): Gandalf's full roster

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

#### Quality standard (4, added 2026-10-23)
| Skill |
|-------|
| legendary-standard |
| quality-gate |
| prompt-architecture |
| midjourney-legendary |

The method (pack, not picture), the ship check (runs after the Fidelity Gate or the Prime Gate, never instead), the prompt structure, and the Midjourney V8.2 prompt library with Kevin's sref library (v2.21.0). Every producing agent calls them.

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
- Every producing agent calls Gandalf for legendary-standard, quality-gate and prompt-architecture before an asset, artifact or site ships, and for midjourney-legendary whenever the tool is Midjourney

---

## Cheetara: QKI and Author Worldbuilding

**Archetype:** Fast, precise, sensor-based warrior. Moves through the generation pipeline at speed, feels aesthetic drift before it fully surfaces, and strikes the Prime Gate the moment a render tries to sneak in where a drawn layer belongs. Operator, not artist.

**Role:** Owns the QKI (Quantum Kinetic Ink) cluster. Aesthetic-first serialized-world asset generation across characters, places, and objects. Loads the QKI style engine before any generator runs. Resolves the active world pack from context (via Snape clarifier if ambiguous). Coordinates external tools (MidJourney for hero 2D, Higgsfield for identity lock, Weavy for sheet compositing and mesh generation, Blender MCP or Unreal MCP for Layer 1 spatial framework). Writes to the shared asset manifest as the seam between generation and assembly.

**Engine first.** QKI is one engine among others, never the default for someone else's world. A job that names a QKI pack runs the QKI cluster unchanged. Work for an author (a Pulse OS job, or anything not naming a QKI pack) is an author world: Cheetara loads `author-world-authority`, drafts the author world pack from the manuscript and brief if none is approved, waits for the author's approval, renders in the pack's medium (photographic, painterly, drawn, 3D-real or mixed), and holds every output to the Fidelity Gate (medium and canon). The QKI DNA and the Prime Gate apply to an author world only when its pack opts into a drawn medium and QKI. With no pack resolvable she never falls back to QKI.

**Skills (29: 7 owned, 22 shared with Snape, Gibson and Gandalf, plus 1 shared contract):**

### Engine (1)

| Skill | Source | Purpose |
|-------|--------|---------|
| qki-style-authority | anthropic-skills | The canonical QKI style engine. Fixed DNA (four-layer render model, linework law, Prime Gate). Loads the active world pack. Read FIRST on every QKI asset. |

### Author world engine (1)

| Skill | Source | Purpose |
|-------|--------|---------|
| author-world-authority | kevin-authored (workshop folder) | The style engine for an author's world. Drafts the author world pack from the manuscript, brief, tonal references and graphify lore graph (palette, materials, groups, plus medium, realism, era and place, camera, motion, sound, and the canon). Emits the author-world injection block, picks the hero path by medium, defines the Fidelity Gate. The author approves the pack before any render; canon questions go to the author. Read FIRST on every author-world asset. |

The three generators serve both engines; under an author world they take the look, the hero path and the gate from `author-world-authority`.

### Lore engine (1, added 2026-10-21)

| Skill | Source | Purpose |
|-------|--------|---------|
| lore-engine | kevin-authored (workshop folder) | Canon and consistency for an author's world. Normalises chapters, session transcripts, notes, the brief and the project record into a corpus under the project's `lore/` folder (the originals untouched), builds a graphify lore graph over it (deep mode, `--update` on later runs), types the nodes (character, place, group, object, rule, event) in a post-pass, and writes `canon.json` and a cited `world-bible.md`. Flags attribute conflicts, timeline contradictions, rule violations, AMBIGUOUS edges, alias candidates and render gaps as numbered questions in `questions.md`, each with the passages, a proposed answer and the renders that wait. Records the author's answers in `rulings.md`, which win over the text. Never answers a canon question itself. Runs before `author-world-authority` drafts a pack, and again whenever new inputs arrive. |

Not shared with Morpheus: his story work is pitch and outbound narrative (translation, not invention), which has no canon to check.

### Generators (3)

| Skill | Source | Purpose |
|-------|--------|---------|
| qki-character-generator | anthropic-skills | Character node + sheet (hero, turnaround, expressions, motion states). Registers Higgsfield Soul Character for identity lock. |
| qki-place-generator | anthropic-skills | Environments, locations, cityscapes, buildings. Layer 1 first (Blender MCP or Unreal MCP), then drawn QKI establishing art on top. |
| qki-object-generator | anthropic-skills | Vehicles, weapons, props. Material-led. Hero design + orthographic angles. Optional Weavy Tripo / Meshy mesh for 3D-ready objects. |

### Shared with Snape and Gibson (5)

The stages Cheetara owns in DZNR's workflows already use these (2026-10-15 review): `short-medium-form-video` s3 and `long-form-narrative` (style frames, art direction), `long-form-narrative` s1 (series bible), `qki-serialized-world` and `pulse-os-artifacts` (world pack drafting, motion clips). They stay Snape's and Gibson's too; the shared-skills table below says how Tár tells them apart.

| Skill | Source | Purpose |
|-------|--------|---------|
| aesthetic-system | anthropic-skills (shared with Snape) | The visual language a set of frames shares: Cheetara's style frames for video and long-form art direction, the only place the style is set before anything moves. |
| immersive-experience-design | anthropic-skills (shared with Gibson) | The world's architecture as a series bible: places, factions, rules, what a reader or viewer moves through. Cheetara's first stage of long-form narrative. |
| brand-from-scratch | anthropic-skills (shared with Snape) | A world pack's identity drafted from temperament words (Chain 9 path 2): palette, faction marks, naming, before the QKI engine loads it. |
| ds-theming | anthropic-skills (shared with Snape) | A world pack's palette as tokens per faction, so every generator draws from one source. |
| seedance-director | kevin-authored (workshop folder, shared with Gibson) | Motion clips from approved QKI plates (Seedance): camera, timing and motion state per clip, the Prime Gate still applied to every frame. |

### Three.js, ThreeUI and Wan (12, Kevin's install of 2026-10-15)

Installed for Cheetara at Kevin's request from three repositories: [CloudAI-X/threejs-skills](https://github.com/CloudAI-X/threejs-skills) (the ten `threejs-*` skills, already in the workshop and identical at b1c6230, now shared with Gibson), [MavenSix/threeui](https://github.com/MavenSix/threeui) (Kevin's fork of ThreeUI, which `threeui-catalog` already covers: its 43 components match the fork's source-code.json) and [imagineVid/Awesome-wan-3-0-prompts-and-skills](https://github.com/imagineVid/Awesome-wan-3-0-prompts-and-skills) (a credited prompt library, CC BY 4.0, turned into the new workshop skill `wan-video-prompts`). Cheetara uses the Three.js set for the experience layer of a world (for QKI: Layer 1 in the browser, places and objects that must run live) and Wan for motion clips from approved plates; on a QKI pack the Prime Gate holds on all of it, and on an author world the pack's medium decides and the Fidelity Gate holds.

| Skill | Source | Purpose |
|-------|--------|---------|
| wan-video-prompts | kevin-authored (workshop folder; cases CC BY 4.0 from imagineVid) | Wan 3.0 shot briefs: frame and form first, continuity in words, screen geography, timed beats, a camera move per beat, native sound in the brief. Cheetara's motion clips from approved plates, image-to-video; never "3D-realism" from a QKI plate, while an author world's pack medium decides. Shared with Gibson. |
| threejs-fundamentals | kevin-authored (workshop folder, shared with Gibson) | Scene, camera, renderer and the render loop for a QKI world in the browser. |
| threejs-geometry | kevin-authored (workshop folder, shared with Gibson) | Layer 1 blocking as geometry: the spatial frame under drawn art. |
| threejs-materials | kevin-authored (workshop folder, shared with Gibson) | Materials that keep the drawn look (flat, toon, ink) rather than a render's. |
| threejs-lighting | kevin-authored (workshop folder, shared with Gibson) | Lighting that serves the pack's palette, not physical realism. |
| threejs-textures | kevin-authored (workshop folder, shared with Gibson) | QKI plates and linework as textures. |
| threejs-animation | kevin-authored (workshop folder, shared with Gibson) | The seven motion states in a live scene. |
| threejs-loaders | kevin-authored (workshop folder, shared with Gibson) | Bringing Weavy, Tripo and Meshy meshes into the scene. |
| threejs-shaders | kevin-authored (workshop folder, shared with Gibson) | Ink, halftone and linework shaders: the drawn layer in GLSL. |
| threejs-postprocessing | kevin-authored (workshop folder, shared with Gibson) | Outline and grain passes that hold the Prime Gate in motion. |
| threejs-interaction | kevin-authored (workshop folder, shared with Gibson) | Picking and orbiting a world's places and objects. |
| threeui-catalog | kevin-authored (workshop folder, shared with Gibson) | Ready ThreeUI components (Kevin's fork) for a world's site or interface before hand-building one. |

### Quality and style (6 shared, added 2026-10-23)

| Skill | Source | Purpose |
|-------|--------|---------|
| legendary-standard | kevin-authored (workshop folder, Gandalf) | The method's asset steps: hero, lock, series, a world's plates staged, clips, canon micro-detail, upscale before motion. |
| quality-gate | kevin-authored (workshop folder, Gandalf) | After the Fidelity Gate or the Prime Gate, never instead; never marks an author's chosen medium down. |
| style-library | kevin-authored (workshop folder, Snape) | Style options offered to an author in the pack draft, never imposed; templates for stills and clips. |
| prompt-architecture | kevin-authored (workshop folder, Gandalf) | Every generation prompt; series locks. |
| immersive-world-site | kevin-authored (workshop folder, Gibson) | A world's plates, relics, portraits and canon for a Pulse OS world site. |
| midjourney-legendary | kevin-authored (workshop folder, Gandalf) | Every Midjourney V8.2 prompt: hero, series variant, Edit Model coverage, video beat; Kevin's srefs only where the QKI engine or the author's pack calls for them. |

### Shared contract (not a callable skill)

| File | Purpose |
|------|---------|
| qki-asset-pipeline/asset-manifest-schema.md | The seam. Shared record schema every generator writes to and every downstream assembly stage (Gibson, Neo) reads from. Every record names the engine and pack it was made under (no engine field means QKI; author-world fields in `author-world-authority/references/manifest-fields.md`). |

**Workshop skills Cheetara commonly CALLS Gandalf for:**
design-taste-frontend, gpt-taste, high-end-visual-design, critique

(These belong to Gandalf's roster. Cheetara pulls Gandalf in mid-work for aesthetic taste passes on sheets before manifest write.)

**Trigger keywords:** create a character, character sheet, worldbuilding, world pack, faction, QKI, Quantum Kinetic Ink, populate the world, build the faction, hero object, hero character, hero prop, establishing shot, cityscape, environment, contested site, Wound Keeper, Synthesis, Friends and Anarchists, F&A, drawn art, graphic novel, sref anchor, Soul Character, Prime Gate, add to the world, author world, author's world, Pulse OS world, World Bible, manuscript, Fidelity Gate, lore engine, canon check, continuity check, canon questions, ruling, rulings.

**MCP dependencies:**
- MidJourney (human-in-the-loop, no MCP)
- Higgsfield (MCP ACTIVE per v1.14.0)
- Weavy / Figma Weave (cloud, no MCP)
- Blender MCP (ACTIVE when Blender is running locally)
- Unreal MCP (UE 5.8 experimental, alternative to Blender; Kevin is adding it, 2026-10-23, and it gets a DZNR spec once its real tools are known; see `routing/MCPS.md`)
- Local ComfyUI (optional, free mesh iteration)

**Cross-subagent relationships:**
- **Upstream (feeds Cheetara):** Sherlock's `idea-to-brief` and `discovery` for world concept; Gibson's `immersive-experience-design` for the world architecture that determines which assets to build.
- **Downstream (reads Cheetara's manifest):** Gibson's `3d-experience-design`, `webgl-threejs`, `live-experience` for experience layer instantiation; Neo's `repo-scaffold` and `qa-handoff` for shipping.

---

## Snake Eyes: Specialist Arsenal (parked, not auto-routed by Tár)

**Archetype:** Silent operator. Master of every weapon in the case. Does not speak. Gets deployed when the situation calls for the exact, precise tool. Never the default, always the specialist.

**Role:** These skills stay installed and explicitly callable, but Tár does not route to them automatically. They live in a separate roster because they are either off-domain (bio-research), require deliberate invocation (legal, telemetry, finance), off-vertical for Kevin's design practice (unity, small-business), or coherent specialist toolkits that the user calls directly by name. Snake Eyes is summoned by name, never assumed.

**Total Snake Eyes arsenal:** ~141 skills across 12 clusters (Bio Research, Legal, Product Tracking, Operations, Adobe for Creativity, SearchFit SEO, Data, Small Business, Canva, Finance, Unity, PDF Tools) plus Other/Misc.

### Bio Research (6): off-domain for Kevin
instrument-data-to-allotrope, nextflow-development, scientific-problem-selection, scvi-tools, single-cell-rna-qc, bio-research-start

### Legal (9): separate concern
brief, compliance-check, legal-response, legal-risk-assessment, meeting-briefing, review-contract, signature-request, triage-nda, vendor-check

### Product Tracking (7): telemetry and analytics, call explicitly
product-tracking-audit-current-tracking, product-tracking-business-case, product-tracking-design-tracking-plan, product-tracking-generate-implementation-guide, product-tracking-implement-tracking, product-tracking-instrument-new-feature, product-tracking-model-product

### Operations (9): process and compliance ops
capacity-plan, change-request, compliance-tracking, process-doc, process-optimization, risk-assessment, runbook, vendor-review, status-report (shared with Morpheus)

### Adobe for Creativity (7): Adobe-specific tooling
adobe-batch-edit-photos, adobe-create-pdfs-from-data, adobe-create-social-variations, adobe-design-from-template, adobe-edit-quick-cut, adobe-resize-photos-and-videos, adobe-retouch-portraits

### SearchFit SEO (11): coherent SEO toolkit
ai-visibility, broken-links, content-brief, content-strategy, content-translation, internal-linking, keyword-clustering, on-page-seo, schema-markup, seo-audit (searchfit version), technical-seo

### Data (10): analytics-specific
analyze, build-dashboard, create-viz, data-context-extractor, data-visualization, explore-data, sql-queries, statistical-analysis, validate-data, write-query

### Small Business (31): SMB operations toolkit (added v2.3.0)
For running a small business end to end: cash flow, invoicing, payroll, CRM, customer support, marketing, taxes. Uses connectors like QuickBooks, PayPal, Stripe, HubSpot when they are authorized.

business-pulse, call-list, canva-creator, cash-flow-snapshot, close-month, content-strategy (SMB version), contract-review (SMB version), crm-cleanup, crm-maintenance, customer-pulse, customer-pulse-check, friday-brief, handle-complaint, invoice-chase, job-post-builder, lead-triage, margin-analyzer, monday-brief, month-end-prep, month-heads-up, plan-payroll, price-check, quarterly-review, review-contract (SMB version), run-campaign, sales-brief, smb-onboard, smb-router, tax-prep, tax-season-organizer, ticket-deflector

### Canva (6): design workflow inside Canva (added v2.3.0)
Read-only feedback plus safe editing on Canva designs. Uses the Canva MCP.

brand-check, bulk-create, edit-design, get-design-feedback, implement-feedback, resize-for-social-media

### Finance (8): accounting and SOX close (added v2.3.0)
For journal entries, reconciliations, financial statements, SOX 404 testing. Not needed for Kevin's core design practice; parked until an engagement requires it.

audit-support, close-management, financial-statements, journal-entry, journal-entry-prep, reconciliation, sox-testing, variance-analysis

### Unity (30): Unity game engine specialist toolkit (added v2.3.0)
Unity-specific development. Covers 2D pixel-perfect, audio mixers, IAP, ads mediation, localization, sprite atlases, physics, multiplayer services, Vivox voice chat, shader graph, TMP text, WebGL builds, tilemaps, UI systems (uGUI, IMGUI, UI Toolkit), Unity CLI, URP postprocessing. Off-vertical for design practice; on-domain if a client engagement targets Unity or if the game-studio workshop skill leads into a Unity project.

2d-pixel-perfect, audio-setup-mixers, build-live-game, implement-in-app-purchases, initialize-ai-navigation, levelplay-unity-integration, localization, manage-sprite-atlas, new-unity-project, optimize-audio, optimize-text-mesh-pro, optimize-web, physics-3d-collision, setup-multiplayer-services, setup-vivox-voice-chat, shader-graph-create-custom-node, sprite-editor, sprite-segment-3x3grid, tilemap-palette-create, tilemap-ruletile-createempty, tilemap-ruletile-createfromsegment, ui, ui-imgui, ui-ugui, ui-uitk, unity-cli, unity-package-management, urp-postprocessing, validate-urp-render-graph-renderer-feature

### PDF Tools (6): PDF fill, sign, merge, split, extract (added v2.3.0)
Handled by the pdf-viewer plugin's MCP. Full document workflow.

annotate, fill-form, open, sign, view-pdf, plus the pdf-viewer MCP tools (display_pdf, interact, list_pdfs)

### Other and Misc
schedule (handled by Tár), setup-cowork (handled by Tár), cowork-plugin-customizer, create-cowork-plugin

---

## Routing rules for Tár

See TRIGGERS.md for the full algorithm. Summary:

1. **Check memory first**: has this project/domain been touched before?
2. **Scan for explicit Snake Eyes invocation**: user names a specialist skill → deploy directly.
3. **Match primary trigger keywords** across all 7 active subagents.
4. **Apply disambiguation defaults:** "design" → Snape, "audit" → Sherlock, "SEO" → Snake Eyes (soft route)
5. **If ambiguous after defaults** → Snape voices a clarifying question (terse, precise, slightly impatient)
6. **Mid-chain Gandalf calls**: any subagent can pull Gandalf in for workshop skills they need
7. **Handoff inference**: Tár listens for "I'm good" / "ready for next phase" OR infers and asks

### Standard chain flows
- **Discovery flow:** Sherlock → Snape OR Gibson (Snape clarifies if ambiguous) → Neo (with Gandalf for polish/harden) → Morpheus
- **Brand build flow:** Sherlock → Snape (calls Gandalf for taste/polish) → Neo → Morpheus
- **Experience build flow:** Sherlock → Gibson (calls Gandalf for imagegen) → Neo → Morpheus
- **Delivery flow:** Sherlock → Snape → Neo (calls Gandalf for harden) → Morpheus
- **SEO flow:** Snake Eyes (audit/keyword work) OR Morpheus (content): Snape clarifies if ambiguous

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
| aesthetic-system | Snape + Cheetara | Snape for a brand's aesthetic system, Cheetara for a world's or a film's style frames |
| immersive-experience-design | Gibson + Cheetara | Gibson for experiences people walk or click through, Cheetara for a story world's series bible |
| brand-from-scratch | Snape + Cheetara | Snape for a real brand, Cheetara for a fictional world pack's identity |
| ds-theming | Snape + Cheetara | Snape for a product's design-system themes, Cheetara for a world pack's faction palettes |
| seedance-director | Gibson + Cheetara | Gibson for experience and campaign motion, Cheetara for motion clips from a world's approved plates (QKI or an author world) |
| wan-video-prompts | Cheetara + Gibson | Cheetara for motion clips from a world's approved plates (QKI or an author world), Gibson for experience and campaign clips on Wan |
| threejs-* (the ten from CloudAI-X) | Gibson + Cheetara | Gibson for experiences and products in the browser, Cheetara for a world's places and objects in the browser (QKI or an author world) |
| threeui-catalog | Gibson + Cheetara | Gibson for experience interfaces, Cheetara for a world's own site |
| legendary-standard | Gandalf (owner) + Snape, Cheetara, Gibson, Neo, Morpheus | Each runs the steps it owns (see the skill's owner table); Gandalf runs curation and the gate |
| quality-gate | Gandalf (owner) + every producing agent | Gandalf runs it; it follows the Fidelity Gate on an author world and the Prime Gate on a QKI pack |
| prompt-architecture | Gandalf (owner) + every producing agent | Whoever writes the prompt or brief |
| style-library | Snape (owner) + Cheetara, Gibson, Neo | Snape for DZNR's own work and brands; Cheetara offers entries to an author as options; Gibson for experiences; Neo for UI section briefs |
| kevin-taste | Snape (owner) + Gibson | DZNR's own work only; never an author's world or a client's brand |
| immersive-world-site | Gibson (owner) + Neo, Cheetara | Gibson designs, Neo builds, Cheetara supplies a world's assets and canon |
| midjourney-legendary | Gandalf (owner) + Snape, Cheetara, Gibson | Snape for DZNR's own work and brands, Cheetara for worlds (QKI's engine or the author's pack resolves the sref), Gibson for experience and campaign heroes |

---

## What's next

1. ✅ DECISIONS.md: locked collision resolutions
2. ✅ SUBAGENT_ROSTERS.md: this doc, locked subagent assignments
3. 🔄 FigJam board annotation: add skill counts and legend
4. ⏭ Migration script (dry-run): physically organize skills into DZNR repo structure
5. ⏭ Repo scaffold: folder layout matching this roster
6. ⏭ Start Subagent 1 build (recommend Tár first as the orchestrator, then Neo for delivery work)
