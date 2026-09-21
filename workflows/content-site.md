---
workflow: content-site
name: Multi-Page Content Site
status: stub
version: 0.1
lead: neo
supporting: [snape, sherlock, morpheus, gandalf]
chains: [4]
grounded_in: []
industry_posture_sensitive: true
confidential_default: true
triggers:
  typed: ["website for", "multi-page site for", "CMS for", "content site for", "rebuild the site", "migrate the site", "blog for", "docs site for"]
  spoken: ["Hey DZNR, build the site for [client]", "Hey DZNR, move [client] onto a CMS"]
inputs_required: []
stages:
  - id: s1
    name: Content inventory and IA
    owner: sherlock
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s2
    name: Content model
    owner: neo
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Template set from the design system
    owner: snape
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Build and wire the CMS
    owner: neo
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s5
    name: Migrate the content
    owner: neo
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s6
    name: Editor handover
    owner: morpheus
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: []
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
deliverables: []
cost_envelope_usd: [0, 0]
time_envelope: TBD
exit_criteria: []
memory_writes: []
open_questions:
  - "Which CMS, and is it one or a branch? Chain 4 already branches on Sitecore, Salesforce and AEM — is a content site a fifth branch of that chain, or its own thing with a Next.js-plus-headless default?"
  - "Is migration in scope? Moving a client off an existing site is most of the work on a real engagement and needs its own stages (crawl, map, redirect, verify) — or it is a separate workflow and this one only builds new."
  - "Who edits after handover: the client in a CMS, Kevin, or nobody because it is static? s6 differs completely by answer, and so does whether s2 needs a content model at all."
  - "Does `landing-page-marketing-site` become the one-page case of this, or do they stay separate? They share the design-system intake and diverge at the point a second page exists."
  - "Name one real site Kevin has built or will build next, with its CMS and its page count. The stub is written from that and not before."
---

# Multi-Page Content Site

## Purpose

Stub. A client site with more than one page and someone other than Kevin editing it.

**This gap was found rather than planned.** `landing-page-marketing-site` says in its own
"What this is not" that it does not cover *"a multi-page marketing site with a CMS"*, and routes
that to *"Chain 4 delivery with Neo leading, and a content workflow."* **There was no content
workflow.** Sixteen workflows and a client website fell between all of them — covered by a
sentence pointing at something that did not exist.

Tár treats a match here as a prompt to read the open questions aloud and offer the nearest
complete workflow, never as something to execute.

## Stages

Skeleton only. Owners are a first guess at the shape and will move once the open questions are
answered.

### s1. Content inventory and IA
Owner sherlock. What pages exist, what they say, what they are for.

### s2. Content model
Owner neo. Types, fields, relationships — the thing a CMS is configured from. **May not exist at
all** if the answer to the editing question is "nobody".

### s3. Template set from the design system
Owner snape. Where this consumes `brand-design-system` output, the same way
`landing-page-marketing-site` does.

### s4. Build and wire the CMS
Owner neo. The branch that the first open question decides.

### s5. Migrate the content
Owner neo. Crawl, map, redirect, verify. **In scope or not** — second open question.

### s6. Editor handover
Owner morpheus. Differs completely depending on who edits.

## Checkpoints

Not yet defined. At minimum: the IA before anything is built, and the template set before content
is migrated into it.

## Deliverables

Not yet defined.

## What this is not

Not `landing-page-marketing-site` — that one is complete and owns the single-page case. Whether
this supersedes it is the fourth open question.

Not `saas-application` — that is a logged-in product. A content site's readers are anonymous and
its editors use a CMS, which is a different shape end to end.

## Grounding notes

**Precedent that exists:** Chain 4 already branches on Sitecore, Salesforce and AEM, so the
delivery half has structure. `brand-design-system` produces the tokens and components a template
set would consume. `landing-page-marketing-site` is a complete nine-stage workflow for the
one-page case and shares the intake.

**Why that is insufficient:** none of it is a shipped multi-page site with a CMS, stages,
checkpoints, and a cost and time envelope that were actually observed. Every open question above
changes the workflow materially, and four of the five are Kevin's alone. Writing them from theory
would produce a workflow that reads plausible and is wrong where it matters — which is the reason
the other stubs are still stubs.

**To complete this stub:** answer the open questions (or name one real site and let it be written
from that), set `status: complete`, fill `grounded_in`, and bump to 1.0.

## Changelog

- 0.1 (2026-09-21): created as a stub. The gap was found when Kevin asked whether websites belong
  in `native-app` or `saas-application`; they belong in neither, and the multi-page case belonged
  nowhere.
