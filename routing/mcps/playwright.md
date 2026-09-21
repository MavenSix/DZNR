---
mcp-name: playwright
status: ACTIVE
primary-owner: neo
secondary-owners: gibson, sherlock
proposal-doc: n/a (Kevin chose it 2026-09-21, alongside the browser-profile spec)
activated-date: 2026-09-21
---

# Playwright

## What this MCP does

Drives a **throwaway** browser: opens a page, reads what actually rendered, clicks through a flow,
fills a form, takes a screenshot, and reports the console and network. Nothing is remembered
between runs.

## Why DZNR uses it

**Neo can build a site and cannot look at it.** Every delivery workflow ends at a deploy and then
asks a person whether it works. A build that compiles, deploys and returns 200 is not a build that
renders — and "it deployed" has been the last verified fact in every web engagement.

This is the QA half of `saas-application` and `native-app` (web target), and it is what lets
`landing-page-marketing-site` check a hero actually paints rather than trusting a green build.

**Deliberately amnesiac, and that is the whole design.** No profile, no cookies, no saved logins,
nothing carried between runs. A fresh context every time is what makes a result reproducible and
what makes this safe to run unattended from the daemon. The browser that REMEMBERS is a different
spec — `browser-profile.md` — and the two must not be merged, because every property that makes
this one safe is a property that one deliberately gives up.

## Triggers

- "check the site"
- "does it render"
- "click through the signup"
- "screenshot the page"
- "what does the console say"
- "test the flow"
- implicit: any delivery workflow reaching a deploy stage with a URL in hand

## Workflow

1. Neo has a URL — a local dev server, a preview deploy, or production.
2. Navigate, and **wait for the thing being asserted on** rather than a fixed sleep. A timer that
   passes on a fast machine and fails on a slow one is a flaky test wearing a fixed cost.
3. Read the rendered page, not the source. The question is what a person sees.
4. Walk the flow the workflow named — signup, checkout, the one path that must not break.
5. Screenshot at the states that matter; the screenshots become artifacts.
6. Report console errors and failed network requests **with the run**, because a page that looks
   right over a 500 is the failure this exists to catch.

**What it must not do:** enter real credentials, accept terms, submit anything that charges money,
or act on a live production system. Test accounts and preview deploys only. Those are prohibited
for a person as well as for a tool, and an amnesiac browser has nothing to log in with anyway.

## Fallback (when MCP is disconnected)

Neo reports the deploy and says plainly that **nothing was checked** — not "it should be fine".
The workflow's exit criterion for the QA stage goes unmet and is named as unmet, which is the
honest state. A build nobody looked at is not a build that passed.

## Memory tags

- "qa.<project>.last_checked (url and timestamp)"
- "qa.<project>.flows_walked"
- "qa.<project>.console_errors (the ones seen, not a count)"

## Activation steps

1. Already available to a Claude session on both machines; no install needed.
2. No authentication. That is the point.
3. Test: navigate to a known page and assert on rendered text.
4. Status is ACTIVE as of 2026-09-21.

## Status history

- 2026-09-21: ACTIVE. Written when Kevin asked whether websites belong in `native-app` and
  `saas-application`, and the answer turned up that **no browser tooling was registered at all** —
  while two stub drivers had been blocked on an unspecified "Chrome MCP host" since Phase 1.
