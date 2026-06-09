#!/usr/bin/env bash
#
# DZNR one-line installer
#
# What this does, in order:
#   1. Checks that Node.js, Claude Code, and Git are installed (tells you what to install if not)
#   2. Clones the DZNR repo to ~/DZNR (or pulls the latest if you already have it)
#   3. Installs the plain /dznr slash command at the user level (~/.claude/commands/dznr.md)
#   4. Offers to set up the workshop sync (optional, only for users who want Gandalf's craft skills
#      available outside DZNR)
#   5. Prints next steps in plain English
#
# Run with:
#   curl -fsSL https://raw.githubusercontent.com/MavenSix/DZNR/main/install.sh | bash
#
# Or, if you already cloned the repo:
#   bash install.sh
#
# Safe to re-run. Idempotent.

set -e

# Colors for readable output
BOLD="$(tput bold 2>/dev/null || echo '')"
DIM="$(tput dim 2>/dev/null || echo '')"
RESET="$(tput sgr0 2>/dev/null || echo '')"
GREEN="$(tput setaf 2 2>/dev/null || echo '')"
YELLOW="$(tput setaf 3 2>/dev/null || echo '')"
RED="$(tput setaf 1 2>/dev/null || echo '')"
BLUE="$(tput setaf 4 2>/dev/null || echo '')"

# Step counter
STEP=0
step() {
  STEP=$((STEP + 1))
  echo
  echo "${BOLD}${BLUE}[$STEP/5] $1${RESET}"
}

ok() {
  echo "${GREEN}  ok  ${RESET} $1"
}

warn() {
  echo "${YELLOW}  ..  ${RESET} $1"
}

fail() {
  echo "${RED}  no  ${RESET} $1"
}

# Header
echo
echo "${BOLD}DZNR Installer${RESET}"
echo "${DIM}A practitioner-grade Claude Code plugin for design, AI product, and experience engineering work.${RESET}"
echo

# Step 1: Check prereqs
step "Check what is already installed"

MISSING_ANY=0

if command -v node >/dev/null 2>&1; then
  NODE_VERSION=$(node --version)
  ok "Node.js installed ($NODE_VERSION)"
else
  fail "Node.js not found"
  echo "      Install from: https://nodejs.org (pick the LTS version)"
  MISSING_ANY=1
fi

if command -v claude >/dev/null 2>&1; then
  CLAUDE_VERSION=$(claude --version 2>/dev/null | head -1 || echo "unknown")
  ok "Claude Code installed ($CLAUDE_VERSION)"
else
  fail "Claude Code not found"
  echo "      Install with: ${BOLD}npm install -g @anthropic-ai/claude-code${RESET}"
  echo "      Then run:    ${BOLD}claude login${RESET}    (to sign in)"
  MISSING_ANY=1
fi

if command -v git >/dev/null 2>&1; then
  GIT_VERSION=$(git --version | awk '{print $3}')
  ok "Git installed ($GIT_VERSION)"
else
  fail "Git not found"
  echo "      On macOS: open Terminal, type ${BOLD}git --version${RESET}, and the system will offer to install it."
  echo "      On Linux: ${BOLD}sudo apt install git${RESET} (Ubuntu/Debian) or your distro equivalent."
  MISSING_ANY=1
fi

if [ "$MISSING_ANY" -eq 1 ]; then
  echo
  echo "${YELLOW}${BOLD}Stop here.${RESET} Install what is missing above, then run this installer again."
  echo "${DIM}You can run it the same way: curl -fsSL https://raw.githubusercontent.com/MavenSix/DZNR/main/install.sh | bash${RESET}"
  exit 1
fi

# Step 2: Clone or update the repo
step "Get the DZNR files"

DZNR_DIR="$HOME/DZNR"

if [ -d "$DZNR_DIR/.git" ]; then
  ok "DZNR already at $DZNR_DIR, pulling the latest"
  cd "$DZNR_DIR"
  if git pull --quiet origin main 2>/dev/null; then
    ok "Updated to the latest version"
  else
    warn "Could not pull updates (network or auth issue). Continuing with the version you have."
  fi
elif [ -d "$DZNR_DIR" ]; then
  fail "$DZNR_DIR exists but is not a git clone of DZNR"
  echo "      Move or rename it, then run this installer again."
  exit 1
else
  warn "Cloning DZNR to $DZNR_DIR"
  if git clone --quiet https://github.com/MavenSix/DZNR.git "$DZNR_DIR" 2>/dev/null; then
    ok "Cloned successfully"
  else
    fail "Clone failed (network issue, or the repo is private and you do not have access)"
    echo "      If the repo is private, ask Kevin for access, then re-run."
    exit 1
  fi
fi

# Step 3: Install the user-level slash command
step "Install the /dznr slash command at the user level"

CLAUDE_COMMANDS_DIR="$HOME/.claude/commands"
SOURCE_CMD="$DZNR_DIR/commands/conduct.md"
TARGET_CMD="$CLAUDE_COMMANDS_DIR/dznr.md"

if [ ! -f "$SOURCE_CMD" ]; then
  fail "Source command file not found at $SOURCE_CMD"
  echo "      Something is wrong with the clone. Try removing $DZNR_DIR and re-running."
  exit 1
fi

mkdir -p "$CLAUDE_COMMANDS_DIR"

if [ -f "$TARGET_CMD" ]; then
  # Check if it is the same content
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

# Step 4: Optional workshop sync
step "Workshop sync (optional)"

CLAUDE_SKILLS_DIR="$HOME/.claude/skills"
WORKSHOP_DIR="$DZNR_DIR/skills/workshop"

echo "${DIM}The workshop sync makes Gandalf's 44 craft skills available outside DZNR's namespace,"
echo "so you can use them in non-DZNR projects too. This is optional. Most users want it.${RESET}"
echo

# Detect non-interactive mode (e.g. piped from curl) and skip the prompt if so
if [ -t 0 ]; then
  printf "  Set up the workshop sync now? [Y/n] "
  read -r REPLY
  REPLY=${REPLY:-Y}
else
  REPLY="N"
  warn "Skipping workshop sync (non-interactive install). Run ${BOLD}bash $DZNR_DIR/scripts/sync-workshop.sh${RESET} later if you want it."
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

# Step 5: Verify and print next steps
step "Done. Here is what to do next."

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
echo "${DIM}Installer version: 1.13.6${RESET}"
echo
