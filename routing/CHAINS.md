# DZNR Chain Decision Trees

**Phase 2.2 of the DZNR routing system**
**Status:** Draft v1: rigorous deterministic chains, Snape voices all user-facing questions
**Last updated:** 2026-05-18

This document defines the explicit decision trees Tár walks for multi-subagent requests. Each chain has entry conditions, step-by-step branches, Gandalf call points, exit conditions, and interruption rules.

**Core principles (locked):**
- Rigorous and deterministic: same request type produces same routing every time
- Snape voices all user-facing clarifying questions (not Tár, not the current subagent)
- Gandalf is called as a tool by other subagents OR routed to directly by Tár
- Tár pauses and asks (via Snape) when a chain hits an unmodeled condition

---

## How to read this document

Each chain has the same five sections:

1. **Entry conditions**: what trigger combinations put a request on THIS chain
2. **Decision tree**: node-by-node walkthrough with branch conditions
3. **Gandalf call points**: explicit moments where a subagent should pull Gandalf in
4. **Exit conditions**: how Tár knows the chain is complete
5. **Interruption rules**: what happens if the user skips ahead, restarts, or pivots

**Notation:**
- `→` means "next step in the chain"
- `IF / ELSE IF / ELSE` means deterministic branching based on observable conditions
- `<Snape clarifies>` means Snape voices the clarifying question to the user, using terse/precise/slightly-impatient voice
- `[GANDALF]` marks a Gandalf call point

---

## Chain 1: Discovery Flow

**Purpose:** User has an idea, problem, or opportunity but no clear direction. Outcome: a brief, audit, or recommendation that informs what to build next.

### Entry conditions
A request matches the Discovery chain when ANY of:
- Primary Sherlock triggers fire AND no Neo "build" / Morpheus "pitch" triggers present
- User says: "I have an idea", "help me think through", "what should we work on", "discover", "audit", "understand"
- User provides input material (a brand, a site, transcripts) and asks "what does this tell us"

### Decision tree

```
NODE 1: Sherlock receives the request

  Sherlock determines the discovery type by scanning for sub-triggers:

  IF request contains "competitive" / "competitor"
    → Sherlock uses competitive-brief skill
  ELSE IF request contains "site" / "website" / "URL" / link to a site
    → Sherlock uses site-audit
  ELSE IF request contains "users" / "interviews" / "research" / "personas"
    → Sherlock uses user-research / research-synthesis / synthetic-audience
  ELSE IF request is "I have an idea"
    → Sherlock uses idea-to-brief
  ELSE
    → Sherlock uses discovery skill as catch-all

  [GANDALF call point]
  IF Sherlock's output needs sharper distillation
    → Sherlock calls Gandalf for `distill` or `extract` or `clarify`

  Sherlock produces: findings doc, audit report, or brief

NODE 2: Determine downstream chain

  Tár scans Sherlock's output for handoff signal:

  IF Sherlock's findings call for visual/brand work
    → Go to NODE 3A (Snape)
  ELSE IF Sherlock's findings call for an experience/AI product
    → Go to NODE 3B (Gibson)
  ELSE IF Sherlock's findings call for delivery work (specs, code)
    → Go to NODE 3C (Neo)
  ELSE IF Sherlock's findings call for outbound (pitch, story, campaign)
    → Go to NODE 3D (Morpheus)
  ELSE IF findings are ambiguous (multiple downstream options viable)
    → <Snape clarifies>: "Sherlock's discovery is complete. The next step could be [X] or [Y]. Which path?"

NODE 3A: Snape (brand build path): branches to Chain 2

NODE 3B: Gibson (experience build path): branches to Chain 3

NODE 3C: Neo (delivery path): branches to Chain 4

NODE 3D: Morpheus (outbound path)
  IF discovery output IS the deliverable (i.e. user wanted the audit/brief as the final artifact)
    → END chain. Hand findings to user directly.
  ELSE
    → Morpheus packages findings as deck/report/campaign
```

### Gandalf call points (Discovery flow)
- Sherlock → Gandalf for `distill`, `extract`, `clarify`, `normalize`, `critique`, `audit` (workshop version)
- If proceeding to Snape (3A): Snape may call Gandalf for `design-taste-frontend` to evaluate design direction
- If proceeding to Morpheus (3D): Morpheus may call Gandalf for `quieter` to tone down language

### Exit conditions
- Sherlock's deliverable is what the user wanted → chain ends at NODE 1 output
- A downstream chain (2, 3, or 4) is triggered → control transfers to that chain
- User says "I'm good" / "ready for next phase" → Tár asks (via Snape) what's next

### Interruption rules
- User says "skip the research" → Snape clarifies: "Skipping Sherlock will lose [X context]. Confirm skip?"
- User pivots topic mid-discovery → Tár pauses Sherlock, asks (via Snape) if this is a new request or related
- User provides new input material mid-chain → Sherlock incorporates without restart

---

## Chain 2: Brand Build Flow

**Purpose:** Build or evolve a brand/design system from research input through to shipped components and a launch story.

### Entry conditions
A request matches the Brand Build chain when ANY of:
- Primary Snape triggers fire AND request implies a full build (not just a critique)
- User says: "build the brand", "create a design system", "we need a brand for [X]", "brand from scratch"
- Coming from Chain 1 NODE 3A (Sherlock handoff to brand work)

### Decision tree

```
NODE 1: Snape receives the request

  Snape determines the brand build scope:

  IF no existing brand input → use brand-from-scratch
  ELSE IF existing brand assets (logo, refs, vibe board) → use brand-from-scratch (Phase 1 modes)
  ELSE IF existing design system needs evolution → use design-systems + design-language
  ELSE IF Figma file involved → use figma-* skills
  ELSE → <Snape clarifies>: "What do you have to work with: a vibe, an existing brand, a Figma file, or nothing yet?"

NODE 2: Snape produces the brand foundation

  Outputs: brand voice + design language + tokens + initial components

  [GANDALF call point: almost always triggered here]
  Snape calls Gandalf for:
    - `design-taste-frontend`: evaluate visual direction
    - `gpt-taste` OR `stitch-design-taste`: second-pass taste check
    - `polish`: refine output
    - IF brand needs unique aesthetic → `brandkit`, `industrial-brutalist-ui`, `minimalist-ui`, etc.

NODE 3: Determine build vs handoff

  IF user wants the brand spec/system as the deliverable
    → END chain at Snape's output (no Neo step)
  ELSE IF user wants components shipped in code
    → Go to NODE 4 (Neo)
  ELSE
    → <Snape clarifies>: "Brand is defined. Do you want shipped components or just the spec/system?"

NODE 4: Neo receives the brand spec

  Neo determines target platform:

  IF Sitecore / XM Cloud / JSS → use xcm-spec-generator + xcm-component-gen
  ELSE IF Salesforce / LWC → use xcm-component-gen (LWC variant)
  ELSE IF AEM → use aem skill
  ELSE IF generic React/web → use repo-scaffold + web-artifacts-builder
  ELSE → <Snape clarifies>: "Which platform should Neo target?"

  [GANDALF call point]
  Neo calls Gandalf for:
    - `harden`: security/edge case hardening
    - `polish`: code polish
    - `fixing-accessibility`: a11y remediation
    - `fixing-motion-performance`: perf tuning

NODE 5: Determine launch step

  IF user wants the build as the deliverable
    → END chain at Neo's output
  ELSE
    → Go to NODE 6 (Morpheus)

NODE 6: Morpheus packages the launch

  Morpheus determines outbound type:

  IF launching to internal stakeholders → stakeholder-update / status-report
  ELSE IF launching to client → pitch / pitch-script
  ELSE IF launching to public/users → campaign-plan / content-creation / email-sequence
  ELSE → <Snape clarifies>: "Who is this launch for: internal team, client, or public?"

  END chain.
```

### Gandalf call points (Brand Build flow)
- Snape → Gandalf for design-taste, gpt-taste, polish, aesthetic recipes (almost always)
- Neo → Gandalf for harden, polish, fixing-accessibility, fixing-motion-performance
- Morpheus → Gandalf for `quieter` if tone needs softening

### Exit conditions
- User wants brand spec only → end at NODE 2/3
- User wants shipped components → end at NODE 4/5
- User wants full launch → end at NODE 6
- User says "I'm good" / "ready for next phase" at any point → Tár asks (via Snape) what's next

### Interruption rules
- User says "skip Neo, just give me the design system" → end after Snape
- User says "make this for X platform" mid-Neo → restart NODE 4 with new platform branch
- User wants to iterate on Snape's output → loop back to NODE 1 with refinement request

---

## Chain 3: Experience Build Flow

**Purpose:** Build an immersive, 3D, AI-driven, or spatial experience from concept through to launch.

### Entry conditions
A request matches the Experience Build chain when ANY of:
- Primary Gibson triggers fire AND request implies a full build
- User says: "build an experience", "immersive [X]", "interactive installation", "AI experience", "3D world"
- Coming from Chain 1 NODE 3B

### Decision tree

```
NODE 0: Prototype Prerequisites Check (MANDATORY, applies to all prototype builds)

  Before Gibson begins ANY prototype build, verify two prerequisites are present:

  A. Persona / audience definition
     IF project memory contains a defined persona OR synthetic audience
       → Prerequisite A satisfied. Continue.
     ELSE IF user provided persona context in the request ("target audience is X",
             "for [demographic]", "primary user is [role]")
       → Prerequisite A satisfied. Continue.
     ELSE
       → Escalate to Sherlock for synthetic-audience OR user-research
       → Sherlock produces the persona/audience artifact
       → Persona written to project memory
       → Continue to Prerequisite B

  B. User journey
     IF project memory contains a journey map for this feature/experience
       → Prerequisite B satisfied. Continue to NODE 1.
     ELSE IF user provided journey context in the request ("the user flow is X",
             "they enter via Y then Z")
       → Prerequisite B satisfied. Continue to NODE 1.
     ELSE
       → Escalate to Gibson (via journey-mapping skill, since Gibson owns
         experience journeys) OR Sherlock (via journey-mapping, for user
         journeys). Snape clarifies which if ambiguous.
       → Journey artifact produced
       → Journey written to project memory
       → Continue to NODE 1

  NEITHER prerequisite is optional. Prototype builds without both are blocked.
  See the "Prototype Prerequisites Rule" in the Cross-chain rules section.

NODE 1: Gibson receives the request

  Gibson determines the experience type:

  IF "immersive" / "narrative" / "story world" → use immersive-experience-design
  ELSE IF "interactive installation" / "live" → use live-experience
  ELSE IF "3D" / "Three.js" / "WebGL" → use 3d-experience-design + webgl-threejs
  ELSE IF "AI product" / "AI agent" → use ai-product-architecture
  ELSE IF "AI experience" / "in-world AI" → use experience-output-design + ai-product-prompting
  ELSE → <Snape clarifies>: "What kind of experience: immersive narrative, live installation, 3D web, AI product, or AI-driven story world?"

NODE 2: Gibson produces the concept + architecture

  Outputs: experience design doc, architecture spec, prototype direction

  [GANDALF call point]
  Gibson calls Gandalf for:
    - `imagegen-frontend-web` OR `imagegen-frontend-mobile`: hero visuals for the experience
    - `image-to-code`: turn concept boards into prototype code
    - `animate` / `delight` / `overdrive`: motion treatments
    - `full-output-enforcement`: ensure concept covers all needed outputs

NODE 3: Determine prototype vs handoff

  IF user wants the concept/architecture as the deliverable
    → END chain at Gibson's output
  ELSE IF user wants a working prototype
    → Gibson produces prototype using webgl-threejs / web-artifacts-builder / web-animation
    → Continue to NODE 4
  ELSE IF user wants production code
    → Go to NODE 4 (Neo) directly

NODE 4: Neo builds production version

  Same platform branching as Chain 2 NODE 4.

  [GANDALF call point]
  Neo calls Gandalf for harden, polish, fixing-accessibility, fixing-motion-performance.
  Especially important for experience builds: fixing-motion-performance is almost always needed.

NODE 5: Determine launch step

  IF launch is part of the experience (e.g. "the launch IS the experience")
    → Gibson + Morpheus collaborate
    → <Snape clarifies>: "Should the launch be the experience itself, or a separate announcement?"
  ELSE
    → Go to NODE 6 (Morpheus)

NODE 6: Morpheus packages the launch

  Same branching as Chain 2 NODE 6, but adapted for experience context:
  - For experiences, default to a `pitch` deck + `case-study` + `campaign-plan`
  - Internal experience launches: stakeholder-update

  END chain.
```

### Gandalf call points (Experience Build flow)
- Gibson → Gandalf for imagegen-*, image-to-code, animate, delight, overdrive
- Neo → Gandalf for harden, polish, fixing-motion-performance (critical for experiences)
- Morpheus → Gandalf for high-end-visual-design if visuals for the pitch matter

### Exit conditions
- User wants concept/architecture only → end at NODE 2
- User wants prototype → end at NODE 3
- User wants production → end at NODE 4
- User wants full launch → end at NODE 6

### Interruption rules
- User says "show me a prototype first" mid-NODE 2 → Gibson produces a quick prototype before continuing architecture
- User pivots from immersive to AI product mid-chain → restart at NODE 1 with new branch
- User wants Gibson to "make it feel more like X" → loop with refinement, call Gandalf for taste/aesthetic

---

## Chain 4: Delivery Flow

**Purpose:** Receive design input (typically Figma + brief), produce specs → user stories → code → QA → ship.

**Rigorous deterministic**: this is your day job, predictability is paramount.

### Entry conditions
A request matches the Delivery chain when ANY of:
- Primary Neo triggers fire (Sitecore, Salesforce, XM Cloud, AEM, spec, scaffold)
- User says: "build this component", "generate the spec", "we got Figma from design", "XM Cloud", "LWC"
- Coming from Chain 1 NODE 3C or Chain 2 NODE 4

### Decision tree

```
NODE 0: Prototype Prerequisites Check (MANDATORY, applies to all prototype builds)

  Applies when the Delivery chain will produce a working prototype (not spec-only,
  not stories-only, not documentation). If NODE 5 (component code) will be reached
  and the output is a working demo, prototype, or shippable artifact:

  A. Persona / audience definition
     IF project memory contains a defined persona OR synthetic audience
       → Prerequisite A satisfied. Continue.
     ELSE IF user provided persona context in the request
       → Prerequisite A satisfied. Continue.
     ELSE
       → Escalate to Sherlock for synthetic-audience OR user-research
       → Persona written to project memory
       → Continue to Prerequisite B

  B. User journey
     IF project memory contains a journey map for this feature
       → Prerequisite B satisfied. Continue to NODE 1.
     ELSE IF user provided journey context in the request
       → Prerequisite B satisfied. Continue to NODE 1.
     ELSE
       → Escalate to Sherlock (user journeys) OR Gibson (experience journeys)
         via journey-mapping. Snape clarifies which if ambiguous.
       → Journey written to project memory
       → Continue to NODE 1

  Spec-only work (NODE 2 exit, NODE 3 exit) is exempt from this rule.
  Documentation, code review, and QA-only work are exempt.
  Working prototypes and shippable code are NOT exempt.
  See the "Prototype Prerequisites Rule" in the Cross-chain rules section.

NODE 1: Neo determines target platform

  IF Sitecore / XM Cloud / JSS → use xcm-spec-generator (Sitecore variant)
  ELSE IF Salesforce / LWC → use xcm-spec-generator (Salesforce variant)
  ELSE IF AEM → use aem skill
  ELSE → <Snape clarifies>: "Which platform: Sitecore XM Cloud, Salesforce, AEM, or other?"

NODE 2: Generate spec from input

  IF input is Figma URL/file
    → Neo uses xcm-spec-generator with Figma input
    → [GANDALF call point: Snape (not Gandalf here): Snape reviews design fidelity if needed]
  ELSE IF input is a brief/PRD
    → Neo uses xcm-spec-generator with brief input
    → IF Figma is referenced in brief → fetch Figma → process as above
  ELSE → <Snape clarifies>: "What's the spec input: Figma, written brief, or both?"

NODE 3: Generate user stories + acceptance criteria

  Neo uses xcm-user-stories.
  Output: sprint-ready stories with JTBD framing + acceptance criteria.

  [GANDALF call point]
  Neo calls Gandalf for `clarify` if stories are vague.

NODE 4: Validate spec accuracy (Layer 1 validation)

  Neo uses xcm-validation (spec accuracy layer).

  IF validation passes
    → continue to NODE 5
  ELSE IF validation flags spec/Figma mismatch
    → Snape reviews design intent (NOT Gandalf: Snape owns design-system semantics)
    → Resolve → re-run NODE 4

NODE 5: Generate component code

  Neo uses xcm-component-gen.

  IF Sitecore → produce JSS component + TypeScript + serialization
  ELSE IF Salesforce → produce LWC + Apex
  ELSE IF AEM → produce HTL + Sling Model

  [GANDALF call point: REQUIRED]
  Neo calls Gandalf for:
    - `harden`: security/edge case hardening (mandatory)
    - `polish`: code polish (mandatory)
    - `fixing-accessibility`: a11y (mandatory)
    - `fixing-motion-performance`: perf (if motion exists)

NODE 6: Validate visual fidelity (Layer 2 validation)

  Neo uses xcm-validation (visual fidelity layer) at desktop/tablet/mobile.

  IF passes → continue to NODE 7
  ELSE → loop back to NODE 5 with fixes

NODE 7: Generate QA handoff package

  Neo uses qa-handoff.
  Output: test scenarios, edge cases, browser matrix, a11y checklist, n8n payload.

NODE 8: Assemble context package for offshore

  Neo uses xcm-context-package.
  Output: complete offshore handoff with spec + stories + QA + Loom script.

NODE 9: Sprint communications

  Morpheus picks up:
    - stakeholder-update for the sprint cycle
    - status-report for project leadership

  END chain.
```

### Gandalf call points (Delivery flow)
- Neo → Gandalf for `clarify` at story generation
- Neo → Gandalf REQUIRED for `harden`, `polish`, `fixing-accessibility` after component gen
- Neo → Gandalf for `fixing-motion-performance` if motion is present
- Note: Snape, not Gandalf, owns design-fidelity reviews in Delivery flow

### Exit conditions
- Each NODE has its own potential exit if that's all the user wanted:
  - NODE 2 → if user wants spec only
  - NODE 3 → if user wants stories only
  - NODE 5 → if user wants code only (without QA)
  - NODE 7 → if user wants QA package only
  - NODE 8 → if user wants full offshore package
  - NODE 9 → if user wants sprint comms too
- Default end: NODE 8 (full offshore package). NODE 9 is opt-in.

### Interruption rules
- User says "spec only" → end after NODE 4
- User says "skip QA" → end after NODE 6 (visual fidelity validated, but no QA package)
- Validation failures (NODE 4 or 6) loop back: never proceed with failures
- User says "this is broken, fix it" mid-chain → Snape clarifies what's broken, then route fix to right node

---

## Chain 5: SEO Flow (specialist)

**Purpose:** SEO-flavored work that may belong to Snake Eyes (audit/keyword), Morpheus (content), or both.

### Entry conditions
A request matches the SEO Flow when ANY of:
- "SEO" is the primary topic in the request
- User says: "SEO audit", "keyword research", "schema markup", "broken links", "rank for [X]"

### Decision tree

```
NODE 1: Classify SEO request type

  IF request is "SEO audit" / "technical SEO" / "schema markup" / "broken links" / "keyword clustering"
    → Snake Eyes (soft-route, no clarification needed)
    → Use searchfit-seo:* skills as appropriate
  ELSE IF request is "SEO content" / "SEO copy" / "write SEO articles"
    → <Snape clarifies>: "Is this SEO content (Morpheus) or keyword/technical research (Snake Eyes)?"
  ELSE IF request is "AI visibility" / "rank in ChatGPT" / "rank in Claude"
    → Snake Eyes (searchfit-seo:ai-visibility)
  ELSE IF request is "content strategy" with SEO undertone
    → Snake Eyes for keyword research first → Morpheus for content creation
  ELSE → <Snape clarifies>: "What's the SEO outcome you want: audit, content, technical fixes, or strategy?"

NODE 2: Execute the chosen specialist path

  Snake Eyes path:
    - searchfit-seo:seo-audit (overall audit)
    - searchfit-seo:technical-seo (technical specifics)
    - searchfit-seo:keyword-clustering (keyword work)
    - searchfit-seo:schema-markup (structured data)
    - searchfit-seo:ai-visibility (AI search)
    - searchfit-seo:broken-links (link cleanup)
    - searchfit-seo:on-page-seo (per-page optimization)

  Morpheus path:
    - searchfit-seo:content-brief (briefing for content)
    - searchfit-seo:content-strategy (strategic planning)
    - searchfit-seo:create-content (actual content generation)
    - searchfit-seo:content-translation (i18n SEO)

NODE 3: Determine if cross-handoff needed

  IF Snake Eyes audit reveals content gaps → handoff to Morpheus
  IF Morpheus content needs SEO structure → handoff to Snake Eyes for schema-markup
  ELSE → END chain
```

### Gandalf call points (SEO flow)
- None typical. SEO is specialist work. Gandalf is rarely involved.

### Exit conditions
- Specialist task complete → return result to user
- Cross-handoff needed → execute handoff, then end

### Interruption rules
- User says "I just want the audit" → end after NODE 2 (Snake Eyes audit)
- User says "I want articles, not an audit" → restart at NODE 1 with Morpheus path

---

## Chain 6: Innovation Accelerator (NEW: Gandalf orchestrates)

**Purpose:** Kevin's signature client engagement methodology. From fuzzy idea to development-ready specification in 2 days plus pre-work. 5 stages, 15 named AI agents, 10+ deliverables.

**Critical:** This is the **only chain in DZNR where Gandalf orchestrates other subagents instead of being called by them.** Documented exception. See `agents/gandalf/AGENT.md` for the inverse orchestration pattern.

### Entry conditions

A request matches Chain 6 (Innovation Accelerator) when ANY of:
- Explicit "innovation accelerator" / "IA workshop" / "IA for [client]" language
- "Run the accelerator" / "fire the accelerator" / "2-day accelerator"
- "MoSCoW workshop" / "Spec Matrix" / "sign-off workshop" (Stage 3 vocabulary)
- Stage-specific invocations ("ia-prepare", "ia-discover-day1", etc.)
- User explicitly names the methodology by name

**Does NOT match Chain 6:**
- Generic "workshop": routes to Sherlock's hcd-ai-design instead
- Design sprint (Google Ventures style): different methodology, routes to Sherlock
- Innovation strategy consulting: too generic, routes to Sherlock for discovery first

### Decision tree

```
NODE 1: Gandalf receives the request and determines invocation type

  IF user says "innovation accelerator", "run IA", or full-methodology language
    → Master invocation: enter Stage 1 → 5 sequentially
  ELSE IF user says stage-specific language (e.g. "ia-prepare", "Day 1 facilitation")
    → Stage-specific invocation: enter that stage only
  ELSE → <Snape clarifies>: "Run the full IA methodology, or invoke a single stage?"

NODE 2 (Stage 1): Gandalf invokes ia-prepare

  Gandalf calls Sherlock:
    ├─ discover-brand (on client property)
    ├─ site-audit (UX baseline)
    ├─ competitive-brief-pm (product landscape)
    └─ synthetic-audience (early persona drafts)

  Gandalf calls Snape:
    ├─ discover-brand interpretation
    ├─ design-language synthesis
    └─ aesthetic-system read

  Gandalf synthesizes into:
    ├─ Intelligence Brief
    ├─ Tailored Agenda
    └─ Risk & Alignment Flags

  Human checkpoint: Engagement Lead reviews

  IF approved → proceed to NODE 3
  ELSE → loop with adjustments

NODE 3 (Stage 2): Gandalf invokes ia-discover-day1

  Day 1 facilitation runs the 4 activities sequentially:
    ├─ Activity 1: Lightning Talks (25 min): Agent 03
    ├─ Activity 2: Product Vision Workshop (50 min): Agent 04
    ├─ Activity 3: Persona Co-Creation (60 min): Agent 05
    └─ Activity 4: HMW + Voting (60 min): Agents 06+07

  Gandalf calls Morpheus for:
    ├─ Day 1 synthesis report packaging
    └─ Overnight stakeholder check-in template

  Output: vision, personas, problem statement, top 3 priorities

NODE 4 (Stage 3): Gandalf invokes ia-define-day2

  Day 2 facilitation runs the 4 activities sequentially:
    ├─ Activity 5: MoSCoW + Live Spec Matrix (75 min): Agent 09 ⭐
    ├─ Activity 6: User Journey + Gap Analysis (50 min): Agent 10
    ├─ Activity 7: Tech Solutioning + Architecture Brief (50 min): Agent 11
    └─ Activity 8: Stakeholder Alignment & Sign-Off (35 min): Agent 12 ⭐ CRITICAL

  Gandalf calls Snape mid-Activity 7 if design fidelity questions arise
  Gandalf calls Sherlock mid-Activity 6 for journey-mapping support

  SIGN-OFF GATE:
    IF sign-off captured (all stakeholders verbal yes)
      → proceed to NODE 5 (auto-trigger)
    ELSE → invoke failure mode protocol (see ia master skill)

NODE 5 (Stage 4): Gandalf invokes ia-synthesize (auto-triggered by sign-off)

  Gandalf calls Neo for:
    ├─ Linear backlog population (Agent 14)
    ├─ Story-point estimation (Agent 15)
    └─ Dependency mapping into Linear hierarchy

  Gandalf produces:
    ├─ Requirements + Specs doc (Agent 13)
    ├─ Investment Estimate
    └─ Client-facing deliverable packaging (via Morpheus)

  Human validation gate: ISHIR team reviews before client delivery

  IF validation passes → 48-hour delivery to client → proceed to NODE 6
  ELSE → loop with Neo for fixes

NODE 6 (Stage 5): Gandalf hands off to Neo (Chain 4 takes over)

  THIS IS THE EXIT POINT FOR GANDALF'S ORCHESTRATION.

  Neo enters Chain 4 (Delivery flow) with IA inputs:
    ├─ Linear backlog (pre-populated)
    ├─ Architecture Brief
    ├─ Spec Matrix
    └─ Journey + golden path

  Chain 4 NODE 1 (platform detection) reads from Architecture Brief automatically
  Chain 4 proceeds through standard delivery flow

  Morpheus continues client comms (weekly demos, status reports, Friday review meetings)

  END Chain 6. Engagement moves to Chain 4.
```

### Gandalf call points (Chain 6)

Unlike other chains where Gandalf is CALLED by others, in Chain 6 Gandalf CALLS:
- Sherlock (Stages 1, 2-support, 3-support)
- Snape (Stage 1, Day 1/2 design fidelity)
- Morpheus (every stage: deliverables and comms)
- Neo (Stage 4 Linear/estimation, Stage 5 full handoff)

### Exit conditions

- **Stage-only invocation:** chain exits after that stage completes
- **Full methodology:** chain exits at NODE 6 (Stage 5 handoff to Neo Chain 4)
- **Failure-mode exit:** chain pauses at the failure point, awaits user direction
- **User abandonment:** "stop the IA" / "abandon this workshop" → chain ends, partial outputs delivered

### Interruption rules

- **"Skip Stage 1, we have the inputs":** start at NODE 3 (Stage 2). User provides Intelligence Brief equivalent inputs.
- **"Pause between Day 1 and Day 2":** normal: NODE 3 → NODE 4 has a natural overnight gap. Gandalf produces Day 1 synthesis report during the pause.
- **"Sign-off failed":** invoke failure mode protocol. Multiple recovery paths (reschedule, async follow-up, escalate).
- **"Add stakeholder mid-workshop":** Gandalf invokes Snape clarifier: "New stakeholder added: do they need pre-work, or can they sign off based on existing inputs?"
- **"Client requests scope change post-sign-off":** Documented amendment via Agent 12 protocol. Morpheus drafts amendment doc + new sign-off request.

### Composition with other chains

Chain 6 does NOT compose with Chains 1-5: it incorporates them via Gandalf's orchestration. A request that triggers Chain 6 takes precedence over individual chain entry conditions.

Example: "Audit this site and run an IA for them" → Chain 6 wins (IA contains the audit as part of Stage 1).

---

## Compound request handling (NEW: Kevin's call)

Compound requests bundle multiple deliverables that cross subagents or chains into a single ask. Tár handles them as first-class citizens.

### How Tár recognizes a compound request

A request is COMPOUND when ANY of:
- Multiple primary triggers from DIFFERENT subagents fire in the same request
- The request explicitly lists multiple deliverables (commas, "and", "plus", "with", numbered lists)
- The request spans entry conditions for more than one chain
- The request uses phrases like "I need [X] and [Y] and [Z]" or "give me [A], [B], and [C]"

### Tár's compound request protocol

```
STEP 1: Tár parses the request into deliverables
  - Identify each distinct deliverable
  - Map each to the right subagent + skill
  - Identify dependencies between deliverables (what must happen before what)

STEP 2: Tár builds the bundle plan
  - Group parallel work (deliverables that can run simultaneously)
  - Sequence dependent work (deliverable B needs A's output)
  - Mark Gandalf call points
  - Identify the final packaging subagent (usually Morpheus)

STEP 3: Tár presents the plan ONCE before executing
  Format:
  "Compound request detected. Here's the plan:
  
   Phase 1 (parallel via [Subagent]): deliverable 1, 2, 3...
   Phase 2 ([Subagent]): deliverable 4
   Phase 3 ([Subagent]): packaging
   
   Gandalf called for: [list of workshop skills]
   Final artifacts: [list]
   
   Executing: Snape will surface if anything needs clarifying mid-flight."

STEP 4: Tár executes the full sequence
  - Run parallel deliverables concurrently
  - Pass outputs forward to dependent steps
  - Subagents call Gandalf as marked
  - Snape voices any mid-flight clarifications

STEP 5: Tár delivers all artifacts together
  - Single message with links to each artifact
  - Summary of what was done
  - Suggestion for next phase if applicable
```

### Auto-composition rule (Kevin's call)

When a compound request spans MULTIPLE CHAINS (e.g. Discovery + Brand Build + Project Plan), Tár auto-composes the chains without asking between them. The user's compound request IS the consent.

This OVERRIDES the per-chain "Snape clarifies between chains" rule in CHAINS.md when:
- All chain phases are explicitly named in the original request
- No new information is needed to proceed between chains
- The user's request implies they want the bundle

If a chain transition NEEDS new info (e.g. "what platform should Neo target?"), Snape still clarifies that specific question: but not the chain handoff itself.

### Example compound request walkthrough

**User request:** "I need a Discovery and Heuristic analysis for this site, a brand and style breakdown with synthetic audiences and user journeys with a project plan of key opportunity areas"

**Tár's parsing:**
| Deliverable | Subagent | Skill |
|-------------|----------|-------|
| 1. Site Discovery | Sherlock | discovery + site-audit |
| 2. Heuristic analysis | Sherlock | hcd-heuristics |
| 3. Brand & style breakdown | Sherlock + Snape | discover-brand → design-language + aesthetic-system |
| 4. Synthetic audiences | Sherlock | synthetic-audience |
| 5. User journeys | Sherlock | journey-mapping |
| 6. Project plan + opportunity areas | Sherlock + Morpheus | idea-to-brief → product-playbook |

**Bundle plan:**
```
PHASE 1 (parallel, Sherlock-led):
  ├─ Site Discovery (discovery + site-audit)
  ├─ Heuristic analysis (hcd-heuristics)
  ├─ Brand inputs gathered (discover-brand)
  ├─ Synthetic audiences (synthetic-audience)
  ├─ User journeys (journey-mapping)
  └─ Opportunity scan (idea-to-brief)
  [GANDALF: distill, extract, critique on all outputs]

PHASE 2 (Snape, sequential after Phase 1):
  ├─ Brand & style interpretation (design-language + aesthetic-system)
  └─ Connect Sherlock's brand findings to a visual language read
  [GANDALF: design-taste-frontend, gpt-taste]

PHASE 3 (Morpheus, sequential after Phase 1 + 2):
  ├─ Project plan with opportunity areas (product-playbook + presentation-storytelling)
  └─ Connect findings into a roadmap deliverable

FINAL ARTIFACTS (all delivered together):
  1. Site discovery + audit report
  2. Heuristic analysis findings
  3. Brand & style breakdown
  4. Synthetic audience personas
  5. User journey maps
  6. Project plan with opportunity areas
```

**Snape clarifies mid-flight only IF:**
- The site URL is missing or ambiguous
- The brand context is unclear (existing brand vs from scratch)
- A specific audience parameter is needed

Otherwise: bundle executes end-to-end, all 6 artifacts delivered together.

---

## Chain 8: QKI World Asset (NEW, Cheetara owns)

**Purpose:** Generate a single QKI asset (character, place, or object) or a compound set (populate a faction, build out the world) using the QKI engine, generators, and manifest contract. Serialized-world consistency is the north star.

### Entry conditions

A request matches Chain 8 when ANY of:
- Primary Cheetara triggers fire ("create a character", "create a location", "create a weapon", "worldbuilding", "add to the world", "populate the world")
- Explicit pack reference ("in Friends-and-Anarchists", "F&A", "Wound Keeper", "Synthesis")
- QKI-explicit language ("QKI character", "graphic novel style", "sref anchor", "Prime Gate", "Soul Character")
- A world pack is already active in project memory AND the request is a generation verb ("create", "design", "add", "populate")

### Decision tree

```
NODE 1: Cheetara receives the request

  Cheetara loads qki-style-authority (the engine) FIRST.
  This is non-negotiable. No generator runs without the engine loaded.

  IF active world pack is unresolved
    → Snape clarifies: "Which world pack applies? Friends-and-Anarchists, or a new pack we need to author first?"
    → IF user names existing pack: engine loads that pack, continue to NODE 2
    → IF user says "new": route to Chain 9 (New QKI World Pack) instead

NODE 2: Determine asset type

  IF request contains "character", "warrior", "hero", "villain", "person", "figure"
    → Cheetara dispatches qki-character-generator (NODE 3A)
  ELSE IF request contains "location", "environment", "site", "cityscape", "building", "set", "world"
    → Cheetara dispatches qki-place-generator (NODE 3B)
  ELSE IF request contains "weapon", "vehicle", "prop", "gear", "device", "object"
    → Cheetara dispatches qki-object-generator (NODE 3C)
  ELSE IF request is compound ("populate the world", "build the faction")
    → Cheetara orchestrates across all three generators, one shared manifest (NODE 4)
  ELSE
    → Snape clarifies asset type

NODE 3A: qki-character-generator

  Generator drafts character node, confirms with user (name, faction, motion states needed).
  Cheetara hands user the MidJourney hero prompt with QKI sref anchor and pack overrides if any.
  User runs MJ, drops keeper into inbox/character/<id>/.

  [GANDALF call point]
  IF the hero render feels close but not right
    → Cheetara calls Gandalf for `design-taste-frontend` before proceeding

  Cheetara registers Higgsfield Soul Character, captures --cref URL.
  Generator builds sheet (turnaround, expressions, motion states) via Weavy composite.
  Prime Gate applied on every render (loop back on fail).
  Manifest record written.

NODE 3B: qki-place-generator

  Layer 1 FIRST. Cheetara dispatches Blender MCP (or Unreal MCP) to block space and camera.
  IF Blender MCP unavailable
    → Cheetara describes Layer 1 scene in text for user to execute locally, proceeds with description as reference
  Generator drafts location node, confirms with user (faction control, tier, contested state).
  MidJourney establishing shot over the Layer 1 frame with QKI sref anchor.
  User drops keeper into inbox/environment/<id>/.

  [GANDALF call point]
  IF the establishing shot needs a taste pass
    → Cheetara calls Gandalf for `high-end-visual-design` or `gpt-taste`

  Higgsfield reference element registered for the location.
  Detail views, alternate lighting, faction-overlay variants generated.
  Prime Gate applied on every render.
  Manifest record written.

NODE 3C: qki-object-generator

  Generator drafts object node, confirms with user (faction, hero-tier or background, mesh needed).
  Material-led (faction language reads through the material treatment).
  MidJourney hero design with QKI sref anchor and faction material overrides.
  User drops keeper into inbox/<vehicle|weapon|prop>/<id>/.

  [GANDALF call point]
  IF the hero design needs critique before locking
    → Cheetara calls Gandalf for `critique`

  IF hero-tier: Higgsfield reference element registered.
  Orthographic angles, detail callouts generated.
  IF mesh needed: Weavy Tripo / Meshy mesh generation from the design sheet.
  Prime Gate applied on every render.
  Manifest record written.

NODE 4: Compound orchestration (populate the world)

  Cheetara orchestrates the three generators in sequence: character → place → object.
  One shared manifest for the compound run.
  Same Prime Gate discipline on every render.
  Same identity lock discipline on every hero asset.
  User confirms per-generator handoff or authorizes auto-proceed.

NODE 5: Chain complete

  All assets have manifest entries.
  All hero characters/objects have identity locks (Higgsfield Soul Character or reference element, plus MJ --cref).
  All renders passed Prime Gate.
  Cheetara returns control to Tár.
```

### Gandalf call points (recap)

- `design-taste-frontend` on close-but-not-landing character renders
- `high-end-visual-design` or `gpt-taste` on establishing shots for luxury or premium pack postures
- `critique` on hero object designs before manifest lock

### Exit conditions

- All requested assets have manifest entries tagged with pack, faction, motion state, layer, source tool, and identity lock reference
- All renders passed the Prime Gate
- User confirms the delivery OR chain silence for one message (Tár asks whether to route downstream to Gibson for experience layer or Neo for shipping)

### Interruption rules

- **Prime Gate fail three times on same asset:** Cheetara voices the gap and asks whether pack sref needs a per-pack override
- **Pack ambiguity mid-chain:** Snape clarifies; chain pauses until resolved
- **MidJourney unavailable:** Cheetara pauses hero pass; does NOT fall back to another tool for hero renders (the QKI hero anchor lives in MJ)
- **Higgsfield unavailable:** Cheetara continues with MJ --cref only, flags weaker lock in manifest
- **User pivots to a new pack mid-chain:** Cheetara re-loads the engine with the new pack, restarts asset generation. Prior partial assets stay in inbox for user to keep or discard.

---

## Chain 9: New QKI World Pack (NEW, Cheetara owns)

**Purpose:** Author or extract a new world pack so future QKI generation can render against it. Required prerequisite when a user starts a new world and no pack exists.

### Entry conditions

A request matches Chain 9 when ANY of:
- "new world", "set up a palette", "use these colours", "author a pack"
- User uploads a palette file, a moodboard, or a brand reference and asks for a QKI world
- Chain 8 attempted to run and Cheetara escalated because no pack was resolvable

### Decision tree

```
NODE 1: Cheetara determines pack input type

  IF user uploaded a pack file directly
    → Validate against pack schema (qki-style-authority/references/world-pack-schema.md)
    → Skip to NODE 3
  ELSE IF user pasted named colours plus temperament per faction
    → Cheetara maps to pack schema, drafts pack file
    → Continue to NODE 2
  ELSE IF user uploaded a moodboard or brand reference
    → Cheetara calls Snape for palette extraction (via brand-from-scratch or ds-theming)
    → Snape extracts palette, returns to Cheetara
    → Cheetara maps to pack schema, drafts pack file
    → Continue to NODE 2

NODE 2: Confirm pack with user

  Cheetara presents the drafted pack (palette per faction, material temperament, motion state overrides).
  User confirms or requests adjustments.
  Iterate until confirmed.

NODE 3: Validate and register

  Cheetara validates the pack against qki-style-authority's schema.
  Writes pack to `<world>/packs/<pack-id>.md`.
  Sets the pack as active in project memory.

NODE 4: Ready for Chain 8

  Cheetara returns control to Tár with the pack active.
  Tár resumes Chain 8 (asset generation) if that was the origin request.
```

### Gandalf call points

- `critique` on the drafted pack before user confirmation (optional; useful when the pack is boundary-pushing)
- `high-end-visual-design` when the pack is intended for luxury or premium worlds and needs a taste pass on the palette

### Exit conditions

- A validated pack exists in `packs/<pack-id>.md`
- The pack is active in project memory
- If Chain 9 was reached via Chain 8 escalation: Chain 8 resumes

### Interruption rules

- **Pack input is genuinely absent (user says "just make one up"):** Cheetara does NOT invent a pack. Voices the gap: "A world pack needs at least a palette direction and one faction. Give me a colour direction and a faction temperament, and I will draft from there."
- **Snape extraction returns ambiguous palette:** Cheetara asks user to pick the two-to-three dominant tones before continuing
- **Pack fails schema validation:** Cheetara loops back to NODE 2 with the specific field that failed

---

## Cross-chain rules

These apply across ALL chains, not specific to one.

### Prototype Prerequisites Rule (mandatory, added v2.1.0)

Every prototype build must be preceded by two artifacts existing in project memory (or provided inline in the request):

1. **A persona or synthetic audience definition** (who this prototype is for)
2. **A user journey** (how they arrive, what they do, what they leave with)

Applies to Chain 3 NODE 0 (Gibson experience builds) and Chain 4 NODE 0 (Neo delivery builds). Both chains enforce the check before any build work begins.

**Rationale:** prototypes that ship without persona and journey context tend to solve the wrong problem beautifully. The prerequisites make the who/what/why/how comprehensive so the prototype earns whatever attention it gets.

**What counts as satisfying the rule:**

- **Persona:** a Sherlock synthetic-audience artifact, a user-research artifact, or an explicit inline description in the request (`target audience is $200k+ urban professionals aged 30 to 45`)
- **Journey:** a journey-mapping artifact from Sherlock or Gibson, or an explicit inline description in the request (`user arrives from a Google search, scans the pricing page, signs up on mobile, verifies email, first login`)

**What does NOT count:**

- Vague audience references ("designers", "developers", "users") without demographic, psychographic, or contextual specificity
- Vague journey references ("they use the product") without a step-by-step flow

**What is exempt:**

- Spec-only work (Chain 4 exit at NODE 2)
- Story-only work (Chain 4 exit at NODE 3)
- Documentation, code review, and QA-only work
- Cheetara's QKI asset generation (worldbuilding is not prototype construction)
- Gandalf's polish, harden, and workshop passes on existing code (not a new prototype)
- Morpheus's outbound work on completed prototypes (the persona/journey context should already exist upstream)

**Missing prerequisite handling:**

- Neo or Gibson escalates the missing prerequisite to Sherlock (personas via `synthetic-audience` or `user-research`) or to Sherlock/Gibson (journey via `journey-mapping`, ambiguity resolved by Snape clarifier)
- The persona and journey artifacts are produced first, written to project memory, then the build resumes
- Nobody is blocked from shipping; they are routed to add the missing context

**How the artifacts feed downstream:**

- Persona informs Neo's spec (edge cases, accessibility considerations, device targeting) and Gibson's experience architecture (participant emotional state, cognitive load, session length)
- Journey informs Neo's user story structure (jobs-to-be-done framing, acceptance criteria) and Gibson's flow architecture (entry point, navigation model, exit state)
- Both artifacts feed Morpheus's downstream pitch (per-claim attribution now cites persona and journey by name)

**Cheetara exemption note:** QKI worldbuilding generates assets for serialized worlds, not user-facing prototypes. Personas and journeys do not apply to the same-shape work. If a QKI asset is downstream from an experience that has a persona and journey, Cheetara reads those from the manifest context; the rule is enforced at the experience level (Gibson), not the asset level (Cheetara).

### Memory check (always first)
Before entering any chain, Tár checks memory for:
- Recent project context that biases routing
- Prior decisions about which chain this user/project uses
- Recurring patterns ("you usually want spec only, confirm this time?")

### Gandalf override priority
When a subagent has a skill that duplicates a Gandalf workshop skill, **Gandalf wins**. Example: if Neo's standard skill list includes a generic `polish` AND Gandalf has Kevin's `polish` workshop skill, Neo calls Gandalf's version.

### Snape clarification template (locked from Phase 2.1)
Snape's voice when chains hit ambiguity:
> "[Subagent or chain context]'s [completed/in-progress/blocked]. The next step could be [X] or [Y]. Which path?"
>
> Voice: terse, precise, slightly impatient. Never warm. Never apologetic.

### Handoff signal listening
Tár listens for these explicit phrases to advance the chain:
- "I'm good" / "good here" / "looks good"
- "ready for next phase" / "ready to move on" / "next step"
- "done" / "that's it"
- "what's next" (signals readiness for handoff)

When NOT explicit, Tár infers handoff readiness when:
- Subagent's output is complete (deliverable produced)
- User's next message pivots topic or asks for status

**Inference action:** Tár asks (via Snape) "Ready to move to the next phase, or keep working with [current subagent]?"

### Chain abandonment
User can abandon a chain at any time:
- "stop", "cancel", "let's do something else" → Tár ends current chain, asks what's next
- New unrelated request mid-chain → <Snape clarifies>: "Continue with [current chain] or pivot to [new request]?"

### Multi-chain composition
A single user request can span multiple chains. Example: "Audit our site and build a new design system from it" = Chain 1 (Discovery) → Chain 2 (Brand Build). Tár connects them via the entry conditions of Chain 2.

When chains compose, the handoff is automatic if the entry conditions match. If ambiguous, <Snape clarifies>: "Sherlock's discovery is complete. Should we proceed to brand build (Snape) or stop here?"

---

## What this enables in Phase 2.3 (Shared Skills)

Now that chains are explicit, the shared-skill ownership rules can be more precise. For example:
- `journey-mapping` is owned by Sherlock in Chain 1 NODE 1 (when discovering user journeys)
- `journey-mapping` is owned by Gibson in Chain 3 NODE 1 (when designing spatial/immersive journeys)
- `theme-factory` is owned by Snape in Chain 2 NODE 2
- `theme-factory` is owned by Gibson in Chain 3 NODE 2 if the experience needs a thematic visual system

Phase 2.3 will produce the full shared-skill disambiguation matrix using these chain contexts.

---

## What this enables in Phase 2.4 (Stress Test)

The 15-20 real requests you write will be traced through these decision trees. For each:
- Identify the entry condition
- Walk the tree node by node
- Flag any branch where the tree doesn't model the request well
- Flag any branch where Snape would need to clarify (and check that the question phrasing is sharp)
- Verify Gandalf call points fire when expected

This becomes the canonical test suite for any future routing changes.

---

## Defaults applied (Kevin to flag if any feel wrong)

1. **Chain 4 NODE 4 design fidelity ownership** → Snape owns design semantics, Gandalf owns workshop tools. ✅ Locked.

2. **Cross-handoff in Chain 5 NODE 3** → Snape clarifies once per project. Tár remembers the decision in memory so subsequent SEO requests on the same project auto-route.

3. **Chain 3 NODE 5 "launch IS the experience"** → Keep as a Snape-clarify point. Not auto-routed since this is a high-stakes design decision.

4. **Chain 4 NODE 8 vs NODE 9** → Default end NODE 8 (offshore package). NODE 9 (sprint comms) is opt-in via explicit user request. ✅ Locked.

5. **Chain composition** → Snape clarifies once between chains for a given project. Tár remembers and auto-handoffs on subsequent runs in that project.

6. **Gandalf REQUIRED calls in Chain 4** → Mandatory by default. User can override per-request with explicit phrases like "skip hardening", "speed mode", "rush this". Override is logged in chain output so QA knows.

---

## Status

- ✅ Phase 2.1: Trigger keyword maps (TRIGGERS.md)
- ✅ Phase 2.2: Chain decision trees (this doc)
- ⏭ Phase 2.3: Shared-skill disambiguation matrix
- ⏭ Phase 2.4: Stress test with Kevin's 15-20 real requests
- ⏭ Phase 2.5: Failure-mode playbook (Snape's clarification phrases)
