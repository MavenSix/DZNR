---
workflow: motion-system
name: Motion System
status: complete
version: 1.0
lead: snape
supporting: [gandalf, neo, tar]
chains: [2]
grounded_in:
  - path: "~/dznr-os/packages/tui/src/motion.ts — a motion system that shipped, with its three rules and its seven bindings"
    date: 2026-09-17
  - path: "~/dznr-os/packs/dznr.md — Volt and Flare carry `Motion bias` fields, which is where the bindings came from"
    date: 2026-09-16
  - path: "QKI style authority, seven-state motion grammar (Stillness, Eruption, Flow, Suspension, Collapse, Resonance, Quantum Fracture)"
    date: 2026-09-21
  - path: "Kevin, 2026-09-21: code first and Figma optional; motion.dev then GSAP then CSS; a stage in brand-design-system AND a workflow here"
    date: 2026-09-21
industry_posture_sensitive: false
confidential_default: true
triggers:
  typed: ["motion system for", "animation system for", "motion tokens", "motion principles", "how should this move", "add motion to the design system", "micro-interactions for"]
  spoken: ["Hey DZNR, build the motion system for [brand]", "Hey DZNR, how should [product] move"]
inputs_required:
  - id: brand
    source: memory
    on_missing: ask
  - id: product_states
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Motion principles from the brand's own temperament
    owner: snape
    chain_node: null
    skills: [aesthetic-system]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [dznr-os]
    produces: [a derived motion temperament, and the sentence it was derived from]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s2
    name: Bind a named grammar to real system states
    owner: snape
    chain_node: null
    skills: []
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [dznr-os]
    produces: [one named state per thing the product actually does, each with a meaning in plain words]
    checkpoint: true
    checkpoint_prompt: "Here is every state and what it means in this product. Is anything here a state the product does not have, or a state it has that is missing?"
    gate: null
    exit_allowed: false
  - id: s3
    name: Motion tokens
    owner: snape
    chain_node: 2
    skills: []
    models: null
    tools: [dznr-os]
    produces: [duration, easing, distance and stagger per state, emitted beside the brand's other tokens]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Resting frames and the information rule
    owner: snape
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: [a resting frame per state, and a verdict on what survives reduced motion]
    checkpoint: true
    checkpoint_prompt: "With motion off, here is what each state looks like. Can a person still tell them apart, and does anything they must know depend on movement?"
    gate: null
    exit_allowed: false
  - id: s5
    name: Code implementation
    owner: neo
    chain_node: 4
    skills: [web-animation]
    models: null
    tools: [playwright]
    produces: [the states running, in motion.dev unless the work needs otherwise]
    checkpoint: true
    checkpoint_prompt: "It moves. This is the first time anyone has seen it rather than read it."
    gate: null
    exit_allowed: false
  - id: s6
    name: Prototype for sign-off
    owner: snape
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: [a Jitter prototype, when a client needs to approve motion before code exists]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s7
    name: Performance pass
    owner: gandalf
    chain_node: 4
    skills: [fixing-motion-performance]
    models: null
    tools: [playwright]
    produces: [a measured frame budget on the slowest target that matters]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: code
    dual_with: markdown
  - type: markdown
    dual_with: code
cost_envelope_usd: [0, 0]
time_envelope: "s1 and s2 are the work and are a morning with the brand owner in the room. Tokens an hour. Resting frames half a day and it is the half day people skip. Code one to three days per target. A Jitter prototype is hours and only when a client needs one."
exit_criteria:
  - "Every state names something the product ACTUALLY DOES, in the words a person would use, and s2 was checkpointed against that"
  - "Every state has a resting frame, produced at s4 rather than discovered when someone turned motion off"
  - "Nothing a person must know is carried by movement alone — and the claim is the weak true one, not the strong false one (see below)"
  - "The implementation was WATCHED at s5, not inferred from passing tests"
  - "Motion tokens sit beside the brand's other tokens and were emitted by the same path, so they cannot drift from the palette they were derived with"
memory_writes:
  - "motion.<brand>.states (the bindings, which are the system)"
  - "motion.<brand>.tokens_path"
  - "motion.<brand>.library (and why, when it was not motion.dev)"
open_questions: []
---

# Motion System

## Purpose

Decide how a product moves, as a **named grammar bound to states the product actually has** —
then ship it as running code with a document that explains it.

**This stub said "no past project exists to write it from." That was true on 2026-09-04 and
stopped being true on 2026-09-17**, when DZNR OS's own TUI shipped one:
`~/dznr-os/packages/tui/src/motion.ts`, seven states, tested, with three rules written at the top
of the file. Everything below is read off that rather than reasoned from first principles, which
is the difference between this file and the four months it spent as a skeleton.

## What the shipped one proves

Four things, observed rather than argued.

### 1. A motion system is a grammar, not a list of easings

DZNR's has seven states and **every one of them names something the system does**:

    stillness    idle and healthy — the active project, nothing running
    flow         a task is running
    suspension   waiting on you — a spoken confirmation, a budget approval
    eruption     refused — over budget, a hard error
    collapse     degrading — a stale claim, a link going down
    resonance    finished — a run completed, an artifact landed
    fracture     the Mac and the PC disagree

Not one of those is `ease-out-200`. A token table with no state grammar over it produces motion
that is internally consistent and means nothing, and that is the common failure this workflow
exists to avoid. **s2 is therefore the stage, and s3 follows from it.**

Note the last one. *Fracture* is a state a single-machine system would never need, and it is in
the grammar because the product genuinely has that condition. **A state you inherited from a
vocabulary and cannot point at in the product is a state to cut.**

### 2. Every frame is a pure function of elapsed time

`frameAt(state, elapsedMs, width)` — no timers, no internal state, no accumulated drift. The same
frame on both machines and in a test.

This is what makes motion **reviewable rather than watchable**, and it is a cheap rule to adopt
early and expensive to retrofit. It is also the only reason a motion system can have tests at all.

### 3. Every state needs a resting frame, and that is a design constraint

Reduced motion settles every state to its resting frame — so **every state must have one**. Not
"gracefully degrades". Has one, designed, on purpose, at s4.

Teams treat reduced motion as an accessibility checkbox at the end. It is a constraint on the
grammar at the beginning: a state whose only expression is a movement has no resting frame and is
not a state, it is an effect.

### 4. The information rule, in its true form rather than its obvious one

The obvious rule is *"motion never carries information alone"* and the obvious rule is **false as
usually stated**. DZNR's own file says so:

> the rule alone CANNOT identify seven states. Weight gives three distinctions — held,
> transitional, degrading — and seven states share them.

What is actually guaranteed is weaker and true: **every state has a settled frame, no state is
distinguishable only while moving, and the state's own name travels beside it as text.** Motion is
emphasis; weight is the family; the label is the identity.

Write the weak claim into the exit criteria. A workflow that asserts the strong one ships a system
that fails an audit it believed it had passed.

## Stages

### s1. Motion principles from the brand's own temperament

Owner snape. **Derived, not chosen.** `packs/dznr.md` does this in one line per faction:

    Volt   temperament disciplined, deliberate → control reads as flat → colour holds hard,
           line stays unbroken → motion bias Stillness, Resonance
    Flare  temperament urgent, applied → urgency reads as spread → colour bleeds at the edge,
           line degrades under stress → motion bias Flow, Collapse

The chain matters: temperament, then what that reads as, then the line and colour behaviour, then
the motion bias. A motion principle that cannot be traced back to a sentence about the brand's
character is decoration, and it will not survive the first argument about it.

If the brand came through `brand-design-system`, this is already written — read it rather than
re-derive it. See **Drift** below, because that is the whole risk of running both.

### s2. Bind a named grammar to real system states

Owner snape. **The stage.** One named state per thing the product does, each with a meaning in the
words a person would use.

Where the names come from is open and should stay open. DZNR borrowed QKI's seven because Kevin
had a grammar already and it fit; a client with no such vocabulary gets one invented here, and
five states is a normal number. What is not open is the binding: **a name with no system state
under it gets cut.**

**Checkpoint, and it is the expensive one.** Everything downstream is derived from this table.
Changing a duration at s5 is an afternoon; discovering at s5 that the product has a state nobody
named is a rebuild.

### s3. Motion tokens

Owner snape, Chain 2 NODE 2. Duration, easing, distance, stagger — **per state**, derived from
the bindings.

Emitted beside the brand's other tokens by the same path (`packages/brand/src/tokens.ts`, targets
`css` / `json` / `tailwind`), for the reason that file already gives about tier 3: a token emitted
somewhere else is a token that drifts from the palette it was derived with.

DZNR's periods are slow on purpose and the reasoning is worth carrying: *a terminal redraw is
cheap but attention is not, and a dashboard that is always moving is one nobody can read a number
off. Flow at 1.2s reads as progress; the same sweep at 300ms reads as a fault.* **Duration is
semantic.** The same movement at a different speed is a different message.

### s4. Resting frames and the information rule

Owner snape. A resting frame per state, and a written verdict on what survives motion being off.

**This is the half day people skip.** It is also where a grammar gets cut down, because a state
that cannot be told apart at rest is usually a state that was not real.

**Checkpoint.** Show every state with motion off, side by side. The question is not "does it
degrade gracefully" — it is "can a person still tell these apart, and does anything they must know
depend on movement."

### s5. Code implementation

Owner neo, Chain 2 NODE 4. **motion.dev by default.** GSAP when the work needs orchestrated
timelines, scroll-driving, or a non-React context. **CSS last** — not because it is worse, but
because the system lives in the library's config and a CSS-only implementation scatters it; reach
for it when a library would be overkill for what is actually a transition.

Kevin's stack, stated 2026-09-21: *"Default to motion.dev, then to GSAP, and CSS is the last
resort when the first two fail or are overkill."*

**Checkpoint, and it is the first time anyone SEES it.** Everything before this was read. Neo has
`playwright` and can screenshot states, but a screenshot of motion is not motion — a person
watches this one.

### s6. Prototype for sign-off

Owner snape. **Optional, and it is an input to nothing.** When a client must approve motion before
code exists, build it in Jitter and show them that.

**Figma is where the static design lives, and motion is applied in code** — Kevin's own working
order. So there is no "Figma motion spec" deliverable in this workflow, and the stub's assumption
that there must be one is removed. Figma feeds s5; it does not receive from it.

### s7. Performance pass

Owner gandalf, Chain 2 NODE 4. A **measured** frame budget on the slowest target that matters, via
`fixing-motion-performance`.

Measured. A motion system that was only ever run on Kevin's machine has not been tested; it has
been enjoyed.

## Checkpoints

- **s2**: the bindings. The one that is ruinous to get wrong.
- **s4**: every state with motion off.
- **s5**: it moves, and someone watched it.

## Drift, which is the price of running this in two places

Kevin chose **both**: `brand-design-system` produces baseline motion tokens at its own s4, and
this workflow exists for the deeper engagement. That is the right call and it has one failure mode,
so it is named here rather than discovered later.

**The rule: this workflow READS the baseline, it does not re-derive it.** s1 reads the brand's
existing temperament and motion bias; s3 emits through the same token path. If a motion system
arrives at a different easing curve than the design system already shipped, one of them is wrong
and it is a conversation, not a merge.

Two systems that derive the same thing independently will agree on the day they are written and
never again.

## Deliverables

**Code and a document, as a pair.** The implementation, and the grammar written down — the state
table, what each one means, and the resting frames.

Not Figma. See s6.

## What this is not

Not `web-animation`, which is a skill for animating a thing. This decides how a whole product
moves and then uses that skill at s5.

Not `fixing-motion-performance`, which is s7 of this and also stands alone.

Not a section of `brand-design-system` — though that workflow now carries a motion stage, and the
relationship between them is the Drift section above.

## Grounding notes

**The precedent is in Kevin's own repo and it is unusual in one useful way: the target was a
terminal.** No DOM, no library, no CSS. That forced the system to be about grammar, timing and
resting states rather than about a library's API — which is why it transfers to a web target
cleanly, and why s5 can name a default library without the system depending on one.

**What is still theory.** No CLIENT has received a motion system through DZNR. The stages, the
checkpoints and the four proofs above come from a real build; the time envelope for a client
engagement and the Jitter sign-off path at s6 are estimates. Revise this file from the first
client engagement rather than trusting those two numbers.

## Changelog

- 1.0 (2026-09-21): written from `packages/tui/src/motion.ts`, the dznr pack's motion bias fields,
  and Kevin's three answers on dual artifact, library order and standalone-versus-stage. The stub's
  Figma-motion-spec assumption was removed: Figma is an input.
- 0.1 (2026-09-04): created as stub with open questions.
