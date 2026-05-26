# DZNR Trigger Keyword Maps

**Phase 2.1 of the DZNR routing system**
**Status:** v2 — Kevin's answers applied, Gandalf added
**Last updated:** 2026-05-18

This document defines how Tár (the orchestrator) decides which subagent owns a user request. Each character has four trigger lists:

- **Primary triggers** — high-confidence words. If the request contains these, route here immediately.
- **Context-dependent triggers** — words that COULD mean this character, but need disambiguation.
- **Anti-triggers** — words that mean "this is NOT for me." If a request has my triggers AND anti-triggers, I defer.
- **Handoff signals** — phrases inside the work itself that mean "I'm done, pass to the next character in the chain."

When Tár can't decide between two characters, **Snape voices the clarifying question** to the user (terse, precise, slightly impatient).

---

## The cast (updated)

| Character | Subagent | Role |
|-----------|----------|------|
| Tár | Orchestrator | Routing, memory, tempo. Invisible to user. |
| Snape | Brand & Design Systems + Clarifier | Identity, voice, design system. Also voices Tár's clarifications. |
| Sherlock | Discovery & Research | Audit, investigate, synthesize. Never builds. |
| Gibson | Experience Eng + AI Product | Immersive, 3D, AI-driven futures. |
| Neo | Delivery & Code | Specs, components, ship it. |
| Morpheus | Pitch & Story | Outbound. Present, persuade, narrate. |
| **Gandalf** | **Workshop (peer + tool)** | **Kevin's personal craft. Called by Tár or by other subagents.** |
| Snake Eyes | Specialist Arsenal (parked) | Silent. Called by name. Soft-routed for SEO. |

---

## Tár — Orchestrator

**Tár is the front door. Every request starts here. She doesn't claim work — she routes it.**

### Primary triggers (Tár handles directly)
- "what subagents are available", "who can help with", "what can DZNR do"
- "remember", "what did we decide about", "do you remember when"
- "schedule", "remind me", "every morning", "every day at"
- "memory", "what's in memory", "save this", "forget this"
- "task list", "add to my tasks", "what's on my plate"
- "let's plan this", "scope this out" (initial routing decision before delegation)

### Context-dependent
- "help me with X" — Tár parses X, finds the right subagent, delegates
- "I need to" — same pattern
- "we should" — same pattern

### Anti-triggers
- None. Tár is the front door.

### Handoff signals (Tár listens for these)
- Explicit: "I'm good", "ready to move to the next phase", "done here", "what's next"
- Inferred: long silence after a subagent delivers, OR a request that pivots topic
- Inference rule: if a subagent completes its output and the user hasn't said "I'm good" or equivalent within the next message, **Tár asks** "Ready to move to the next phase, or do you want to keep working with [current subagent]?"

---

## Snape — Brand & Design Systems

**The alchemist. Identity, voice, design tokens, visual scaffolding. ALSO the clarifying voice when Tár is uncertain.**

### Primary triggers
- "brand voice", "brand guidelines", "brand identity", "tone of voice"
- "design system", "design tokens", "component library"
- "style guide", "visual language", "design language"
- "Figma", "Figma file", "Figma library", "Figma variables"
- "theme", "theming", "skin", "white-label"
- "brand from scratch", "no brand yet", "create brand"
- "design critique", "review my design", "is this on-brand"
- "accessibility audit", "WCAG", "a11y review"
- "wireframe" (when about visual structure)
- "color system", "typography", "spacing system"
- "design handoff", "dev handoff" (the design side)
- **Magic Patterns triggers (PENDING MCP connection):** "Magic Patterns", "magicpatterns", "generate UI options", "show me design variants", "explore UI directions", "iterate on this design", "variants of this component", "text to UI", "generate UI from prompt"

### Context-dependent
- "design" — see "design" disambiguation rules below. Default trigger if no other context.
- "UI" — Snape claims if request mentions: pattern, system, library, component
- "polish" — could be Snape (visual polish) or Gandalf (workshop `polish` skill — see Gandalf section)

### Anti-triggers
- "deploy", "ship", "production", "commit", "merge" → Neo's territory
- "story", "pitch", "deck", "presentation" → Morpheus
- "immersive", "3D", "experience" → Gibson
- "research", "interviews", "user testing" → Sherlock

### Handoff signals (Snape says these to chain forward)
- "Design system spec is ready, Neo can build the components"
- "Brand is defined, Morpheus can wrap the pitch"
- "Visual language locked. Gibson can render the experience."

### Snape's secondary role: Clarifying voice for Tár
When Tár can't decide between two subagents, Snape phrases the clarifying question. Template:
> "Tár's uncertain whether this is [X-character]'s work or [Y-character]'s. Are you asking for [X-outcome] or [Y-outcome]?"

**Voice:** terse, precise, slightly impatient. Never warm. Never apologetic.

Example: "Tár's uncertain whether this is Snape's work or Gibson's. Are you asking for a brand visual system, or an immersive experience?"

---

## Sherlock — Discovery & Research

**The investigator. Reads patterns. Audits. Synthesizes. Never builds.**

### Primary triggers
- "research", "discovery", "audit" (when about research — see audit rules below)
- "user research", "user interviews", "user testing", "usability test"
- "competitive analysis", "competitor", "what are competitors doing"
- "site audit", "review this website", "what's wrong with this site"
- "heuristic evaluation", "UX audit"
- "synthesize", "themes from these notes", "what came out of this"
- "persona", "user persona", "synthetic audience"
- "journey map" (when about users, not experiences — see shared-skills doc)
- "opportunity", "where's the gap", "what should we work on"
- "search for", "find that doc", "where did we talk about"
- "digest", "summarize this week"
- "idea-to-brief", "I have an idea", "help me think through"
- "what do users want", "what's the problem"
- "informs design" — Sherlock work that feeds design decisions

### Auto-trigger on rebuild framing (NEW)
The following words **silently auto-invoke Sherlock for a current-state discovery pass** even if the user didn't explicitly ask for research:
- "rebuild", "redesign", "replatform", "modernize", "refresh", "revamp", "overhaul", "reimagine"

When these words appear with downstream chain triggers (pitch, brand, build, etc.), Sherlock runs a brief current-state research pass FIRST so the downstream work isn't guessing. Sherlock's output feeds the next subagent automatically — no extra clarification needed.

Example: "Rebuild their immersive experience" → Sherlock auto-runs discover-brand + site-audit on the existing experience → Gibson uses Sherlock's output as input for the rebuild concept.

### Context-dependent
- "design" — Sherlock claims if request is about RESEARCH that will inform design. (e.g. "do design research on this category")
- "review" — Sherlock claims if reviewing for INSIGHT. Snape claims if reviewing for DESIGN QUALITY. Neo claims if reviewing CODE.
- "analyze" — Sherlock claims for research/competitive analysis. Snake Eyes claims for data analysis.

### Anti-triggers
- "build", "make", "create" (when producing the thing, not understanding it)
- "ship", "deploy", "code"
- "design system" (Snape)
- "pitch", "present" (Morpheus)
- "implement"

### Handoff signals
- "Research is complete. [Subagent] can take it from here."
- "Findings synthesized. Morpheus can frame the narrative."
- "Discovery brief ready. Tár, route the build."

---

## Gibson — Experience Engineering + AI Product

**Speculative futures. Immersive, 3D, spatial, AI-driven. The world-builder.**

### Primary triggers
- "immersive", "experience design", "experiential"
- "3D", "WebGL", "Three.js", "shader", "GLSL"
- "AR", "VR", "spatial", "spatial computing", "XR"
- "interactive installation", "live experience", "activation"
- "AI product", "AI agent", "AI experience", "AI-driven"
- "system prompt", "prompt engineering" (for product)
- "MCP", "MCP server", "build an MCP"
- "agent architecture", "multi-agent", "orchestration"
- "memory system", "tool design", "context strategy"
- "narrative arc", "world-building", "story world"
- "generative art" (when experiential, not brand)
- "interactive web", "scroll-driven", "WebXR"
- "NPC", "AI character", "in-world dialogue", "ambient narration"
- "experience output" (text/audio inside an experience)
- "near-future", "speculative", "what if this existed"

### Context-dependent
- "design" — Gibson claims if request mentions: experience, immersive, spatial, AI, narrative, world
- "interaction" — Gibson claims if about spatial/immersive. Snape claims for UI interactions.
- "AI" — Gibson claims for product/architecture work. Gandalf claims if Kevin's `imagegen-*` workshop skill applies.

### Anti-triggers
- "brand voice" (Snape)
- "design tokens", "component library" (Snape)
- "pitch deck", "presentation" (Morpheus)
- "code review" (Neo)
- "site audit" (Sherlock)

### Handoff signals
- "Architecture is set. Neo can build the implementation."
- "Experience designed. Morpheus can build the launch story."
- "Concept proven. Snape can layer the brand."

---

## Neo — Delivery & Code

**Specs to shipping code. Multi-platform delivery pipeline. Build, QA, ship.**

### Primary triggers
- "code", "build", "implement", "ship", "deploy"
- "spec", "PRD", "technical spec", "functional spec"
- "Sitecore", "XM Cloud", "JSS", "Edge Delivery", "AEM"
- "Salesforce", "LWC", "Lightning Web Component", "Apex"
- "scaffold", "repo scaffold", "initialize the project"
- "code review", "PR review", "review this code"
- "test plan", "testing strategy", "QA"
- "component generator", "generate component"
- "tech debt", "refactor"
- "incident", "production is down", "outage"
- "documentation" (about code/system docs)
- "system design", "architecture" (about codebase, NOT AI agent architecture)
- "standup", "what did I do yesterday"
- "user stories", "JTBD", "acceptance criteria"

### Context-dependent
- "design" — Neo claims if request mentions: code, implement, build, component prop, API
- "review" — see Sherlock and Snape notes above
- "architecture" — Neo for code/system. Gibson for AI agent.
- "build" — Neo for code. Gibson for experience. Snape for design system construction.
- "harden", "optimize", "polish", "fix accessibility" — these MAY be Neo, BUT see Gandalf section (these are Gandalf's workshop skills)

### Anti-triggers
- "brand voice" (Snape)
- "user research", "competitive analysis" (Sherlock)
- "pitch", "story", "presentation" (Morpheus)
- "immersive", "3D world" (Gibson)

### Handoff signals
- "Build is shipped. Morpheus can announce."
- "Spec is implemented. QA package ready."
- "Component scaffolded. Snape can review design fidelity."

---

## Morpheus — Pitch & Story

**Outbound. Translates work into stories that get a yes. The presenter.**

### Primary triggers
- "pitch", "pitch deck", "pitch script", "investor deck", "client deck"
- "presentation", "slide deck", "slides"
- "story", "narrative", "tell the story", "how do I frame this"
- "campaign", "marketing campaign", "go-to-market"
- "email sequence", "drip campaign", "nurture flow"
- "stakeholder update", "status report", "weekly update"
- "roadmap" (when presenting externally)
- "performance report" (for stakeholders)
- "write a doc", "write a memo", "draft a letter"
- "press release", "announcement"
- "case study"
- "talking points", "executive summary"

### Context-dependent
- "design" — Morpheus claims if request is about presenting/communicating design work to stakeholders (e.g. "help me explain this design decision in the deck")
- "write" — Morpheus for outbound content. Snake Eyes (legal) for legal docs. Snape for brand voice work.
- "content" — Morpheus for marketing/outbound. Snape for brand voice content. Snake Eyes (SEO) for SEO content (soft rule, see below).
- "review" — Morpheus if reviewing copy for outbound impact
- "roadmap" — Morpheus if presenting externally. Neo/PM if planning internally.

### Anti-triggers
- "code", "build the system", "implement" (Neo)
- "design system" (Snape)
- "user research", "competitive analysis" (Sherlock)
- "3D experience", "interactive installation" (Gibson)

### Handoff signals
- "Pitch is delivered. Tár can route next steps."
- "Story is told. The work speaks for itself now."

---

## Gandalf — Workshop (peer + tool)

**Kevin's accumulated personal craft. 38 skills authored locally in `~/.claude/skills/`. Operates two ways: Tár routes to him as a peer subagent AND other subagents call him as a tool mid-work.**

### Operating model
1. **As peer**: Tár routes directly to Gandalf when the trigger is workshop-specific (e.g. "use design-taste-frontend", "harden this", "polish this")
2. **As tool**: Other subagents pull Gandalf in mid-work when they need one of his specific tools. Example: Snape doing brand work calls Gandalf for `design-taste-frontend`. Neo doing code work calls Gandalf for `harden`.
3. **Override authority**: When a workshop skill overlaps with a plugin/anthropic-core skill, Gandalf's version wins. (Already established: Kevin's `frontend-design` beats plugin versions.)

### Gandalf's full roster (38 workshop skills)

| Category | Skills |
|----------|--------|
| **Design taste** | design-taste-frontend, gpt-taste, ui-ux-pro-max, high-end-visual-design, stitch-design-taste, frontend-design |
| **Aesthetic recipes** | baseline-ui, industrial-brutalist-ui, minimalist-ui, brandkit, typeset, colorize, bolder |
| **Image to code / gen** | image-to-code, imagegen-frontend-web, imagegen-frontend-mobile |
| **Animation / motion** | animate, delight, overdrive |
| **Code remediation** | harden, polish, optimize, fixing-accessibility, fixing-metadata, fixing-motion-performance, adapt |
| **Critical thinking** | critique, audit, distill, extract, clarify, normalize, redesign-existing-projects |
| **Meta / process** | onboard, teach-impeccable, quieter, arrange, full-output-enforcement |

### Primary triggers
- **By skill name**: "use [workshop-skill-name]" — e.g. "use design-taste-frontend", "run polish on this"
- **By verb**: "harden", "polish", "optimize", "tighten", "clarify", "distill", "extract", "normalize", "arrange"
- **By outcome**: "give this taste", "make this feel high-end", "redesign this", "level this up"
- **Workshop signals**: "Kevin's version of", "my custom skill for", "the workshop skill"

### Context-dependent
- "polish" — Gandalf if request implies workshop-level refinement. Snape if "polish the visual design." Neo if "polish the code."
- "audit" — Gandalf claims if requesting his `audit` workshop skill specifically. Otherwise see audit default below.
- "design taste" — Gandalf claims (this is his core territory)
- "fix" — Gandalf claims if it matches a `fixing-*` skill (accessibility, metadata, motion performance)
- "make this better" — Gandalf claims if no other subagent has a clearer trigger

### Anti-triggers
- "brand from scratch" (Snape — Gandalf doesn't define brand identity)
- "user research", "competitive analysis" (Sherlock)
- "pitch deck", "presentation" (Morpheus)
- "deploy", "ship to production" (Neo — Gandalf refines, doesn't ship)
- "3D world", "immersive" (Gibson)

### Handoff signals
- "Refinement done. Returning to [calling subagent]."
- "Workshop pass complete. Ready for next phase."
- "Polish applied. Tár, route the next step."

### When other subagents call Gandalf
Pattern: subagent does primary work → identifies need for workshop skill → calls Gandalf → Gandalf returns refined output → subagent continues.

Examples:
- **Snape → Gandalf**: "I've drafted the brand visual system. Gandalf, run `design-taste-frontend` and `polish` on it before I hand to Neo."
- **Neo → Gandalf**: "Component is scaffolded. Gandalf, run `harden` and `fixing-accessibility` before QA."
- **Gibson → Gandalf**: "Experience concept ready. Gandalf, run `imagegen-frontend-web` for the hero treatment."

### Gandalf orchestrator mode (NEW — Innovation Accelerator)

For the Innovation Accelerator methodology, Gandalf operates as **orchestrator** — calling other subagents in an inverse-of-usual pattern. This is the **only** skill pack that currently uses orchestrator mode. Documented exception, not a precedent for casual use.

**Triggers that activate orchestrator mode:**
- "innovation accelerator", "IA workshop", "IA for [client]"
- "run the accelerator", "run IA", "fire the accelerator"
- "2-day accelerator", "innovation workshop for [client]" (with explicit client)
- "Spec Matrix", "MoSCoW workshop", "sign-off workshop"
- "Day 1 prep", "Day 2 prep" (in IA context)

**Stage-specific triggers (individual invocation, Gandalf still orchestrates the stage):**
- "ia-prepare", "workshop pre-work", "intelligence brief", "tailored agenda"
- "ia-discover-day1", "Day 1 facilitation", "Day 1 run of show"
- "ia-define-day2", "Day 2 facilitation", "Day 2 sign-off", "MoSCoW + Spec Matrix"
- "ia-synthesize", "Linear backlog from workshop", "workshop synthesis"
- "ia-build-handoff", "sprint kickoff from IA", "trigger the build pipeline"

**Critical disambiguation:** generic "workshop" alone does NOT trigger IA. Route to Sherlock's `hcd-ai-design` for generic workshop framing. IA requires explicit IA-flavored language.

**Who Gandalf calls in orchestrator mode:**
- **Sherlock** in Stage 1 (discovery + brand inputs) and Stage 2/3 support
- **Snape** in Stage 1 (brand & style breakdown) and Day 1/2 design fidelity
- **Morpheus** in every stage (deliverables, scripts, reports, sign-off comms)
- **Neo** in Stage 4 (Linear + estimation) and Stage 5 (build handoff — full ownership)

See Chain 6 in `routing/CHAINS.md` for the full orchestration logic.

---

## Snake Eyes — Specialist Arsenal

**Silent. Called by name. Tár does NOT route here automatically — except for SEO (soft rule).**

### How Snake Eyes is invoked
1. **Explicit**: user explicitly names a parked specialist skill. "Run a legal-risk-assessment on this contract." Snake Eyes deploys.
2. **Soft rule for SEO**: SEO work soft-routes to Snake Eyes' searchfit-seo toolkit. If the request mentions SEO and doesn't have a strong Morpheus or Sherlock trigger, Snake Eyes takes it. **Snape clarifies** if ambiguous: "Is this SEO content work (Morpheus) or an SEO audit (Snake Eyes)?"

### Snake Eyes domains
- **Bio research** (off-domain for Kevin) — call explicitly
- **Legal** — NDA triage, contract review, etc. Call explicitly.
- **Product tracking / telemetry** — call explicitly
- **Operations** — process docs, capacity, vendor reviews. Call explicitly.
- **Adobe creativity** — photo/video editing. Call explicitly.
- **SearchFit SEO** — **soft-routed when SEO is the primary topic**
- **Data analytics** — SQL, viz, statistical analysis. Call explicitly OR called by Sherlock during research.

### Primary triggers (mostly explicit invocation)
- "use the [skill-name] skill"
- "run [skill-name]"
- "I want to use [plugin] for this"
- "this is a [legal/SEO/data] question"

### Soft-route triggers (SEO only)
- "SEO audit", "technical SEO", "schema markup", "keyword research", "broken links" → soft route to Snake Eyes
- "SEO content" or "SEO writing" → Snape clarifies between Morpheus and Snake Eyes

### Anti-triggers
- None. Snake Eyes only acts on direct call or SEO soft-route.

### Handoff signals
- "Specialist task complete. Returning to [calling subagent]."

---

## Disambiguation rules (the critical ones)

### "design" disambiguation
Default routing by likelihood (Kevin's call):

1. **Snape** (most likely) — brand, system, visual, tokens, component design
2. **Sherlock** — when "design" means "design research" or "informs design decisions"
3. **Gibson** — when "design" means "immersive/spatial/AI experience design"
4. **Morpheus** — when "design" is about presenting/communicating design work
5. **Snake Eyes** — when Kevin explicitly invokes a specialist skill

**Rule**: if "design" appears with no other character's strong trigger, **default to Snape**.

If "design" appears with another character's trigger, the other character wins. Examples:
- "design research" → Sherlock
- "design system" → Snape
- "experience design" → Gibson
- "design for the deck" → Morpheus

### "audit" disambiguation (Kevin's call: Sherlock is default)

If a request just says "audit this" with no other context, **route to Sherlock**.

Sherlock owns the default because most of Kevin's audit work is discovery-flavored (understanding a site, surfacing issues, mapping the territory). If the audit turns out to be design-specific or code-specific mid-work, Sherlock hands off to Snape or Neo.

Disambiguation:
- "design audit", "brand audit", "accessibility audit" → Snape
- "code audit", "tech debt audit", "PR audit" → Neo
- "site audit", "UX audit", "competitive audit", "content audit" → Sherlock (default)
- "telemetry audit", "tracking audit" → Snake Eyes (product-tracking)

### "SEO" soft-route to Snake Eyes (Kevin's call)
If the request is SEO-flavored, default to Snake Eyes' searchfit-seo toolkit. Snape clarifies if ambiguous:
- "SEO audit" → Snake Eyes
- "SEO strategy" → Snake Eyes
- "SEO content" → Snape clarifies: Morpheus (content side) or Snake Eyes (keyword/technical side)?
- "schema markup" → Snake Eyes
- "broken links" → Snake Eyes

### "tech stack" disambiguation (NEW)
"Tech stack" defaults to Neo (system-design skill). Exceptions:
- IF request mentions AI / agent / immersive / 3D / experience tech → Gibson (ai-product-architecture)
- IF request says "feasibility" / "ensure feasibility" / "can we build this" → Neo ALWAYS wins (Neo owns shipping reality)
- IF request is for a hybrid AI experience stack (e.g. "AI-driven 3D world stack") → Gibson + Neo collaborate, Snape clarifies if scope is unclear

Default: Neo.

### Handoff inference rule (Kevin's call)
Kevin typically says "I'm good" or "ready to move to the next phase" when he's done. Tár listens for those.

**If Kevin doesn't explicitly say it**, Tár infers a handoff readiness when:
- A subagent has delivered a complete output
- The user's next message pivots to a new topic OR asks "what's next"
- A long silence follows a subagent's output (in agent-mode, this is the user not engaging further)

**Inference action**: Tár asks the user, "Ready to move to the next phase, or do you want to keep working with [current subagent]?"

Never assume — always confirm.

### Advise-first consultation pattern (NEW — cross-cutting rule)

When a request contains consultation framing words, the responsible subagent does NOT execute immediately. Instead, the subagent presents options + trade-offs first, awaits user decision, then executes.

**Trigger words for advise-first:**
- "advise", "please advise", "give me advice"
- "what's the best way", "what's the right approach", "should I"
- "recommend", "recommendation", "what do you suggest"
- "options for", "ways to", "approaches to"
- "what's the most [adjective] way" (lightweight, scalable, efficient, etc.)

**Protocol:**
1. The subagent that would handle the build receives the request
2. Instead of building, the subagent produces a recommendation doc with:
   - 2-4 viable approaches
   - Trade-offs for each (effort, performance, scalability, cost, complexity)
   - The subagent's recommended pick + why
3. User responds with their choice (or asks follow-up questions)
4. Subagent executes the chosen approach

**Especially important for:**
- Gibson (multiple tech stack choices: Three.js vs Lottie vs AI-generated vs CSS)
- Neo (multiple platform choices: Sitecore vs LWC vs AEM vs custom)
- Snape (multiple design system patterns)
- Sherlock (multiple research methods)

**Exception:** if the request also contains compound signal phrases ("full product approach", "end-to-end") or explicit execution commands ("build it", "ship it"), the user has signaled they want execution, not advice. In that case, skip advise-first and execute directly.

---

## Tár's routing algorithm (updated)

For each incoming request, Tár does this in order:

1. **Check memory** — has this project/domain been touched before? Use prior context to bias routing.
2. **Detect compound request** — does the request bundle multiple deliverables across subagents/chains?
   - IF YES → switch to Compound Request Protocol (see CHAINS.md "Compound request handling")
   - IF NO → continue with single-request routing
3. **Scan for explicit Snake Eyes invocation** — if user names a specialist skill, deploy Snake Eyes directly.
4. **Scan for primary triggers across all 7 active subagents** (Tár, Snape, Sherlock, Gibson, Neo, Morpheus, Gandalf).
5. **If exactly one character has a primary trigger** — route immediately.
6. **If multiple characters have primary triggers AND it's NOT a compound request** — apply anti-triggers to eliminate, then disambiguation rules ("design", "audit", "SEO") to resolve. If still ambiguous → Snape voices the clarifier.
7. **If no primary triggers, only context-dependent** — most specific match wins. If tied → Snape clarifies.
8. **If a chained subagent identifies a Gandalf skill mid-work** — that subagent calls Gandalf as a tool, gets the refined output, continues.
9. **Listen for handoff signals** (explicit or inferred) to chain forward.

### Compound request detection

A request is COMPOUND when ANY of:
- Multiple primary triggers from DIFFERENT subagents fire (e.g. Sherlock + Snape + Morpheus all match)
- Request lists multiple deliverables explicitly (commas, "and", "plus", "with")
- Request spans entry conditions for more than one chain
- Request uses bundle phrases like "I need X and Y and Z" or "give me A, B, and C"
- **Request contains "full product approach", "full build", "end-to-end", "the whole stack", "soup to nuts", "from scratch to launch", "complete solution" — these ALWAYS trigger compound regardless of trigger count**

When compound is detected, Tár:
1. Parses the request into a deliverable map
2. Presents the bundle plan in a single message before executing
3. Auto-composes chains without inter-chain clarification (the compound request IS the consent)
4. Snape only clarifies if mid-flight a specific question needs answering (not for chain handoffs)

See CHAINS.md "Compound request handling" for full protocol.

---

## What's locked vs what comes next

**Locked in this doc:**
- 7 active subagents + Snake Eyes
- Snape's clarifier role (voice + template)
- Gandalf as peer + tool
- "design" defaults to Snape
- "audit" defaults to Sherlock
- "SEO" soft-routes to Snake Eyes
- Handoff inference rule

**Phase 2.2 (next):** chain decision trees. Now that we have triggers and Gandalf, the chains look like:
- Discovery flow: Sherlock → (Snape OR Gibson, with Gandalf called for taste) → Neo (with Gandalf for harden/polish) → Morpheus
- Brand build flow: Sherlock → Snape (calls Gandalf) → Neo (calls Gandalf) → Morpheus
- Experience build flow: Sherlock → Gibson (calls Gandalf for imagegen) → Neo → Morpheus
- Delivery flow: Sherlock → Snape → Neo (calls Gandalf for harden) → Morpheus

**Phase 2.3:** shared-skill disambiguation matrix.

**Phase 2.4:** stress test with Kevin's 15-20 real requests.

**Phase 2.5:** failure-mode playbook (including Snape's exact clarifying phrases).
