#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

pass() { echo -e "${GREEN}✓${NC} $1"; }
fail() { echo -e "${RED}✗${NC} $1"; exit 1; }

echo "Validating claude-lsp-plugins..."
echo

# Check .lsp.json exists
[ -f "$ROOT_DIR/.lsp.json" ] || fail ".lsp.json not found"
pass ".lsp.json exists"

# Check .lsp.json is valid JSON
jq empty "$ROOT_DIR/.lsp.json" 2>/dev/null || fail ".lsp.json is not valid JSON"
pass ".lsp.json is valid JSON"

# Check plugin.json exists
[ -f "$ROOT_DIR/.claude-plugin/plugin.json" ] || fail "plugin.json not found"
pass "plugin.json exists"

# Check plugin.json is valid JSON
jq empty "$ROOT_DIR/.claude-plugin/plugin.json" 2>/dev/null || fail "plugin.json is not valid JSON"
pass "plugin.json is valid JSON"

echo
echo "Checking LSP server availability..."

# Check ty
if command -v ty &>/dev/null; then
    pass "ty found: $(which ty)"
else
    fail "ty not found in PATH (install: uv tool install ty)"
fi

# Check expert
if command -v expert &>/dev/null; then
    pass "expert found: $(which expert)"
else
    fail "expert not found in PATH (download from github.com/elixir-lang/expert/releases)"
fi

echo
echo -e "${GREEN}All validations passed${NC}"
