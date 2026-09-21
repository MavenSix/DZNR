---
workflow: native-app
name: Native App
status: complete
version: 1.0
lead: neo
supporting: [snape, gandalf, sherlock, tar]
chains: [4]
grounded_in:
  - path: "~/dznr-os/packages/menubar — a Tauri 2 desktop app, built and installed on macOS and Windows"
    date: 2026-09-21
  - path: "~/dznr-os/packages/menubar/verify-build.sh — the two traps, both found the hard way"
    date: 2026-09-18
  - path: "~/dznr-os/packages/menubar/package-app.sh — per-platform bundle targets and the running-exe trap"
    date: 2026-09-18
  - path: "~/dznr-os/packages/menubar/README.md — the no-read-model rule that keeps the app thin"
    date: 2026-09-16
industry_posture_sensitive: false
confidential_default: true
triggers:
  typed: ["native app", "desktop app for", "menu bar app", "tray app", "tauri app", "ship an installer", "mac and windows app"]
  spoken: ["Hey DZNR, build a desktop app for [thing]", "Hey DZNR, package the app"]
inputs_required:
  - id: target_platforms
    source: inline
    on_missing: ask
  - id: what_it_shows
    source: inline
    on_missing: ask
stages:
  - id: s1
    name: Platform choice, and what the app is not allowed to know
    owner: neo
    chain_node: null
    skills: [engineering:system-design]
    models:
      draft: claude:sonnet
      standard: claude:opus
      hero: claude:opus
    tools: []
    produces: [the platform decision, and a written boundary saying what the app may not hold]
    checkpoint: true
    checkpoint_prompt: "This is what the app is allowed to know. Everything it holds itself is a thing that can disagree with the source. Is this boundary right?"
    gate: null
    exit_allowed: false
  - id: s2
    name: The window, from the design system
    owner: snape
    chain_node: null
    skills: [aesthetic-system]
    models: null
    tools: [dznr-os]
    produces: [the surface, in the brand's tokens, checked against the pack rather than eyeballed]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s3
    name: Build, and read the output rather than the exit status
    owner: neo
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: [a binary, and a verification script that can actually fail]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s4
    name: Run it on every platform it claims to support
    owner: sherlock
    chain_node: null
    skills: []
    models: null
    tools: []
    produces: [a per-platform verdict, from the platform, naming what has never been observed]
    checkpoint: true
    checkpoint_prompt: "Here is what was confirmed on each platform, and here is what nobody has seen run. Which of the unseen ones matters?"
    gate: null
    exit_allowed: false
  - id: s5
    name: Package an installer a person can double-click
    owner: neo
    chain_node: 4
    skills: []
    models: null
    tools: []
    produces: [a dmg on macOS, a setup.exe on Windows, each named by the platform that made it]
    checkpoint: false
    checkpoint_prompt: null
    gate: null
    exit_allowed: false
  - id: s6
    name: Signing, notarisation, and saying so when it is absent
    owner: gandalf
    chain_node: 4
    skills: []
    models: null
    tools: []
    produces: [signed installers, or a written statement of what an unsigned one does to the person opening it]
    checkpoint: true
    checkpoint_prompt: "Unsigned, this is what the first-run warning says. Ship it, or get the certificates?"
    gate: null
    exit_allowed: true
deliverables:
  - type: code
    dual_with: markdown
  - type: markdown
    dual_with: code
cost_envelope_usd: [0, 0]
time_envelope: "The window is a day. The build scripts are an afternoon and they repay it the first time a build fails quietly. Getting the same binary running on the second platform took longer than the first one took to write, and that is the shape to expect rather than the exception."
exit_criteria:
  - "The app holds no read model and no second opinion about its own data: the boundary from s1 is still true of what shipped"
  - "The build script reads the BUILD OUTPUT, not the exit status, and matches a failure signature as well as a success line"
  - "The frontend is bundled BEFORE the binary, every time, so a fresh binary cannot carry stale assets"
  - "Every platform in `target_platforms` has been RUN on that platform. Anything never observed is named as never observed, not assumed working"
  - "Signing state is stated. An unsigned installer is a decision, and the first-run warning is written down"
memory_writes:
  - "app.<name>.platforms (and what was actually run on each)"
  - "app.<name>.unverified (the list that s4 refuses to leave empty by assumption)"
  - "app.<name>.signing (signed, or the accepted warning)"
open_questions:
  - "The MOBILE path is unwritten. This workflow is the desktop case, because that is the one that shipped. When an iOS or Android app ships, the platform branch at s1 grows a second half: SwiftUI or Expo, a device matrix, TestFlight or the internal track, and store review. Do not write that half from theory."
---

# Native App

## Purpose

A platform binary a person installs and launches, rather than a URL they visit.

**Written from the DZNR OS menu-bar app** (`~/dznr-os/packages/menubar`): Tauri 2, built and
installed on macOS and Windows, with a defect history worth more than the feature list.

## The stub asked a mobile question, and the app that shipped is desktop

Its first open question was *"SwiftUI native, React Native, or Expo?"*, and its precedent was a
React Native chat prototype from 2026-05-27. All three options are mobile.

**What Kevin has actually shipped is a cross-platform desktop app.** So this file is the desktop
case, written from the thing that exists, and the mobile half is left explicitly unwritten in
`open_questions` rather than guessed at. That is the same correction `saas-application` needed and
for the same reason: a stub written from a category rather than from a project asks questions
inside the wrong shape.

## What the menubar app proves

### An app that holds nothing cannot disagree with anything

The README states the boundary before it states a feature:

> It has **no database, no read model, and no opinion about what a task means.** Everything it
> displays comes from one HTTP request to `http://127.0.0.1:7817/dashboard`.

A native app is a second place your data can live, and the second place is where drift starts.
**s1 produces that boundary as a written sentence**, and s1 is a checkpoint because it is cheap
now and structural later.

### `tauri build` exits 0 on failure

Straight from `verify-build.sh`, found the hard way:

> The PC session watched it print `failed to build app` twice and return success.

So the check **reads the output, not the status**, and matches a failure signature as well as a
success line. The reason for the second half is the better half:

> a build that HANGS after failing looks identical to one still running, and silence must never
> read as progress.

**s3 produces a verification script**, not a build command. Any toolchain that reports success it
has not earned gets the same treatment.

### A guard placed after the thing it guards is decoration

The best lesson in the repo, and it is in a shell script:

> The first version of this script "checked" for [stale assets] AFTER running the build, which
> rebuilds the binary and makes the comparison always pass. **It was decoration.**
>
> The fix is not a better check, it is removing the class: bundle the frontend FIRST, every time,
> so it cannot be stale. **A guard that cannot fire is worse than no guard, because it reads as
> coverage.**

That is an exit criterion, and it generalises past this workflow. The cost of the original was a
cycle spent looking at a popover full of blanks from a bundle baked in before the fix.

### Bundle targets belong to the platform, not to the shared config

`tauri.conf.json` says `targets: ["app"]`. Widening it to cover Windows would make the Mac emit
installers nobody asked for on every build, so **each platform names its own format at package
time**:

    Windows   nsis      a setup.exe: per-user install, Start menu entry, uninstaller
    macOS     app,dmg   the bundle, and a disk image to hand someone

### The second platform is where the real defects are

Three things about the Windows build were unanswerable from the Mac: whether thumbnails load
through Windows' own file protocol, whether *Show in Finder* reveals rather than opens, and
**whether the popover has ever worked there at all** (it was blocked by a CORS fault from the day
it was built, so "never worked" and "broken" look identical until it runs). A deadlock that was
harmless on macOS turned out to be fatal on Windows.

Also platform-specific and also exit-0: **a running app on Windows holds its own `.exe`** and
cargo cannot replace it.

**So s4 is owned by Sherlock and its deliverable is a list of what has never been observed.** A
per-platform verdict that says "should be fine" is not a verdict. The checkpoint asks which of the
unseen things matters, because some of them will not.

### Signing is a decision, and an unstated one is still a decision

The menubar app declares **no signing of any kind**. That is fine for two machines Kevin owns and
it is not fine for anything handed to a client, because the first-run warning is the first thing
they see.

**s6 exists so the state is written down.** Shipping unsigned is allowed. Shipping unsigned
without anyone having said so is what this stage prevents.

## Stages

### s1. Platform choice, and what the app is not allowed to know
Owner neo. Desktop or mobile, which platforms, and the boundary sentence. **Checkpoint.**

### s2. The window, from the design system
Owner snape. The surface in the brand's tokens, and `brand check` measures it rather than a
person eyeballing it. The library window was checked this way and reported five violations and
thirteen warnings, all of which were a neutral ramp the stylesheet had minted for itself.

### s3. Build, and read the output rather than the exit status
Owner neo. Frontend bundled first, every time. The script can fail, and it has been made to fail
on purpose at least once.

### s4. Run it on every platform it claims to support
Owner sherlock. **Checkpoint**, and the deliverable includes the unobserved list.

### s5. Package an installer a person can double-click
Owner neo, Chain 4 NODE 4. Per-platform bundle targets, passed at package time.

### s6. Signing, notarisation, and saying so when it is absent
Owner gandalf, Chain 4 NODE 4. **Checkpoint**, and "unsigned, and here is the warning" is a valid
answer.

## Checkpoints

- **s1**: the boundary. What the app may not hold.
- **s4**: per platform, including what nobody has seen run.
- **s6**: signed, or the accepted warning.

## What this is not

Not `saas-application`, which is a logged-in product reached through a browser.

Not `content-site`. Not `landing-page-marketing-site`.

**Not the mobile case**, which is unwritten. See `open_questions`.

## Grounding notes

**What is observed:** every stage, the exit criteria and all four lessons come from the menubar
app and the two shell scripts that ship it. The Windows defects are real and two of them are still
unresolved.

**What is not:** no client has received a native app through DZNR, nothing here has been signed or
notarised, and no app has been through a store. The cost envelope is zero because a desktop build
spends no vendor money; a mobile one spends developer-programme fees and that number belongs in the
mobile half when it is written.

## Changelog

- 1.0 (2026-09-21): written from the DZNR OS menu-bar app. The stub's mobile framing was corrected
  rather than answered: the app that shipped is cross-platform desktop, and the mobile path is left
  open rather than guessed.
- 0.1 (2026-09-04): created as stub with open questions.
