#!/bin/bash
# Workshop hook: records every shell command an agent runs in .agent-audit.log,
# and blocks git commit, merge and push (the researcher does those).
# Used by Claude Code, Codex, Cursor, Copilot and Gemini CLI; each reads the
# command from a slightly different field, so several are tried.

input=$(cat)

if command -v jq >/dev/null 2>&1; then
  cmd=$(printf '%s' "$input" | jq -r '.tool_input.command // .command // empty' 2>/dev/null)
else
  cmd=$(printf '%s' "$input" | python3 -c 'import json,sys; d=json.load(sys.stdin); print((d.get("tool_input") or {}).get("command") or d.get("command") or "")' 2>/dev/null)
fi

# Not a shell command (or the input could not be read): let it through.
[ -z "$cmd" ] && exit 0

root=$(git rev-parse --show-toplevel 2>/dev/null || pwd)
printf '%s\t%s\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$cmd" >> "$root/.agent-audit.log"

if printf '%s' "$cmd" | grep -qE 'git[[:space:]]+(commit|merge|push)'; then
  echo "Blocked by the workshop hook: the researcher commits, merges and pushes." >&2
  exit 2
fi

exit 0
