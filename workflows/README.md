# DZNR Workflows: the master document

**Status:** v1.0 (DZNR v2.6.0, 2026-09-04)
**Owner:** Kevin Williams. Tár reads this at dispatch; DZNR OS reads it through `packages/agents`.
**Rendered copy:** `docs/workflows.html` (generated; do not edit by hand, run `scripts/build-workflows-html.py`)

---

## What a workflow is

A **workflow** is a project-type recipe that composes chains, subagents, models, tools, human checkpoints, and deliverables end to end, including the parts that happen outside DZNR: Figma, Blender, RunningHub, client review, Kevin's own taste calls.

A **chain** (`routing/CHAINS.md`) is a component of a workflow: which subagents run in which order for one leg of the work. A workflow may invoke one chain, several, or none. Chains never invoke workflows.

The **Build Plan** (`~/Documents/DZNR EXPERIMENTS/DZNR_OS_BUILD_PLAN.md`) is how DZNR OS itself is built. It is not a workflow.

The **Prompt Library** (`docs/PROMPT_LIBRARY.md`) is what to type or say to start something. Each workflow's `triggers` block feeds it.

If a document seems to belong in two of those places, it belongs in the one whose definition it matches, and the other gets a pointer.

## Why they exist

DZNR knows *what it can do*. Workflows say *what Kevin actually makes* and the shape that making takes. Three consequences:

1. **Tár routes by project type, not just by trigger word.** "Start a brand activation for Aesop" loads one file and knows every stage, gate, and deliverable before dispatching anything.
2. **Voice mode knows where to stop.** Every workflow names its human checkpoints. When input arrives by voice, DZNR OS speaks at those moments and nowhere else.
3. **Cost and time are known up front.** Each workflow carries an envelope. DZNR OS confirms before crossing it.

## Two kinds of file

- **Complete workflows** are written from a real past project or a real product specification Kevin authored. Every stage cites the artifact it came from. Nine ship in v1.0.
- **Stubs** have full frontmatter, a stage skeleton, and a list of the specific questions that must be answered before the stub can be completed. Seven ship in v1.0. A stub is never executed as if it were complete; Tár tells the user it is a stub and asks the open questions, or routes to the nearest complete workflow.

Frontmatter `status:` is `complete` or `stub`. Nothing else.

## The index

| # | Workflow | File | Status | Lead | Grounded in |
|---|---|---|---|---|---|
| 01 | Experience audit and discovery | `experience-audit-discovery.md` | complete | Sherlock | Aesop audit (2026-06-12) |
| 02 | AI product concept and prototype | `ai-product-concept-prototype.md` | complete | Gibson | Aesop Formulary concept + prototype |
| 03 | Brand activation and immersive | `brand-activation-immersive.md` | complete | Gibson | Jordan 3 / AJ1 configurator |
| 04 | QKI serialized world | `qki-serialized-world.md` | complete | Cheetara | test-world, glasswake packs; Chains 8, 9 |
| 05 | Pitch and client proposal | `pitch-client-proposal.md` | complete | Morpheus | Aesop pitch deck |
| 06 | Brand system and design system | `brand-design-system.md` | complete | Snape | Chain 2; Aesop voice extraction |
| 07 | Landing page and marketing site | `landing-page-marketing-site.md` | complete | Snape then Neo | Chain 2 NODE 4, Chain 5, Aura pattern |
| 08 | Innovation Accelerator workshop | `innovation-accelerator-workshop.md` | complete | Gandalf | Chain 6; IA skill (ISHIR) |
| 09 | Native app | `native-app.md` | stub | Neo | none yet |
| 10 | SaaS application | `saas-application.md` | stub | Neo | none yet |
| 11 | Audio | `audio.md` | stub | Gibson | none yet |
| 12 | Short and medium form video | `short-medium-form-video.md` | stub | Gibson | seedance-director skills exist; no shipped project |
| 13 | Long form narrative | `long-form-narrative.md` | stub | Cheetara | none yet |
| 14 | Style sheets for creative work | `style-sheets.md` | stub | Snape | QKI packs are the nearest precedent |
| 15 | Motion system | `motion-system.md` | stub | Snape | fixing-motion-performance, web-animation skills exist |
| 16 | Pulse OS artifacts | `pulse-os-artifacts.md` | complete | Cheetara with Gibson, Neo | Pulse OS product description (2026-09-04); Phase 1 in production |

## Shared principles (apply to every workflow)

1. **Header discipline is the handoff.** Every artifact opens with Prepared by, Date, Subject, For, Industry posture with confidence. The `For:` line is how the next subagent knows what to do. (Source: every Aesop artifact.)
2. **Per-claim attribution all the way to the deck.** Audit marks primary, secondary, deduction. Concept cites audit by section. Pitch footnotes cite both. Prototype carries provenance on every data line. (Source: Aesop audit through pitch.)
3. **Asset manifests are deliverables.** Source, capture method, dimensions, placement, rights class, processing notes, and a Tár verification line. Generated imagery records model, prompt summary, and post-process. (Source: both Aesop manifests.)
4. **Dual artifact at the engagement level.** Pitch and prototype are siblings linked by relative path and share one asset kit. Design file plus code wherever a design exists. (Source: Aesop pitch to prototype; Build Plan principle 6.)
5. **Industry posture shows up as constraints, not styling.** Luxury CPG meant no KPIs before feasibility, deterministic core first, an AI-free phase as rollback target, explicit "what this is not" lists. (Source: Aesop concept and pitch.)
6. **The asset is the risk.** In any 3D or generated-media workflow, the code is rarely the hard part. Price and schedule the asset. Run the asset gate before committing. (Source: Jordan 3 README.)
7. **Prototype Prerequisites are enforced by the workflow, not just the chain.** Persona and journey exist before any prototype stage starts. If a past project embedded them inline (the Aesop concept did), the workflow now makes them a named stage. (Source: Chain 3 NODE 0; the Aesop divergence.)
8. **Gates loop, never proceed on failure.** Prime Gate, asset gate, validation layers, sign-off gate. A fail routes back, never forward. (Source: Chains 3, 4, 6, 8.)
9. **Voice checkpoints are named, not implied.** If a stage needs Kevin to decide, the workflow says so and DZNR OS speaks there. Everything else runs quiet.
10. **Confidential is a default per workflow.** Client work under NDA sets `confidential_default: true`, which excludes aggregator drivers (RunningHub) and any vendor that is not a direct account.

## Frontmatter schema

Every workflow file begins with this YAML block. DZNR OS parses it; Tár reads it. Fields marked (req) are required for `status: complete`; stubs may leave them as `TBD`.

```yaml
---
workflow: kebab-case-id                      # (req) file name without .md
name: Human readable name                    # (req)
status: complete | stub                      # (req)
version: 1.0                                 # (req) semver of this file
lead: subagent-id                            # (req) tar|snape|sherlock|gibson|neo|morpheus|gandalf|cheetara|snake-eyes
supporting: [subagent-id, ...]               # (req) may be empty
chains: [1, 3]                               # (req) CHAINS.md numbers invoked; may be empty
grounded_in:                                 # (req for complete) real artifacts this was written from
  - path: relative/or/absolute/path
    date: YYYY-MM-DD
industry_posture_sensitive: true | false     # (req) does posture change the stages
confidential_default: true | false           # (req)
triggers:
  typed: ["phrase", ...]                     # (req)
  spoken: ["Hey DZNR, ...", ...]             # (req) at least one
inputs_required:                             # (req) checked before stage 1
  - id: persona
    source: memory | inline | stage:<n>      # where it may come from
    on_missing: route:<subagent>:<skill> | ask | block
stages:                                      # (req) ordered
  - id: s1
    name: Stage name
    owner: subagent-id
    chain_node: "Chain 1 NODE 1"             # or null
    skills: [skill-id, ...]
    models:                                  # by quality tier; null if no model call
      draft: driver:model
      standard: driver:model
      hero: driver:model
    tools: [mcp-or-tool, ...]                # MCPs, CLIs, apps
    produces: [artifact type, ...]
    checkpoint: true | false                 # Kevin decides before continuing
    checkpoint_prompt: "What DZNR OS says"   # required if checkpoint true
    gate: null | "name of gate"              # loop-back gate, if any
    exit_allowed: true | false               # can the workflow end here
deliverables:                                # (req) final outputs
  - type: markdown | html | figma | code | glb | video | image | manifest | deck
    dual_with: <deliverable type> | null     # dual-artifact pairing
cost_envelope_usd: [low, high]               # (req for complete)
time_envelope: "human-readable"              # (req for complete)
exit_criteria: ["...", ...]                  # (req)
memory_writes: ["key: what", ...]            # (req)
open_questions: ["...", ...]                 # (req for stub) empty for complete
---
```

After the frontmatter, the body is prose in this order: **Purpose**, **Stages** (one subsection per stage, same ids as frontmatter), **Checkpoints**, **Deliverables**, **What this is not**, **Grounding notes** (what the real project did and where the workflow deliberately differs), **Changelog**.

## How Tár uses a workflow

1. Request arrives. Tár matches against every workflow's `triggers` before matching individual subagent triggers. A workflow match wins.
2. Tár reads `inputs_required`. Anything missing is resolved per `on_missing` before stage 1.
3. Tár announces the workflow, lead, stage count, checkpoint count, and envelope in one line (Level 1 visibility). Voice: spoken.
4. Stages run in order. At each `checkpoint: true`, Tár stops, Snape voices `checkpoint_prompt`, and nothing proceeds without an answer. At each `gate`, a fail loops to the stage the gate names.
5. At every `exit_allowed: true` stage, Tár asks whether to continue or stop, unless the request already said how far to go.
6. On completion, Tár writes `memory_writes` and lists deliverables with paths.

If the matched workflow is a stub, Tár says so, reads `open_questions` to the user, and offers the nearest complete workflow.

## How DZNR OS uses a workflow

- `dznr-os workflow list` prints the index with status.
- `dznr-os workflow run <id> "<request>" [--to <stage-id>]` loads the file, resolves inputs, and drives `runAgent` stage by stage with the frontmatter as context. Envelope confirmation happens before stage 1 when `cost_envelope_usd[1] > 5` or input is voice.
- Phase 7 learning loop: when session logs show the same unrouted sequence of subagents three times, DZNR OS drafts a stub workflow file and opens it for Kevin.

## How to add a workflow

1. Copy `_template.md` to `workflows/<id>.md`.
2. If a real project exists, fill `grounded_in` first and write the stages from it. If not, set `status: stub` and write `open_questions`.
3. Add a row to the index above.
4. Run `scripts/build-workflows-html.py` to regenerate `docs/workflows.html`.
5. Add the spoken triggers to `docs/PROMPT_LIBRARY.md` under the matching category.
6. Bump DZNR minor version (a new workflow is a new capability) and add a CHANGELOG entry.

## Changelog

- **v1.0 (2026-09-04, DZNR v2.6.0):** Master document created. Nine complete workflows written from the Aesop engagement (audit, concept, prototype, pitch), the Jordan 3 / AJ1 configurator, the two QKI test packs, Chains 2, 5, 6, and the Pulse OS product description. Seven stubs with open questions. Schema, principles, Tár and DZNR OS usage, and renderer defined.
