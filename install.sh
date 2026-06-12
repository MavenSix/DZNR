#!/usr/bin/env bash
#
# DZNR one-line installer
#
# What this does, in order:
#   1. Checks that Node.js, Claude Code, and Git are installed
#   2. Clones the DZNR repo to ~/DZNR (or pulls the latest if you already have it)
#   3. Installs the plain /dznr slash command at the user level (~/.claude/commands/dznr.md)
#   4. Offers to set up the workshop sync (optional, only for users who want Gandalf's
#      craft skills available outside DZNR)
#   5. Verifies the install
#
# Run with:
#   curl -fsSL https://raw.githubusercontent.com/MavenSix/DZNR/main/install.sh | bash
#
# Or, if you already cloned the repo:
#   bash install.sh
#
# Optional flags:
#   --check    Just check prereqs and report. Do not install anything.
#   --help     Show usage.
#
# Safe to re-run. Idempotent.

set -e

# ===== Flags =====
CHECK_ONLY=0
for arg in "$@"; do
  case "$arg" in
    --check) CHECK_ONLY=1 ;;
    --help|-h)
      echo "Usage: bash install.sh [--check]"
      echo
      echo "  --check    Verify prerequisites without installing. Useful for"
      echo "             diagnosing what is missing before you commit to install."
      echo
      exit 0
      ;;
  esac
done

# ===== Colors =====
BOLD="$(tput bold 2>/dev/null || echo '')"
DIM="$(tput dim 2>/dev/null || echo '')"
RESET="$(tput sgr0 2>/dev/null || echo '')"
GREEN="$(tput setaf 2 2>/dev/null || echo '')"
YELLOW="$(tput setaf 3 2>/dev/null || echo '')"
RED="$(tput setaf 1 2>/dev/null || echo '')"
BLUE="$(tput setaf 4 2>/dev/null || echo '')"

STEP=0
step() {
  STEP=$((STEP + 1))
  echo
  echo "${BOLD}${BLUE}[$STEP/5] $1${RESET}"
}

ok() { echo "${GREEN}  ok  ${RESET} $1"; }
warn() { echo "${YELLOW}  ..  ${RESET} $1"; }
fail() { echo "${RED}  no  ${RESET} $1"; }
hint() { echo "${DIM}        $1${RESET}"; }

# ===== Header =====
echo
if [ "$CHECK_ONLY" -eq 1 ]; then
  echo "${BOLD}DZNR Installer (check mode)${RESET}"
  echo "${DIM}Verifying prerequisites. No changes will be made.${RESET}"
else
  echo "${BOLD}DZNR Installer${RESET}"
  echo "${DIM}A practitioner-grade Claude Code plugin for design, AI product, and experience engineering work.${RESET}"
fi
echo

# ===== Step 1: Prereq check =====
step "Check what is already installed"

MISSING_ANY=0

if command -v node >/dev/null 2>&1; then
  NODE_VERSION=$(node --version)
  ok "Node.js installed ($NODE_VERSION)"
else
  fail "Node.js not found"
  hint "Install from https://nodejs.org (pick the LTS version)."
  MISSING_ANY=1
fi

if command -v claude >/dev/null 2>&1; then
  CLAUDE_VERSION=$(claude --version 2>/dev/null | head -1 || echo "unknown")
  ok "Claude Code installed ($CLAUDE_VERSION)"
else
  fail "Claude Code not found"
  hint "Install with: ${BOLD}npm install -g @anthropic-ai/claude-code${RESET}"
  hint "Then run:    ${BOLD}claude login${RESET}    (to sign in)"
  MISSING_ANY=1
fi

if command -v git >/dev/null 2>&1; then
  GIT_VERSION=$(git --version | awk '{print $3}')
  ok "Git installed ($GIT_VERSION)"
else
  fail "Git not found"
  hint "On macOS: open Terminal, type ${BOLD}git --version${RESET}, the system will offer to install it."
  hint "On Linux: ${BOLD}sudo apt install git${RESET} (Ubuntu/Debian) or your distro equivalent."
  MISSING_ANY=1
fi

if command -v curl >/dev/null 2>&1; then
  ok "curl available"
else
  warn "curl not found (only matters if you ran this installer locally)"
fi

# Check write access to the install destinations
if [ -w "$HOME" ]; then
  ok "Home directory is writable"
else
  fail "Cannot write to home directory ($HOME)"
  hint "Permissions issue. Talk to your IT team."
  MISSING_ANY=1
fi

if [ "$MISSING_ANY" -eq 1 ]; then
  echo
  echo "${YELLOW}${BOLD}Stop here.${RESET} Install what is missing above, then run this installer again."
  hint "Same command: curl -fsSL https://raw.githubusercontent.com/MavenSix/DZNR/main/install.sh | bash"
  exit 1
fi

if [ "$CHECK_ONLY" -eq 1 ]; then
  echo
  echo "${GREEN}${BOLD}All prerequisites in place.${RESET} Run the installer without ${BOLD}--check${RESET} to proceed."
  exit 0
fi

# ===== Step 2: Get the DZNR files =====
step "Get the DZNR files"

DZNR_DIR="$HOME/DZNR"

if [ -d "$DZNR_DIR/.git" ]; then
  ok "DZNR already at $DZNR_DIR, pulling the latest"
  cd "$DZNR_DIR"
  if PULL_OUT=$(git pull --quiet origin main 2>&1); then
    ok "Updated to the latest version"
  else
    warn "Could not pull updates. Continuing with the version you have."
    hint "Git said: ${PULL_OUT}"
  fi
elif [ -d "$DZNR_DIR" ]; then
  fail "$DZNR_DIR exists but is not a git clone of DZNR"
  hint "Move or rename it, then run this installer again."
  hint "Example: mv $DZNR_DIR ${DZNR_DIR}-backup-$(date +%Y%m%d)"
  exit 1
else
  warn "Cloning DZNR to $DZNR_DIR"
  # Capture git's stderr so users see the real reason if it fails
  CLONE_OUT=$(git clone https://github.com/MavenSix/DZNR.git "$DZNR_DIR" 2>&1) || CLONE_RC=$?
  CLONE_RC=${CLONE_RC:-0}

  if [ "$CLONE_RC" -eq 0 ]; then
    ok "Cloned successfully"
  else
    fail "Clone failed"
    echo
    echo "${DIM}Git said:${RESET}"
    echo "${DIM}${CLONE_OUT}${RESET}" | sed 's/^/        /'
    echo

    # Diagnose the most common failure modes
    if echo "$CLONE_OUT" | grep -qi "could not resolve\|connection refused\|network is unreachable\|timed out"; then
      echo "${YELLOW}${BOLD}Likely cause:${RESET} network issue."
      hint "Check your internet, try again in a moment, or ask IT if you are on a corporate network."
    elif echo "$CLONE_OUT" | grep -qi "authentication failed\|repository not found\|403\|404"; then
      echo "${YELLOW}${BOLD}Likely cause:${RESET} you do not have access to the DZNR repo."
      hint "DZNR is currently a private repo on GitHub. You need to be added as a collaborator."
      hint "Email Kevin (brandlessons@gmail.com) with your GitHub username and ask for access."
      hint "Once added, accept the invite in your GitHub notifications, then re-run this installer."
      hint "If you DO have access and are still seeing this, you may need to authenticate."
      hint "  - For HTTPS: ${BOLD}gh auth login${RESET} (install GitHub CLI first), or use a personal access token"
      hint "  - For SSH:   set up an SSH key, then re-run from the repo root after editing your remote"
    elif echo "$CLONE_OUT" | grep -qi "permission denied\|publickey"; then
      echo "${YELLOW}${BOLD}Likely cause:${RESET} SSH authentication failure."
      hint "Your SSH key is not registered with GitHub. Either:"
      hint "  - Set up SSH on GitHub (https://docs.github.com/en/authentication/connecting-to-github-with-ssh), or"
      hint "  - Use HTTPS with the GitHub CLI: ${BOLD}gh auth login${RESET}"
    else
      echo "${YELLOW}${BOLD}Unclear cause.${RESET} Share the Git message above with Kevin (brandlessons@gmail.com)."
    fi
    exit 1
  fi
fi

# ===== Step 3: Install the slash command =====
step "Install the /dznr slash command at the user level"

CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
SOURCE_CMD="$DZNR_DIR/commands/conduct.md"
TARGET_CMD="$CLAUDE_COMMANDS_DIR/dznr.md"

if [ ! -f "$SOURCE_CMD" ]; then
  fail "Source command file not found at $SOURCE_CMD"
  hint "Something is wrong with the clone. Try removing $DZNR_DIR and re-running."
  exit 1
fi

mkdir -p "$CLAUDE_COMMANDS_DIR"

if [ -f "$TARGET_CMD" ]; then
  if cmp -s "$SOURCE_CMD" "$TARGET_CMD"; then
    ok "/dznr already installed and up to date"
  else
    warn "/dznr exists at $TARGET_CMD but differs, updating"
    cp "$SOURCE_CMD" "$TARGET_CMD"
    ok "/dznr updated"
  fi
else
  cp "$SOURCE_CMD" "$TARGET_CMD"
  ok "/dznr installed at $TARGET_CMD"
fi

# ===== Step 4: Workshop sync =====
step "Workshop sync (optional)"

CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
WORKSHOP_DIR="$DZNR_DIR/skills/workshop"

echo "${DIM}The workshop sync makes Gandalf's 44 craft skills available outside DZNR's namespace,"
echo "so you can use them in non-DZNR projects too. Most users want it.${RESET}"
echo

if [ -t 0 ]; then
  printf "  Set up the workshop sync now? [Y/n] "
  read -r REPLY
  REPLY=${REPLY:-Y}
else
  REPLY="N"
  warn "Non-interactive install detected, skipping workshop sync."
  hint "Run it later with: ${BOLD}bash $DZNR_DIR/scripts/sync-workshop.sh${RESET}"
fi

if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  if [ -L "$CLAUDE_SKILLS_DIR" ] && [ "$(readlink "$CLAUDE_SKILLS_DIR")" = "$WORKSHOP_DIR" ]; then
    ok "Workshop sync already in place"
  elif [ -d "$CLAUDE_SKILLS_DIR" ] && [ ! -L "$CLAUDE_SKILLS_DIR" ]; then
    BACKUP="$CLAUDE_SKILLS_DIR.backup-$(date +%Y%m%d-%H%M%S)"
    warn "$CLAUDE_SKILLS_DIR exists as a regular folder, backing up to $BACKUP"
    mv "$CLAUDE_SKILLS_DIR" "$BACKUP"
    ln -s "$WORKSHOP_DIR" "$CLAUDE_SKILLS_DIR"
    ok "Workshop sync set up (your previous folder is safe at $BACKUP)"
  else
    ln -s "$WORKSHOP_DIR" "$CLAUDE_SKILLS_DIR"
    ok "Workshop sync set up"
  fi
fi

# ===== Step 5: Verify =====
step "Verify the install"

VERIFY_OK=1

if [ -f "$TARGET_CMD" ]; then
  ok "/dznr slash command file present"
else
  fail "/dznr slash command file missing at $TARGET_CMD"
  VERIFY_OK=0
fi

if [ -f "$DZNR_DIR/.claude-plugin/plugin.json" ]; then
  PLUGIN_VERSION=$(grep '"version"' "$DZNR_DIR/.claude-plugin/plugin.json" | sed 's/.*"version": *"\([^"]*\)".*/\1/')
  ok "DZNR plugin manifest present (v${PLUGIN_VERSION})"
else
  fail "DZNR plugin manifest missing"
  VERIFY_OK=0
fi

if [ -f "$DZNR_DIR/agents/tar/AGENT.md" ]; then
  ok "DZNR subagents present"
else
  fail "DZNR subagents missing"
  VERIFY_OK=0
fi

if [ "$VERIFY_OK" -eq 0 ]; then
  echo
  fail "Install verification did not pass. Something is wrong."
  hint "Email the output above to Kevin (brandlessons@gmail.com) and we will diagnose."
  exit 1
fi

# ===== Next steps =====
echo
echo "${GREEN}${BOLD}DZNR is installed.${RESET}"
echo
echo "${BOLD}To start using it:${RESET}"
echo
echo "  1. Open Terminal (if you closed it)."
echo "  2. Run: ${BOLD}claude --plugin-dir ~/DZNR${RESET}"
echo "  3. Inside Claude Code, type ${BOLD}/dznr${RESET} and hit enter."
echo "     Tár will introduce the cast in her conductor voice."
echo
echo "${BOLD}To start working:${RESET}"
echo
echo "  Open the prompt library at:"
echo "    ${BLUE}~/DZNR/docs/prompt-library.html${RESET}"
echo "    (double-click the file or open it in any browser)"
echo
echo "  31 ready-to-paste prompts across 9 design disciplines. Copy one,"
echo "  swap the brackets, paste into Claude Code. That is the whole workflow."
echo
echo "${BOLD}If something goes wrong:${RESET}"
echo
echo "  Read the quickstart manual at ${BLUE}~/DZNR/docs/QUICKSTART.md${RESET}"
echo "  Or open ${BLUE}~/DZNR/docs/quickstart.html${RESET} in a browser."
echo "  Both cover the common errors and what to do about them."
echo
echo "${DIM}Installer version: 1.13.7${RESET}"
echo
