#!/usr/bin/env sh
# validate_suite.sh — Amplifier ecosystem skill suite coherence check
# Run from repo root: bash scripts/validate_suite.sh
set -eu

PASS=0
FAIL=0
WARN=0

pass()  { printf 'PASS:  %s\n' "$1"; PASS=$((PASS + 1)); }
fail()  { printf 'FAIL:  %s\n' "$1"; FAIL=$((FAIL + 1)); }
warn()  { printf 'WARN:  %s\n' "$1"; WARN=$((WARN + 1)); }

# ── Expected skill files ─────────────────────────────────────────────────────────
SKILLS="
amplifier-skill/SKILL.md
amplifier-cross-repo-workflows/SKILL.md
amplifier-core-concepts/SKILL.md
amplifier-module-and-bundle-development/SKILL.md
amplifier-foundation-reference/SKILL.md
amplifier-app-integration/SKILL.md
"

for skill in $SKILLS; do
  if [ -f "$skill" ]; then
    pass "exists: $skill"
  else
    fail "missing: $skill"
  fi
done

# ── YAML frontmatter present ─────────────────────────────────────────────────────
for skill in $SKILLS; do
  [ -f "$skill" ] || continue
  if head -1 "$skill" | grep -q "^---$"; then
    pass "frontmatter: $skill"
  else
    fail "no frontmatter: $skill"
  fi
done

# ── No stubs remaining ───────────────────────────────────────────────────────────
for skill in $SKILLS; do
  [ -f "$skill" ] || continue
  if grep -q "STUB" "$skill" 2>/dev/null; then
    fail "still a stub: $skill"
  else
    pass "not a stub: $skill"
  fi
done

# ── Minimum line count (stubs are ~10 lines; real skills are 80+) ────────────────
for skill in $SKILLS; do
  [ -f "$skill" ] || continue
  linecount="$(wc -l < "$skill")"
  if [ "$linecount" -ge 80 ]; then
    pass "content length OK ($linecount lines): $skill"
  elif [ "$linecount" -ge 30 ]; then
    warn "content may be thin ($linecount lines): $skill"
  else
    fail "content too short ($linecount lines — looks like stub): $skill"
  fi
done

# ── Router skill names ───────────────────────────────────────────────────────────
if grep -q "^name: amplifier-ecosystem-router" amplifier-skill/SKILL.md 2>/dev/null; then
  pass "router skill name: amplifier-ecosystem-router"
else
  fail "router skill missing name: amplifier-ecosystem-router"
fi

# ── Router routes to all companions ──────────────────────────────────────────────
for companion in amplifier-cross-repo-workflows amplifier-core-concepts \
                 amplifier-module-and-bundle-development amplifier-foundation-reference \
                 amplifier-app-integration; do
  if grep -q "$companion" amplifier-skill/SKILL.md 2>/dev/null; then
    pass "router references: $companion"
  else
    fail "router missing reference to: $companion"
  fi
done

# ── Mandatory canonical sources referenced ───────────────────────────────────────
check_ref() {
  ref="$1"; skill="$2"
  if grep -q "$ref" "$skill" 2>/dev/null; then
    pass "canonical ref '$ref' in $skill"
  else
    fail "canonical ref '$ref' MISSING from $skill"
  fi
}

check_ref "MODULES.md"                    "amplifier-module-and-bundle-development/SKILL.md"
check_ref "MODULE_DEVELOPMENT.md"         "amplifier-module-and-bundle-development/SKILL.md"
check_ref "BUNDLE_GUIDE.md"               "amplifier-module-and-bundle-development/SKILL.md"
check_ref "APPLICATION_INTEGRATION_GUIDE" "amplifier-app-integration/SKILL.md"
check_ref "APPLICATION_INTEGRATION_GUIDE" "amplifier-foundation-reference/SKILL.md"
check_ref "amplifier-app-cli"             "amplifier-cross-repo-workflows/SKILL.md"

# ── Expert agents referenced in router ───────────────────────────────────────────
for agent in "amplifier:amplifier-expert" "core:core-expert" "foundation:foundation-expert" "foundation:ecosystem-expert"; do
  if grep -q "$agent" amplifier-skill/SKILL.md 2>/dev/null; then
    pass "expert agent in router: $agent"
  else
    fail "expert agent MISSING from router: $agent"
  fi
done

# ── Helper scripts exist and are executable ──────────────────────────────────────
for script in amplifier-skill/scripts/list_agents.sh amplifier-skill/scripts/session_context.sh; do
  if [ -x "$script" ]; then
    pass "executable: $script"
  elif [ -f "$script" ]; then
    fail "not executable: $script (run: chmod +x $script)"
  else
    fail "missing: $script"
  fi
done

# ── Test files exist ─────────────────────────────────────────────────────────────
for test in tests/test_list_agents.sh tests/test_session_context.sh; do
  if [ -f "$test" ]; then
    pass "exists: $test"
  else
    warn "missing: $test (Phase 3 test not yet written)"
  fi
done

# ── README install path is correct ───────────────────────────────────────────────
if grep -q "amplifier-skill/SKILL.md" README.md 2>/dev/null; then
  pass "README: references amplifier-skill/SKILL.md (not root SKILL.md)"
else
  fail "README: does not reference amplifier-skill/SKILL.md — may have path drift"
fi

# ── Summary ──────────────────────────────────────────────────────────────────────
printf '\n'
printf '─%.0s' $(seq 1 40) 2>/dev/null || printf '----------------------------------------'
printf '\n'
printf 'Suite validation: %d passed, %d failed, %d warnings\n' "$PASS" "$FAIL" "$WARN"
printf '\n'
[ "$FAIL" -eq 0 ]
