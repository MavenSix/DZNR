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
# shows. A second listing such as "slack (small-business)" is the same failure: the plugin declares
# plain slack, so no server carries the longer name. Until v2.14.3 three rows were known exceptions
# and warned; all three are fixed, so there are none, and a row like them fails.
echo "Checking MCP table rows name a server..."
names_checked=0
while IFS=$'\t' read -r file name; do
  [ -z "$name" ] && continue
  names_checked=$((names_checked + 1))
  lower=$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]')
  if printf '%s' "$lower" | grep -Eq '^[a-z0-9][a-z0-9._-]*$'; then
    continue
  fi
  echo "  FAIL: $file row \"$name\" is not a server name; use the server's own name (plugin:x:gmail is gmail, claude.ai Google Calendar is google-calendar), and put a second listing's owners on the first"
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

# --- Each connector is defined once (added v2.14.3) ---
# DZNR OS keeps the first definition of a name it reads, files in sorted order, and drops the rest
# with their owners: slack in plugin-connectors.md and workspace-and-data.md lost Tár that way, and
# box listed in two categories of one file was reported as cross-listed. Names are compared as DZNR
# OS reads them: a table row's first cell, or an individual spec's mcp-name, lowercased. A cluster's
# own mcp-name names the cluster, not a server, so only its rows count.
echo "Checking each connector is defined once..."
defined=$(
  for f in "$MCPS_DIR"/*.md; do
    base=$(basename "$f")
    [ "$base" = "_template.md" ] && continue
    if [ "$base" = "plugin-connectors.md" ] || grep -q '^## MCPs in this cluster' "$f"; then
      awk -v file="$base" '
        /^\|[[:space:]]*MCP[[:space:]]*\|/ { in_table = 1; next }
        in_table && /^\|/ {
          if ($0 ~ /^\|[[:space:]:|-]+\|[[:space:]]*$/) next
          split($0, cells, "|"); cell = cells[2]
          gsub(/^[[:space:]]+|[[:space:]]+$/, "", cell)
          if (cell != "") print tolower(cell) "\t" file
          next
        }
        { in_table = 0 }
      ' "$f"
    else
      awk -v file="$base" '
        /^---$/ { n++; next }
        n == 1 && /^mcp-name:/ {
          sub(/^mcp-name:[[:space:]]*/, ""); sub(/[[:space:]]+$/, "")
          if ($0 != "") print tolower($0) "\t" file
          exit
        }
      ' "$f"
    fi
  done
)
defined_count=$(printf '%s\n' "$defined" | grep -c . || true)
twice=$(printf '%s\n' "$defined" | awk -F '\t' '
  $1 != "" { count[$1]++; files[$1] = (files[$1] == "" ? $2 : files[$1] ", " $2) }
  END { for (n in count) if (count[n] > 1) print n "\t" files[n] }
' | sort)
if [ -n "$twice" ]; then
  while IFS=$'\t' read -r name files; do
    echo "  FAIL: connector \"$name\" is defined more than once ($files); keep one row and give it every owner"
  done <<< "$twice"
  FAILED=1
fi
echo "  OK: $defined_count connector definitions read"
echo ""

# --- MCP owners are subagents (added v2.14.1) ---
# DZNR OS reads an owner as a subagent name, the way its registry does: parentheses dropped, split
# on commas and " or ", lowercased, Tár as tar, spaces as hyphens. "cross-cutting" is the one owner
# that is not an agent: DZNR OS's catalog, connector report and run preflight read it as a connector
# every agent may use, so a pdf outage warns no one. Listing all nine agents instead would warn on
# every run, and would miss a tenth agent.
echo "Checking MCP owners are subagents..."
known_agents=$(find "$DZNR_ROOT/agents" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | tr '[:upper:]' '[:lower:]')
owners_checked=0
while IFS=$'\t' read -r file name raw; do
  [ -z "$raw" ] && continue
  while IFS= read -r owner; do
    owner=$(printf '%s' "$owner" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g' | tr '[:upper:]' '[:lower:]' | sed -E 's/^tár$/tar/; s/[[:space:]]+/-/g')
    case "$owner" in ''|n/a|none) continue ;; esac
    owners_checked=$((owners_checked + 1))
    [ "$owner" = "cross-cutting" ] && continue
    if ! printf '%s\n' "$known_agents" | grep -Fxq "$owner"; then
      echo "  FAIL: $file \"$name\" has owner \"$owner\", which is neither cross-cutting nor a directory under agents/"
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

# --- Statuses are lifecycle states (added v2.14.3) ---
# routing/MCPS.md's lifecycle gives a spec four statuses: PENDING, CONFIGURED-NOT-ACTIVE, ACTIVE
# and DEPRECATED. DOCUMENTED is the step that writes a spec, and that spec's status is PENDING.
# DZNR OS shows a status's first word as it is, so apple-notes, with no server on either machine,
# showed DOCUMENTED while runninghub, in the same state, showed PENDING. Each spec's status and
# each cluster row's Status cell must start with one of the four. plugin-connectors.md has
# neither: DZNR OS gives its rows DOCUMENTED itself.
echo "Checking statuses are lifecycle states..."
statuses_checked=0
while IFS=$'\t' read -r file name status; do
  [ -z "$file" ] && continue
  statuses_checked=$((statuses_checked + 1))
  word=$(printf '%s' "$status" | grep -oE '^[A-Z][A-Z-]*' || true)
  case "$word" in PENDING|CONFIGURED-NOT-ACTIVE|ACTIVE|DEPRECATED) continue ;; esac
  echo "  FAIL: $file \"$name\" has status \"$status\"; start it with PENDING, CONFIGURED-NOT-ACTIVE, ACTIVE or DEPRECATED (routing/MCPS.md, MCP lifecycle)"
  FAILED=1
done < <(
  for f in "$MCPS_DIR"/*.md; do
    base=$(basename "$f")
    [ "$base" = "_template.md" ] && continue
    awk -v file="$base" '
      /^---$/ { n++; next }
      n == 1 && /^status:/ { s = $0; sub(/^status:[[:space:]]*/, "", s); sub(/[[:space:]]+$/, "", s); print file "\t" file "\t" s; next }
      /^\|[[:space:]]*MCP[[:space:]]*\|/ {
        in_table = 1; col = 0
        k = split($0, head, "|")
        for (i = 2; i < k; i++) {
          h = tolower(head[i]); gsub(/^[[:space:]]+|[[:space:]]+$/, "", h)
          if (h == "status") col = i
        }
        next
      }
      in_table && /^\|/ {
        if ($0 ~ /^\|[[:space:]:|-]+\|[[:space:]]*$/) next
        split($0, cells, "|"); name = cells[2]; s = cells[col]
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", name); gsub(/^[[:space:]]+|[[:space:]]+$/, "", s)
        if (col > 0) print file "\t" name "\t" s
        next
      }
      { in_table = 0 }
    ' "$f"
  done
)
echo "  OK: $statuses_checked statuses read"
echo ""

# --- An individual spec is named for its server, or says why not (added v2.14.3) ---
# routing/MCPS.md puts a spec at routing/mcps/[mcp-name].md. adobe.md keeps its name although its
# server is adobe-for-creativity, because the docs call it Adobe and the pending check below
# searches for the file name too. A file named otherwise without a "## Server name" section saying
# why is a rename someone forgot, and the pending check would search for the wrong word.
echo "Checking individual spec file names..."
for f in "$MCPS_DIR"/*.md; do
  base=$(basename "$f" .md)
  case "$base" in _template|plugin-connectors) continue ;; esac
  grep -q '^## MCPs in this cluster' "$f" && continue
  mcp=$(awk '/^---$/{n++; next} n==1 && /^mcp-name:/{print $2; exit}' "$f" | tr '[:upper:]' '[:lower:]')
  [ -z "$mcp" ] || [ "$base" = "$mcp" ] && continue
  if grep -q '^## Server name' "$f"; then
    echo "  OK: $base.md is $mcp, and its Server name section says why"
  else
    echo "  FAIL: routing/mcps/$base.md has mcp-name $mcp; name the file $mcp.md, or add a \"## Server name\" section saying why not"
    FAILED=1
  fi
done
echo "  OK: individual spec file names checked"
echo ""

# --- An ACTIVE connector is not called pending elsewhere (added v2.14.1) ---
# After Mobbin went ACTIVE, Sherlock's prompt still listed its activation as future work, the
# evolution protocol still called it deferred, and the install guide still listed Higgsfield as
# PENDING months after its spec said ACTIVE. A line naming an ACTIVE connector beside one of
# these phrases is one of those leftovers.
# The docs name a connector by its spec's file name as well as its mcp-name, so both are searched.
# They differ only for adobe.md (mcp-name adobe-for-creativity, since v2.14.3): the docs call it
# Adobe, and searching the mcp-name alone let "PENDING: ... Adobe" through.
echo "Checking ACTIVE connectors are not called pending..."
PENDING_PHRASES='PENDING|deferred to availability|when the connection lands|awaiting MCP availability|not currently in the MCP registry'
for f in "$MCPS_DIR"/*.md; do
  base=$(basename "$f" .md)
  [ "$base" = "_template" ] && continue
  spec_status=$(awk '/^---$/{n++; next} n==1 && /^status:/{print $2; exit}' "$f")
  [ "$spec_status" = "ACTIVE" ] || continue
  mcp=$(awk '/^---$/{n++; next} n==1 && /^mcp-name:/{print $2; exit}' "$f")
  case "$mcp" in ''|*-cluster) continue ;; esac
  terms="$mcp"
  [ "$base" = "$mcp" ] || terms="$mcp $base"
  for term in $terms; do
    label="$term"
    [ "$term" = "$mcp" ] || label="$term ($mcp)"
    stale=$(cd "$DZNR_ROOT" && grep -n -i -w -- "$term" agents/*/AGENT.md governance/EVOLUTION.md docs/INSTALLATION.md docs/PROMPT_LIBRARY.md routing/*.md README.md 2>/dev/null | grep -E -- "$PENDING_PHRASES" || true)
    if [ -n "$stale" ]; then
      printf '%s\n' "$stale" | while IFS= read -r hit; do
        echo "  FAIL: $label is ACTIVE in routing/mcps but still called pending: $hit"
      done
      FAILED=1
    fi
  done
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
# CI runs this under mawk (ubuntu-latest's awk), so the awk stays plain: [ \t] rather than
# character classes, and tr strips the quotes rather than an octal escape inside the program.
ci_paths=$(awk '
  /^[ \t]*pull_request:/ { in_pr = 1; next }
  in_pr && /^[ \t]*paths:/ { in_paths = 1; next }
  in_paths && /^[ \t]*-[ \t]/ { p = $0; sub(/^[ \t]*-[ \t]*/, "", p); sub(/[ \t\r]*$/, "", p); print p; next }
  in_paths { exit }
' "$CI_WORKFLOW" 2>/dev/null | tr -d "'\"" || true)
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
