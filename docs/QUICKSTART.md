# DZNR Quickstart for Designers

You are a designer. You make beautiful, thoughtful work. You are not a software engineer, and that is fine. This guide gets you from zero to your first DZNR prompt without assuming you have ever opened Terminal before.

**Time required:** about 10 minutes for first-time setup. Two minutes after that.

**What you need:** a Mac (this guide is written for macOS; Linux works the same way; Windows works through WSL or you can ask someone to help).

---

## Before we start: what is DZNR?

DZNR is a Claude Code plugin. It gives Claude eight specialist subagents who handle design work, AI product work, and experience engineering work for you. You talk to it like a colleague. It produces real artifacts: audits, brand systems, pitches, specs, code.

It runs inside Claude Code, which is Anthropic's command-line tool for working with Claude. We will install Claude Code first, then DZNR.

---

## Step 1: Install Node.js

**What you do.** Go to https://nodejs.org. Click the big green button that says "LTS" (it stands for "Long Term Support"; LTS is the safer of the two options). Download finishes, double-click the file, click Continue through the installer.

**What you should see.** After install, an Installer Succeeded screen. Close it.

**What to do if it breaks.** If the installer says you do not have permission, your Mac administrator (could be you, could be your IT team) needs to approve it. Try again with the password. If you cannot get past this, talk to your IT team. Tell them you need Node.js LTS installed.

---

## Step 2: Open Terminal

**What you do.** On your Mac, press `Command + Space` to open Spotlight Search. Type `Terminal`. Hit Enter. A black or dark grey window opens with text in it.

**What you should see.** A window with your username and a `%` or `$` character waiting for input. Something like:

```
designerkevin@MacBook-Pro ~ %
```

The `%` is called a "prompt." You type here. The window is called your "shell" but designers can just call it Terminal.

**What to do if it breaks.** If Terminal does not open, look in `Applications` → `Utilities` → `Terminal.app`. Double-click it.

---

## Step 3: Install Claude Code

**What you do.** In Terminal, type this exactly (or copy and paste it):

```
npm install -g @anthropic-ai/claude-code
```

Hit Enter. Wait. You will see a lot of text scroll by. This is normal.

**What you should see.** A few lines of text ending with something like `added X packages in Y seconds`. The text might also mention warnings; warnings are fine, errors are not.

**What to do if it breaks.**

- If you see `command not found: npm`, Node.js did not install correctly. Go back to Step 1.
- If you see `EACCES` or "permission denied," try the same command but with `sudo` in front: `sudo npm install -g @anthropic-ai/claude-code`. Terminal will ask for your Mac password. Type it (the cursor will not move; that is intentional, just type and hit Enter).

---

## Step 4: Log in to Claude Code

**What you do.** In Terminal, type:

```
claude login
```

Hit Enter. A browser window opens.

**What you should see.** Anthropic's sign-in page. Sign in with the email tied to your Claude account. The page tells you to return to Terminal.

**What to do if it breaks.** If the browser does not open, copy the URL Terminal prints and paste it into Chrome or Safari manually. If sign-in still fails, your account may not have Claude Code access; talk to whoever set up Claude for your team.

---

## Step 5: Install DZNR (the easy way)

This is the one-line install. Copy this entire line, paste it into Terminal, hit Enter:

```
curl -fsSL https://raw.githubusercontent.com/MavenSix/DZNR/main/install.sh | bash
```

**What this does.** The installer checks that everything is in place, downloads DZNR to a folder called `DZNR` in your home directory, sets up the `/dznr` slash command, and asks if you want the workshop sync (say yes if it asks).

**What you should see.** Step-by-step output with green `ok` markers next to each step. At the end, a `DZNR is installed.` message and three numbered next steps.

**What to do if it breaks.** Re-read the error in Terminal. Most errors say what is missing or wrong. Common ones:

- `Permission denied` on the curl line: your network or proxy is blocking the download. Try later, or ask IT.
- `Node.js not found`: go back to Step 1.
- `Claude Code not found`: go back to Step 3.
- `Git not found`: in Terminal, type `git --version` and macOS will offer to install it. Accept. Then re-run the installer.
- "Clone failed": the DZNR repo might be private and your account does not have access. Ask Kevin (brandlessons@gmail.com) for access, then re-run.

---

## Step 6: Launch DZNR

**What you do.** In Terminal, type:

```
claude --plugin-dir ~/DZNR
```

Hit Enter.

**What you should see.** Claude Code launches in your Terminal window. You see a header that says "Claude Code" and a prompt that says `>` waiting for you to type.

**What to do if it breaks.** If it says "command not found: claude," Claude Code did not install correctly in Step 3. If it says "plugin not found," something went wrong with the install in Step 5. Re-run the installer.

---

## Step 7: Try your first prompt

**What you do.** Inside Claude Code, type:

```
/dznr
```

Hit Enter.

**What you should see.** Tár, the orchestrator, introduces the DZNR cast in her voice. Eight subagents named, each with their role described in one sentence.

If that works, you have DZNR installed and running. Congratulations.

---

## Step 8: Where the real magic lives

DZNR comes with a Prompt Library. 31 ready-to-paste prompts across nine design disciplines. Copy a prompt, swap the brackets for your project details, paste into Claude Code, watch the work happen.

Open the library in your browser (this is the visual one):

```
open ~/DZNR/docs/prompt-library.html
```

Or just double-click `prompt-library.html` in your Finder. The file lives at `~/DZNR/docs/prompt-library.html` (the `~` means your home folder; in Finder it is `Macintosh HD/Users/yourname/DZNR/docs/prompt-library.html`).

The library has copy buttons on every prompt and a search bar. Keep it open in a browser tab while you work.

---

## A few habits worth building

**Talk to DZNR like a colleague.** It works best when you give context: what brand, what audience, what industry, what you want at the end. The prompts in the library are templates for this exact pattern.

**Name the industry.** Every prompt should include the industry (luxury, fintech, technology, etc.). Sherlock tags the project, every subagent reads the tag and adjusts.

**Watch the orchestration.** When DZNR runs a multi-step request, you will see Tár dispatch each subagent in turn. Sherlock observes. Snape designs. Gibson architects. Morpheus pitches. The handoff lines tell you who is working and why. That is the feature, not just decoration.

**Save your prompts.** When you find a prompt or variation that works well for you, save it somewhere you can grab it again (a Notion page, a Slack canvas, a Notes app). The library is the starting point; your personal library is the long-term tool.

---

## When something does not feel right

- **DZNR gives you a generic answer.** You did not give it enough context. Try the prompt again with the industry, the brand, the audience, and what you want at the end.
- **A subagent runs forever.** Hit `Ctrl + C` (hold the Control key, press the C key). That cancels the current request. Try a simpler prompt.
- **The slash menu does not show `/dznr`.** The user-level command file did not get installed. Run the installer again: `curl -fsSL https://raw.githubusercontent.com/MavenSix/DZNR/main/install.sh | bash`. Then quit Claude Code (`/exit` or `Ctrl + C` twice) and relaunch it.
- **You want to update to the latest DZNR.** Run the installer again. It detects an existing install and pulls the latest version automatically. No data loss.

---

## When you are ready to go deeper

- The full prompt library: `~/DZNR/docs/prompt-library.html`
- The text version of the library: `~/DZNR/docs/PROMPT_LIBRARY.md`
- The team reference card (one-page cheat sheet): `~/DZNR/docs/TEAM_REFERENCE_CARD.md`
- The full installation guide (for the technical version): `~/DZNR/docs/INSTALLATION.md`
- The README: `~/DZNR/README.md`

You do not need any of these to use DZNR. But they are there when you want them.

---

## A note on the technical bits

If anything in this guide felt like a foreign language, that is on the language, not on you. The world of CLI tools, package managers, and git repositories grew up assuming everyone using them writes code daily. That assumption is wrong. You should not have to learn an entire toolchain to use a design tool. DZNR aims to hide as much of that as possible while still giving you the depth that the eight-subagent architecture provides.

If something is confusing in this guide, or a step did not work the way it was written, tell Kevin (brandlessons@gmail.com). Each piece of confusion is a v2 improvement to this document.

---

**Document version:** 1.13.6
**Last updated:** 2026-06-08
