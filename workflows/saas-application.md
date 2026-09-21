---
workflow: saas-application
name: SaaS Application
status: complete
version: 1.0
lead: neo
supporting: [sherlock, snape, gandalf, morpheus, tar]
chains: [3]
grounded_in:
  - path: "~/Desktop/PULSE OS BUILD/pulse-studio-session4-handoff.md — four phases shipped, the defects, the risks, the working rules"
    date: 2026-07-21
  - path: "~/maven-ui — the Next.js app, live at pulse.mavensix.com"
    date: 2026-07-21
  - path: "~/maven — the Python cron half, its own venv"
    date: 2026-07-21
  - path: "~/Desktop/PULSE OS BUILD/ui-polish-log.md — the deferred-polish discipline, as it was actually run"
    date: 2026-07-21
  - path: "~/DZNR/routing/mcps/playwright.md — the QA half, spec'd for this workflow"
    date: 2026-09-21
  - path: "Kevin, 2026-09-21: cut the retention stage, it was never observed; the stack is a fixed default"
    date: 2026-09-21
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["saas app for", "build a product", "web app for", "logged-in app", "MVP for", "dashboard product", "multi-tenant"]
  spoken: ["Hey DZNR, build the app for [product]", "Hey DZNR, start a SaaS for [idea]"]
inputs_required:
  - id: product
    source: inline
    on_missing: ask
  - id: who_it_is_for
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Who it is for, and the one thing it does
    owner: morpheus
    chain_node: null
    skills: [product-management:write-spec]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [a purpose sentence, the personas, and the working rules for the build]
    checkpoint: true
    checkpoint_prompt: "This is what the product is and who it is for. If this sentence is wrong, everything after it is wrong."
    gate: null
    exit_allowed: false
  - id: s2
    name: Schema and the data-access rule
    owner: neo
    chain_node: null
    skills: [engineering:system-design]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [the tables, and ONE data layer with a written rule about who may read and write]
    checkpoint: true
    checkpoint_prompt: "The schema, and the access rule. Changing either later is a migration and a sweep of every call site."
    gate: null
    exit_allowed: false
  - id: s3
    name: Repo scaffold
    owner: neo
    chain_node: null
    skills: [repo-scaffold]
    models: null
    tools: []
    produces: [the app running locally against a real database, auth working, nothing else]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Design tokens before the first screen
    owner: snape
    chain_node: null
    skills: [aesthetic-system]
    models: null
    tools: [dznr-os]
    produces: [one tokens file, and no second source of colour or type anywhere]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Build in vertical slices, each validated in writing
    owner: neo
    chain_node: null
    skills: []
    models: null
    tools: [playwright]
    produces: [one working end-to-end path per slice, with a written note of what was checked and how it failed]
    checkpoint: true
    checkpoint_prompt: "This slice works end to end. What did you actually check, and what is its correct failure mode?"
    gate: null
    exit_allowed: false
  - id: s6
    name: The state machine, walked
    owner: sherlock
    chain_node: null
    skills: []
    models: null
    tools: [playwright]
    produces: [every gate and route condition walked as a real user, not reasoned about]
    checkpoint: true
    checkpoint_prompt: "Every entry state was walked. Name any that put a user somewhere they cannot get out of."
    gate: null
    exit_allowed: false
  - id: s7
    name: Deploy, and say the risks out loud
    owner: neo
    chain_node: null
    skills: []
    models: null
    tools: [playwright]
    produces: [a live URL on a real domain, and a written risks list with each acceptance scoped and dated]
    checkpoint: true
    checkpoint_prompt: "It is live. Here are the risks I am accepting, what each one costs if it bites, and when it stops being acceptable."
    gate: null
    exit_allowed: false
  - id: s8
    name: Polish pass, from the log
    owner: gandalf
    chain_node: null
    skills: [polish]
    models: null
    tools: []
    produces: [the deferred log worked through, most-visible items first]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: code
    dual_with: markdown
  - type: markdown
    dual_with: code
cost_envelope_usd: [0, 40]
time_envelope: "Observed on Pulse Studio: four shipped phases plus a beta launch across roughly four working sessions. A vertical slice with an LLM call in it is most of a session. s1 and s2 are half a session and are the two that make the rest cheap or expensive."
exit_criteria:
  - "The purpose sentence from s1 is still true of what shipped, and was re-read rather than assumed"
  - "There is ONE data layer and one tokens file. A second source of either is the defect this workflow exists to prevent"
  - "Every slice carries a written validation note naming what was checked — and its CORRECT failure mode, not just its success case"
  - "Every entry state was WALKED at s6. A state machine that was reasoned about rather than walked has not been tested"
  - "The risks list at s7 exists, each acceptance is scoped and dated, and nothing is buried"
  - "Anything deferred is in a polish log with a location, not in someone's head"
memory_writes:
  - "saas.<product>.stack (and why, when it was not the default)"
  - "saas.<product>.risks_accepted (each with its scope and date)"
  - "saas.<product>.polish_log_path"
open_questions: []
---

# SaaS Application

## Purpose

A logged-in product: accounts, a database, a thing a person comes back to.

**Written from Pulse Studio**, which Kevin built and shipped to `pulse.mavensix.com` — an AI
creative-intelligence agent for speculative-fiction authors, live, with a small beta.

## The stub was written from a description of Pulse, not from Pulse

Worth stating, because it is the thing this workflow is supposed to prevent.

The stub carried five open questions. **Three of them had premises the record does not support**,
and they were checked with a control rather than skimmed — `supabase` appears thirteen times in
the handoff, so the search works:

    "observability from the first commit"    zero hits. No Sentry, no OpenTelemetry, no
                                             logging platform, and nothing in package.json
    "which tracking skills before deploy"    zero hits. No analytics of any kind shipped
    "the Phase 1 retention finding"          zero hits for retention, activation, churn or
                                             cohort. Pulse was at a five-user beta

None of that is a criticism of Pulse. It is a correction to a stub that described a more
conventional SaaS build than the one that happened, and then asked questions inside that
description. **Kevin cut the retention stage on 2026-09-21 on exactly that ground.**

What Pulse has instead is better material, and the stages below are taken from it.

## What Pulse actually did, and what each thing becomes

### Validation written beside the work, including the failure mode

Every piece in the phase history carries a note of what was checked. The best of them names how
the thing fails when it fails:

> Validated: extraction is faithful; thin conversation → honestly thin profile, never fabricated.
> **Extraction quality scales with conversation depth — this is the correct failure mode.**

That last clause is the practice. An LLM feature does not pass or fail; it degrades, and the
question is whether it degrades in the right direction. **s5 asks for the correct failure mode by
name**, because a feature nobody has described degrading is a feature nobody has thought about.

### One data layer, with a rule

`maven-db.ts`: every function takes a client first, **reads rely on RLS, writes use
`requireUserId`.** One sentence, and it decides every call site in the app.

**s2 produces that sentence**, and it produces it before the first screen — because a second way
to reach the database appears the moment one is inconvenient, and by then it is a sweep.

### Tokens before screens, and no second source

`app/lib/tokens.ts` holds `D`, `Fh`, `Fb`, `S`, `T`, `LS`. **No Tailwind.** One place, and the
handoff even records the gaps honestly: *there is no `displaySm` or `h1`/`h2`/`h3` token; use
`display`/`displayLg`.*

A recorded gap is a design system. An unrecorded gap is the reason a component has a hard-coded
hex in it.

### Vertical slices, shipped out of numeric order

Phases went **4, 5.1, 6, 3**. Not a mistake — each phase was a working end-to-end path, and they
shipped when they were ready rather than when their number came up.

So **s5 is slices, not sprints.** A slice is a thing a user can do from start to finish. Half a
feature across three layers is not a slice and cannot be validated.

### The state machine is where the defect was

The one real integration defect in the record:

> welcome previously set `is_onboarded=true` and routed to `/`, **which orphaned the interview**

Every piece worked. The gate flipped in the wrong place, so an entire screen became unreachable.
Nothing catches that except walking it.

**s6 exists for this and Sherlock owns it, with `playwright`** — which was spec'd on 2026-09-21
as the QA half of exactly this workflow. Its own spec says the honest thing: when it is
unavailable, report that **nothing was checked**, not that it should be fine.

Note also the ordering rule Pulse settled on: `completeInterview` runs the save and *then* flips
the gate, *"deliberate order: the gate only flips after save succeeds; on failure the gate stays
false so the author can retry."* **A gate that flips before the work is a gate that strands
people.** Check that ordering at s6 wherever one exists.

### Risks said plainly, scoped and dated

The handoff has a section headed *"Known risks (say these plainly, do not bury them)"*, and the
entries have scope:

> Dev reset action is guarded at the page level but **not stripped from the bundle** — acceptable
> for a trusted 5-person beta, **MUST be fully removed before going wider.**

That is the shape: the risk, the cost if it bites, and **the condition under which it stops being
acceptable.** An undated risk acceptance is a permanent one.

Top of Pulse's list was Vercel Hobby function timeouts on multi-second Claude calls, which is why
a commercial build starts on Pro.

### Polish deferred to a log, not to memory

`ui-polish-log.md`, with a stated rule: **experience-works-first, polish-second**, each item
carrying its file location, and a note of which items a first-time user sees first.

**s8 works that log.** The discipline is that deferring is written down with a location, so it is
a decision rather than a thing that got forgotten.

## The stack is a fixed default

Next.js App Router · Supabase (Postgres, Auth, RLS) · Vercel · the Anthropic SDK for any model
call, **server-side only** · Resend for transactional mail.

**Fixed, and branching is an exception that gets named.** Kevin's call on 2026-09-21, and the
reason is that it is the stack whose failure modes he already knows. A workflow that re-opens the
stack every engagement spends its first day answering a question that has an answer.

**Commercial builds start on Vercel Pro.** Hobby has a hard function timeout that a multi-second
model call will eventually hit, and it restricts commercial use regardless.

## Checkpoints

- **s1**: the purpose sentence. Wrong here, wrong everywhere after.
- **s2**: schema and the access rule. A migration and a sweep if it moves.
- **s5**: per slice — what was checked, and how it fails.
- **s6**: the state machine, walked. Name anything that strands a user.
- **s7**: live, with the risks said out loud.

## What this is not

Not `native-app` — that is a platform binary with a store review.

Not `content-site` — anonymous readers and a CMS, which is a different shape end to end.

Not `landing-page-marketing-site`, which sells this and consumes the same design system.

## Grounding notes

**What is observed:** every stage, every checkpoint, the exit criteria and the time envelope come
from Pulse Studio's four shipped phases and its beta launch. The defect at s6 is a real defect.
The risk discipline at s7 is transcribed from the risks section rather than invented.

**What is not:** Pulse is a solo build with a five-user beta, not a client engagement. So there is
no handover stage, no client sign-off gate, and no team. The cost envelope is model spend only.
**When a SaaS engagement runs with a client on the other end, revise this file from it** — the
stages should hold; the ceremony around them will not.

**And the thing this file should be read against:** the stub's own warning was that writing from
theory *"would produce a workflow that reads plausible and is wrong where it matters."* It then
did that, in three of its five questions. The check that caught it cost one grep and a control.

## Changelog

- 1.0 (2026-09-21): written from the Pulse Studio session-4 handoff and the two repos on disk,
  which the stub believed could not be read. Three open questions were retired as false premises
  rather than answered. Retention stage cut on Kevin's call; stack fixed on Kevin's call.
- 0.1 (2026-09-04): created as stub with open questions.
