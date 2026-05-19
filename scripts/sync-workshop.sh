#!/usr/bin/env bash
# sync-workshop.sh — symlink ~/.claude/skills to DZNR/skills/workshop
# Run from the DZNR repo root.

set -e

DZNR_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORKSHOP_DIR="$DZNR_ROOT/skills/workshop"
USER_SKILLS_DIR="$HOME/.claude/skills"

echo "DZNR workshop sync"
echo "=================="
echo "Workshop target: $WORKSHOP_DIR"
echo "User skills dir: $USER_SKILLS_DIR"
echo ""

# Sanity check
if [ ! -d "$WORKSHOP_DIR" ]; then
  echo "ERROR: workshop dir doesn't exist at $WORKSHOP_DIR"
  exit 1
fi

# Check current state of ~/.claude/skills
if [ -L "$USER_SKILLS_DIR" ]; then
  CURRENT_TARGET="$(readlink "$USER_SKILLS_DIR")"
  if [ "$CURRENT_TARGET" = "$WORKSHOP_DIR" ]; then
    echo "OK: $USER_SKILLS_DIR is already symlinked to the workshop. Nothing to do."
    exit 0
  fi
  echo "WARNING: $USER_SKILLS_DIR is a symlink pointing to a different location:"
  echo "  $CURRENT_TARGET"
  echo "Removing the old symlink and creating the new one..."
  rm "$USER_SKILLS_DIR"
elif [ -d "$USER_SKILLS_DIR" ]; then
  # Regular directory exists — back up first
  BACKUP="$USER_SKILLS_DIR.backup.$(date +%Y%m%d-%H%M%S)"
  echo "WARNING: $USER_SKILLS_DIR is a real directory with content."
  echo "Backing up to: $BACKUP"
  read -p "Continue? [y/N] " yn
  if [ "$yn" != "y" ] && [ "$yn" != "Y" ]; then
    echo "Aborted."
    exit 1
  fi
  mv "$USER_SKILLS_DIR" "$BACKUP"
  echo ""
  echo "Backed up. You may want to copy skills from $BACKUP into $WORKSHOP_DIR"
  echo "if they're not already there. Run this check yourself before deleting the backup."
fi

# Create the symlink
ln -s "$WORKSHOP_DIR" "$USER_SKILLS_DIR"
echo ""
echo "OK: symlinked $USER_SKILLS_DIR -> $WORKSHOP_DIR"
echo ""
echo "From now on, edits to either location will reflect in both."
