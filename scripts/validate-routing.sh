#!/usr/bin/env bash
# validate-routing.sh — re-run stress tests to validate routing changes
# This is a stub for Phase 3.2. Full implementation in Phase 3.5+.

set -e

DZNR_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

echo "DZNR routing validation"
echo "======================="
echo "Repo root: $DZNR_ROOT"
echo ""

# Phase 3.2: minimal check — ensure routing docs exist and are non-empty
echo "Checking routing docs exist..."
for doc in TRIGGERS.md CHAINS.md SHARED_SKILLS.md FAILURE_MODES.md SUBAGENT_ROSTERS.md; do
  path="$DZNR_ROOT/routing/$doc"
  if [ ! -f "$path" ]; then
    echo "FAIL: missing $doc"
    exit 1
  fi
  size=$(wc -c < "$path")
  if [ "$size" -lt 1000 ]; then
    echo "FAIL: $doc is suspiciously small ($size bytes)"
    exit 1
  fi
  echo "  OK: $doc ($size bytes)"
done

echo ""
echo "Checking stress test exists..."
if [ ! -f "$DZNR_ROOT/tests/STRESS_TEST.md" ]; then
  echo "FAIL: missing STRESS_TEST.md"
  exit 1
fi
echo "  OK: STRESS_TEST.md"

echo ""
echo "Phase 3.2 validation passed."
echo ""
echo "TODO: Phase 3.5+ — actually trace the 22 stress tests against current routing docs."
echo "TODO: Phase 3.6+ — actually invoke Claude Code with each test request and verify routing."
