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

# --- MCP table names are server names (added v2.14.1) ---
# DZNR OS matches a table row to a running server by the row's first cell, lowercased. A label
# such as "Gmail and Calendar" or "PDF Tools" matches no server, so the connector's status never
# shows. Rows named here are known not to be server names; each says why, and each is a warning.
echo "Checking MCP table rows name a server..."
KNOWN_NOT_SERVER_NAMES='notion (via enterprise-search)|apple notes|slack (small-business)'
names_checked=0
while IFS=$'\t' read -r file name; do
  [ -z "$name" ] && continue
  names_checked=$((names_checked + 1))
  lower=$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]')
  if printf '%s' "$lower" | grep -Eq '^[a-z0-9][a-z0-9._-]*$'; then
    continue
  fi
  if printf '%s\n' "$KNOWN_NOT_SERVER_NAMES" | tr '|' '\n' | grep -Fxq "$lower"; then
    echo "  WARN: $file row \"$name\" is not a server name (known: a second listing, or no server seen)"
    continue
  fi
  echo "  FAIL: $file row \"$name\" is not a server name; use the server's own name (plugin:x:gmail is gmail, claude.ai Google Calendar is google-calendar)"
  FAILED=1
done < <(
  for f in "$MCPS_DIR"/*.md; do
    awk -v file="$(basename "$f")" '
      /^\|[[:space:]]*MCP[[:space:]]*\|/ { in_table = 1; next }
      in_table && /^\|/ {
        if ($0 ~ /^\|[[:space:]:|-]+\|[[:space:]]*$/) next
        split($0, cells, "|"); cell = cells[2]
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", cell)
        print file "\t" cell
        next
      }
      { in_table = 0 }
    ' "$f"
  done
)
echo "  OK: $names_checked MCP table rows read"
echo ""

# --- MCP owners are subagents (added v2.14.1) ---
# DZNR OS reads an owner as a subagent name, the way its registry does: parentheses dropped, split
# on commas and " or ", lowercased, Tár as tar, spaces as hyphens. "Cross-cutting" named no agent,
# so DZNR OS reported it as unknown; a connector every agent may use names all nine instead.
echo "Checking MCP owners are subagents..."
known_agents=$(find "$DZNR_ROOT/agents" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | tr '[:upper:]' '[:lower:]')
owners_checked=0
while IFS=$'\t' read -r file name raw; do
  [ -z "$raw" ] && continue
  while IFS= read -r owner; do
    owner=$(printf '%s' "$owner" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g' | tr '[:upper:]' '[:lower:]' | sed -E 's/^tár$/tar/; s/[[:space:]]+/-/g')
    case "$owner" in ''|n/a|none) continue ;; esac
    owners_checked=$((owners_checked + 1))
    if ! printf '%s\n' "$known_agents" | grep -Fxq "$owner"; then
      echo "  FAIL: $file \"$name\" has owner \"$owner\", which is not a directory under agents/"
      FAILED=1
    fi
  done < <(printf '%s\n' "$raw" | sed -E 's/\([^)]*\)//g; s/[[:space:]]+[Oo][Rr][[:space:]]+/,/g' | tr ',' '\n')
done < <(
  for f in "$MCPS_DIR"/*.md; do
    base=$(basename "$f")
    [ "$base" = "_template.md" ] && continue
    if [ "$base" = "plugin-connectors.md" ] || grep -q '^## MCPs in this cluster' "$f"; then
      # Owners are in the column headed "Owners" or "Subagent Owner".
      awk -v file="$base" '
        /^\|[[:space:]]*MCP[[:space:]]*\|/ {
          in_table = 1; col = 0
          n = split($0, head, "|")
          for (i = 2; i < n; i++) {
            h = tolower(head[i]); gsub(/^[[:space:]]+|[[:space:]]+$/, "", h)
            if (h == "owners" || h == "subagent owner") col = i
          }
          next
        }
        in_table && /^\|/ {
          if ($0 ~ /^\|[[:space:]:|-]+\|[[:space:]]*$/) next
          split($0, cells, "|"); name = cells[2]
          gsub(/^[[:space:]]+|[[:space:]]+$/, "", name)
          if (col > 0) print file "\t" name "\t" cells[col]
          next
        }
        { in_table = 0 }
      ' "$f"
    else
      awk -v file="$base" '
        /^---$/ { n++; next }
        n == 1 && /^(primary-owner|secondary-owners):/ { sub(/^[a-z-]+:[[:space:]]*/, ""); owners = owners "," $0 }
        END { print file "\t" file "\t" owners }
      ' "$f"
    fi
  done
)
echo "  OK: $owners_checked owners read"
echo ""

# --- Spec status agrees with the MCPS.md index (added v2.14.1) ---
# Mobbin was PENDING in both places for weeks after it was signed in. A spec and its index line
# that disagree mean one of them was edited and the other forgotten.
echo "Checking spec statuses match routing/MCPS.md..."
for f in "$MCPS_DIR"/*.md; do
  base=$(basename "$f")
  [ "$base" = "_template.md" ] && continue
  spec_status=$(awk '/^---$/{n++; next} n==1 && /^status:/{sub(/^status:[[:space:]]*/, ""); print $1; exit}' "$f")
  [ -z "$spec_status" ] && continue
  index_line=$(grep -E "^- \`$base\`:" "$DZNR_ROOT/routing/MCPS.md" | head -1 || true)
  [ -z "$index_line" ] && continue
  index_status=$(printf '%s' "$index_line" | sed -E 's/^- `[^`]+`:[[:space:]]*([A-Z-]+).*/\1/')
  if [ "$spec_status" != "$index_status" ]; then
    echo "  FAIL: $base says $spec_status, routing/MCPS.md says $index_status"
    FAILED=1
  else
    echo "  OK: $base ($spec_status)"
  fi
done
echo ""

# --- An ACTIVE connector is not called pending elsewhere (added v2.14.1) ---
# After Mobbin went ACTIVE, Sherlock's prompt still listed its activation as future work, the
# evolution protocol still called it deferred, and the install guide still listed Higgsfield as
# PENDING months after its spec said ACTIVE. A line naming an ACTIVE connector beside one of
# these phrases is one of those leftovers.
echo "Checking ACTIVE connectors are not called pending..."
PENDING_PHRASES='PENDING|deferred to availability|when the connection lands|awaiting MCP availability|not currently in the MCP registry'
for f in "$MCPS_DIR"/*.md; do
  [ "$(basename "$f")" = "_template.md" ] && continue
  spec_status=$(awk '/^---$/{n++; next} n==1 && /^status:/{print $2; exit}' "$f")
  [ "$spec_status" = "ACTIVE" ] || continue
  mcp=$(awk '/^---$/{n++; next} n==1 && /^mcp-name:/{print $2; exit}' "$f")
  case "$mcp" in ''|*-cluster) continue ;; esac
  stale=$(cd "$DZNR_ROOT" && grep -n -i -w -- "$mcp" agents/*/AGENT.md governance/EVOLUTION.md docs/INSTALLATION.md docs/PROMPT_LIBRARY.md routing/*.md README.md 2>/dev/null | grep -E -- "$PENDING_PHRASES" || true)
  if [ -n "$stale" ]; then
    printf '%s\n' "$stale" | while IFS= read -r hit; do
      echo "  FAIL: $mcp is ACTIVE in routing/mcps but still called pending: $hit"
    done
    FAILED=1
  fi
done
echo "  OK: ACTIVE connectors checked"
echo ""

# --- Workflow cost envelopes (added v2.14.1) ---
# [0, 0] was the template's placeholder. DZNR OS reads it as "no estimate", and a person reads it
# as "free". A complete workflow carries a real [low, high]; a stub carries TBD or a real pair.
echo "Checking workflow cost envelopes..."
for f in "$DZNR_ROOT"/workflows/*.md; do
  base=$(basename "$f")
  [ "$base" = "README.md" ] && continue
  status=$(awk '/^---$/{n++; next} n==1 && /^status:/{print $2; exit}' "$f")
  envelope=$(awk '/^---$/{n++; next} n==1 && /^cost_envelope_usd:/{sub(/^cost_envelope_usd:[[:space:]]*/, ""); print; exit}' "$f")
  verdict=$(printf '%s' "$envelope" | awk '
    /^TBD$/ { print "tbd"; exit }
    match($0, /^\[[[:space:]]*[0-9]+(\.[0-9]+)?[[:space:]]*,[[:space:]]*[0-9]+(\.[0-9]+)?[[:space:]]*\]$/) {
      gsub(/[][[:space:]]/, ""); split($0, v, ",")
      if (v[2] + 0 == 0) { print "zero"; exit }
      if (v[1] + 0 > v[2] + 0) { print "reversed"; exit }
      print "range"; exit
    }
    { print "bad" }')
  case "$status:$verdict" in
    complete:range|stub:range|stub:tbd)
      echo "  OK: workflows/$base ($status, $envelope)" ;;
    *:zero)
      echo "  FAIL: workflows/$base has cost_envelope_usd $envelope, the template placeholder; price it or write TBD (stubs only)"
      FAILED=1 ;;
    *)
      echo "  FAIL: workflows/$base ($status) has cost_envelope_usd \"$envelope\"; a complete workflow needs [low, high] with 0 <= low <= high and high > 0"
      FAILED=1 ;;
  esac
done
echo ""

# --- CI runs this script on every file it reads (added v2.14.1) ---
# routing-validation.yml runs this script on a pull request only when a listed path changed. A
# check on a file outside that list does not run until the change is already on main: a PR that
# set a workflow's envelope back to [0, 0] passed CI that way. Keep this list to what the checks
# above read, and the workflow's paths to this list.
echo "Checking CI runs on every file this script reads..."
# The workflow file is an input too: a PR that only edits its paths must be checked on the PR.
VALIDATOR_INPUTS="routing/** agents/** tests/** memory-templates/** workflows/** scripts/** .claude-plugin/plugin.json governance/EVOLUTION.md docs/INSTALLATION.md docs/PROMPT_LIBRARY.md README.md .github/workflows/routing-validation.yml"
CI_WORKFLOW="$DZNR_ROOT/.github/workflows/routing-validation.yml"
ci_paths=$(awk '
  /^[[:space:]]*pull_request:/ { in_pr = 1; next }
  in_pr && /^[[:space:]]*paths:/ { in_paths = 1; next }
  in_paths && /^[[:space:]]*-[[:space:]]/ { p = $0; sub(/^[[:space:]]*-[[:space:]]*/, "", p); gsub(/[\047"]/, "", p); print p; next }
  in_paths { exit }
' "$CI_WORKFLOW" 2>/dev/null || true)
# Read as lines, not word-split: an unquoted routing/** would expand to the files it matches.
while IFS= read -r input; do
  if printf '%s\n' "$ci_paths" | grep -Fxq -- "$input"; then
    echo "  OK: $input"
  else
    echo "  FAIL: .github/workflows/routing-validation.yml does not run on $input, which this script checks"
    FAILED=1
  fi
done < <(printf '%s\n' "$VALIDATOR_INPUTS" | tr ' ' '\n')
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
