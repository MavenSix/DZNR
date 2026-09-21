---
workflow: style-sheets
name: Style Sheets for Creative Work
status: complete
version: 1.0
lead: snape
supporting: [cheetara, gandalf, gibson]
chains: [9]
grounded_in:
  - path: ~/dznr-os/docs/decisions.md (155 — a style has two levers and either is enough)
    date: 2026-09-17
  - path: ~/dznr-os/docs/decisions.md (158 — colour is a lever, not a property of the weights)
    date: 2026-09-17
  - path: ~/dznr-os/docs/decisions.md (167 — the choice loop)
    date: 2026-09-17
  - path: ~/dznr-os/packs/dznr.md and packs/glasswake.md (world-pack contract, swap-tested)
    date: 2026-09-11
  - path: QKI run 01 — 13 plates, $2.00, fal-ai/flux-lora-fast-training, weights on the `qki` style
    date: 2026-09-17
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["style sheet for", "style type", "look for", "visual style guide for", "define the [x] style", "style pack for", "train a style"]
  spoken: ["Hey DZNR, make a style sheet for [look]", "Hey DZNR, define a [name] style for the [project]"]
inputs_required:
  - id: reference_set
    source: inline
    on_missing: ask
  - id: style_name
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Reference intake and culling
    owner: snape
    chain_node: null
    skills: [aesthetic-system, design-language]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [a culled reference set, and a written reason for every image removed]
    checkpoint: true
    checkpoint_prompt: "These are the references I would train on, and these are the ones I would drop and why. Is that the look you mean?"
    gate: null
    exit_allowed: false
  - id: s2
    name: Author the world pack
    owner: snape
    chain_node: null
    skills: [aesthetic-system, design-language, brand-from-scratch]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [packs/<style>.md — palette, line law, behaviour, motion states, negatives]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s3
    name: Register the style and fix the trigger
    owner: snape
    chain_node: null
    skills: []
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:sonnet
    tools: [dznr-os]
    produces: [a row in `styles` carrying the pack path and the trigger word]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s4
    name: Train the weights
    owner: cheetara
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os, fal]
    produces: [an image LoRA on the style row]
    checkpoint: true
    checkpoint_prompt: "This will cost about $2 and take ten to thirty minutes. The set is N images. Run it?"
    gate: "spend"
    exit_allowed: true
  - id: s5
    name: Prove it with a control
    owner: gibson
    chain_node: null
    skills: []
    models: null
    tools: [dznr-os]
    produces: [two renders of one prompt, with and without the style, both looked at]
    checkpoint: true
    checkpoint_prompt: "Here is the same prompt with the style and without it. Did the weights land, and what did they carry?"
    gate: null
    exit_allowed: false
  - id: s6
    name: Separate what the weights carry from what is set per request
    owner: snape
    chain_node: null
    skills: [aesthetic-system, theme-factory]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: [dznr-os]
    produces: [a written statement of what transferred and what did not, and the palette lever for the rest]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
  - id: s7
    name: Register, version, and open the choice loop
    owner: snape
    chain_node: null
    skills: []
    models:
      draft: claude:sonnet
      standard: claude:sonnet
      hero: claude:sonnet
    tools: [dznr-os]
    produces: [a style usable by name, and a route back to retraining from chosen work]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: true
deliverables:
  - type: markdown
    dual_with: null
  - type: weights
    dual_with: markdown
cost_envelope_usd: [2, 12]
time_envelope: "Culling the set is the long pole and is Kevin's hours, not the machine's. Training ten to thirty minutes. Proof and palette work under five minutes and under a dollar."
exit_criteria:
  - "A world pack exists at packs/<style>.md, or the style carries weights, or both. Either lever alone is a usable style; neither is not."
  - "The style resolves by name: `dznr-os image \"...\" --style <name>` routes to fal-ai/flux-lora and no driver that cannot load weights serves it."
  - "A control was run and both images were LOOKED AT: the same prompt with and without the style."
  - "What the weights did NOT carry is written down, not discovered later."
  - "The trigger word is recorded on the style row, because weights nothing can reach are weights nobody has."
memory_writes:
  - "style.<name>.trigger"
  - "style.<name>.transferred (what the weights carry)"
  - "style.<name>.not_transferred (what has to be set per request)"
  - "style.<name>.set_size and run cost"
open_questions: []
---

# Style Sheets for Creative Work

## Purpose

Turn a body of reference into a style Kevin can reach by name — in a prompt, in a generation, in a
client's colours — and prove it landed rather than assume it.

**This was a stub until 2026-09-17 and it is written from one real run, not from theory.** The stub
asked for a named project to ground it; QKI run 01 is that project. Thirteen plates, $2.00,
`fal-ai/flux-lora-fast-training`, weights recorded against the `qki` style with trigger `qki`. Every
stage below happened, in this order, including the two that went wrong.

## Stages

### s1. Reference intake and culling

Owner snape. The set decides the weights and almost nothing else does. QKI's source folder held 52
files; 13 were used. Removed: 25 Midjourney contact sheets (four images in one frame teaches the
model to draw grids), 8 photoreal headshots (a different medium entirely), and a logo.

**Every removal is stated, because a silently culled set is the expensive failure.** Kevin looks at
the list and says whether it is the look he means. He is the only one who can.

### s2. Author the world pack

Owner snape. `packs/<style>.md` following the contract that `packs/dznr.md` and `packs/glasswake.md`
already swap-test: environment base, factions with one saturated colour each, behaviour, motion
bias, and what the world is not.

**The pack is not the weights and does not become them.** It is the canon a prompt carries in
words. A style may ship with a pack and no weights, or weights and no pack — decision 155 — and
either is a usable style.

### s3. Register the style and fix the trigger

Owner snape. `dznr-os style add <name>` and a trigger word.

**Weights nothing can reach are weights nobody has.** The trigger is the word every future prompt
carries and it is never invented silently — an existing one is reused, otherwise it must be given.

### s4. Train the weights

Owner cheetara. `dznr-os train <style> <folder>` prints the whole run and sends nothing; `--submit`
spends. **Checkpoint and spend gate here, and it is the only place in this workflow money moves.**

Image only. `fal-ai/ltx-video-trainer` is deprecated and `trainerFor('video')` refuses rather than
inventing a price, so a style carries image weights and the `video_lora` column stays empty until a
live trainer exists.

### s5. Prove it with a control

Owner gibson. **The same prompt, twice, with and without the style, and both looked at.**

This is the stage that was missing from every earlier attempt to do this by hand, and it is not
optional. One picture through a LoRA proves nothing: a plausible unstyled image and a styled one
are the same picture to anyone who wants it to have worked. QKI's control was decisive — with the
weights, flat ground and inked linework and layered tattered dress; without, a photoreal bearded
man in a forest. Two endpoints in the router line, two worlds in the output.

### s6. Separate what the weights carry from what is set per request

Owner snape. QKI's weights came back carrying the **drawing** — ink over painted mass, flat ground,
the figure and its dress, register marks — and **not the palette**, because thirteen plates
disagreed about ground colour.

**That is a feature and the workflow treats it as one.** A style whose colour is baked into its
weights can only ever be one colour and re-colouring means retraining. `--palette` takes hexes, a
brand pack, or a style's own pack, so the same drawing lands in a client's colours. Decision 158.

Ground colour lands hard; a single accent only partly. Say which, in writing, at this stage.

### s7. Register, version, and open the choice loop

Owner snape. The style is usable by name. From here, work made with it records `artifacts.style`,
`choose` marks the keepers, and `dznr-os train <style> --from-chosen` assembles the next set from
what Kevin actually picked — so the style improves by being used rather than by another afternoon
of folder curation. Decision 167.

## Checkpoints

- **s1**, before any money: the culled set, with every removal explained.
- **s4**, the spend gate: cost, set size, and the endpoint, before `--submit`.
- **s5**, after: the control pair, both images, and the question of what actually transferred.

## Deliverables

A world pack in markdown, versioned in git. Trained weights on the style row, reachable by name.
A written statement of what the weights carry and what has to be set per request.

## What this is not

Not a brand kit. A style is Kevin's own visual language and breaking it is a change of mind; a
brand is a client's identity and breaking it is a defect. They are separate tables, separate packs
and separate workflows — `brand-design-system` is the other one.

Not a character. A style says how a thing is drawn; a character is a person whose face has to be
the same in the next picture, which needs reference images and a different set of levers.

## Grounding notes

**What the stub asked and what answered it.** The stub's five open questions are answered by
shipped work rather than by argument:

- *Is a style sheet the generalisation of a QKI pack?* Yes, and it is built: the `styles` table
  carries trigger and weights, `packs/*.md` carries canon, and `applyStyle` is the injection block.
- *Which media must one cover?* Image now. Video is a declared slot with no live trainer. CSS and
  motion tokens belong to a brand pack, not a style — `brand export` emits those.
- *Where do they live?* Canon in `packs/` in git; trigger, weights and sref in the `styles` table,
  which syncs across both machines.
- *Name one real project.* QKI run 01, 2026-09-17.
- *What is the proof?* The control at s5.

**What is still Kevin's, and is not a blocker.** Which styles come after QKI is a question about
content, not about this process. The workflow runs the same for the second and third.

## Changelog

- 1.0 (2026-09-17): written from QKI run 01. Status complete.
- 0.1 (2026-09-04): created as stub with open questions.
