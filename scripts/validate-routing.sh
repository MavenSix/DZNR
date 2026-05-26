#!/usr/bin/env bash
# validate-routing.sh
# Phase 4A.8 (2026-05-26): expanded to cover routing files added in Phase 3
# (INDUSTRIES.md, MCPS.md, mcps/ directory), all 8 AGENT.md files, and
# em-dash check on agent prompts.
#
# Future: trace stress tests against routing docs (semi-automated),
# then invoke Claude Code with each test request and verify routing
# (fully automated).

set -e

DZNR_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAILED=0

echo "DZNR routing validation"
echo "======================="
echo "Repo root: $DZNR_ROOT"
echo ""

# --- Routing docs ---
echo "Checking routing docs exist..."
for doc in TRIGGERS.md CHAINS.md SHARED_SKILLS.md FAILURE_MODES.md SUBAGENT_ROSTERS.md INDUSTRIES.md MCPS.md; do
  path="$DZNR_ROOT/routing/$doc"
  if [ ! -f "$path" ]; then
    echo "  FAIL: missing routing/$doc"
    FAILED=1
    continue
  fi
  size=$(wc -c < "$path")
  if [ "$size" -lt 1000 ]; then
    echo "  FAIL: routing/$doc is suspiciously small ($size bytes)"
    FAILED=1
    continue
  fi
  echo "  OK: routing/$doc ($size bytes)"
done
echo ""

# --- MCP specs directory ---
echo "Checking MCP specs..."
MCPS_DIR="$DZNR_ROOT/routing/mcps"
if [ ! -d "$MCPS_DIR" ]; then
  echo "  FAIL: missing routing/mcps/ directory"
  FAILED=1
else
  spec_count=$(find "$MCPS_DIR" -maxdepth 1 -name '*.md' -type f | wc -l | tr -d ' ')
  if [ "$spec_count" -lt 3 ]; then
    echo "  FAIL: routing/mcps/ has only $spec_count spec files (expected at least the template plus a few)"
    FAILED=1
  else
    echo "  OK: routing/mcps/ contains $spec_count spec files"
  fi

  if [ ! -f "$MCPS_DIR/_template.md" ]; then
    echo "  FAIL: missing routing/mcps/_template.md"
    FAILED=1
  else
    echo "  OK: routing/mcps/_template.md"
  fi
fi
echo ""

# --- Subagent AGENT.md files ---
echo "Checking subagent AGENT.md files..."
for agent in tar snape sherlock gibson neo morpheus gandalf snake-eyes; do
  path="$DZNR_ROOT/agents/$agent/AGENT.md"
  if [ ! -f "$path" ]; then
    echo "  FAIL: missing agents/$agent/AGENT.md"
    FAILED=1
    continue
  fi
  size=$(wc -c < "$path")
  if [ "$size" -lt 5000 ]; then
    echo "  FAIL: agents/$agent/AGENT.md is suspiciously small ($size bytes) - may still be a stub"
    FAILED=1
    continue
  fi
  # Check that the agent is in production (status: production)
  if grep -q '^status: production' "$path"; then
    echo "  OK: agents/$agent/AGENT.md (production, $size bytes)"
  else
    echo "  WARN: agents/$agent/AGENT.md is not marked production"
  fi
done
echo ""

# --- Em-dash check on agent prompts (Kevin's style rule) ---
echo "Checking AGENT.md files have no em-dashes..."
for agent in tar snape sherlock gibson neo morpheus gandalf snake-eyes; do
  path="$DZNR_ROOT/agents/$agent/AGENT.md"
  if [ ! -f "$path" ]; then
    continue
  fi
  count=$(grep -c '—' "$path" || true)
  if [ "$count" -gt 0 ]; then
    echo "  FAIL: agents/$agent/AGENT.md has $count em-dashes (style rule violation)"
    FAILED=1
  else
    echo "  OK: agents/$agent/AGENT.md (clean)"
  fi
done
echo ""

# --- Stress tests ---
echo "Checking stress test exists..."
if [ ! -f "$DZNR_ROOT/tests/STRESS_TEST.md" ]; then
  echo "  FAIL: missing tests/STRESS_TEST.md"
  FAILED=1
else
  test_count=$(grep -c '^### TEST' "$DZNR_ROOT/tests/STRESS_TEST.md" || true)
  echo "  OK: tests/STRESS_TEST.md ($test_count test cases documented)"
fi
echo ""

# --- Memory templates ---
echo "Checking memory templates..."
if [ ! -d "$DZNR_ROOT/memory-templates" ]; then
  echo "  FAIL: missing memory-templates/ directory"
  FAILED=1
else
  if [ ! -f "$DZNR_ROOT/memory-templates/project-template.md" ]; then
    echo "  FAIL: missing memory-templates/project-template.md"
    FAILED=1
  else
    echo "  OK: memory-templates/project-template.md"
  fi
fi
echo ""

# --- Plugin manifest ---
echo "Checking plugin manifest..."
if [ ! -f "$DZNR_ROOT/.claude-plugin/plugin.json" ]; then
  echo "  FAIL: missing .claude-plugin/plugin.json"
  FAILED=1
else
  version=$(grep -E '"version":' "$DZNR_ROOT/.claude-plugin/plugin.json" | head -1 | sed -E 's/.*"version": "([^"]+)".*/\1/')
  stability=$(grep -E '"stability":' "$DZNR_ROOT/.claude-plugin/plugin.json" | head -1 | sed -E 's/.*"stability": "([^"]+)".*/\1/')
  echo "  OK: .claude-plugin/plugin.json (version $version, stability $stability)"
fi
echo ""

# --- Summary ---
if [ "$FAILED" -eq 0 ]; then
  echo "==============================="
  echo "Validation PASSED."
  echo "==============================="
  echo ""
  echo "Future work:"
  echo "  - Trace stress tests against current routing docs (semi-automated)"
  echo "  - Invoke Claude Code with each test request and verify routing (fully automated)"
  exit 0
else
  echo "==============================="
  echo "Validation FAILED."
  echo "==============================="
  echo "See errors above. Fix and re-run."
  exit 1
fi
