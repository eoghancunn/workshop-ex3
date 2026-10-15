# Workshop folder: Exercise 3

The same survey as Exercises 1 and 2, now with a plan, an instruction file and settings for each tool.

## What is here

| File | Purpose |
|---|---|
| `PLAN.md` | The analysis plan. Fill in the items marked [OPEN] before you start the agent. |
| `prompts/ex3.txt` | The prompt for Exercise 3. |
| `AGENTS.md` | Instructions the agent reads (Codex, Cursor and Copilot read it directly; `CLAUDE.md` imports it; Gemini CLI is pointed at it). |
| `Makefile` | `make mock` tests the script on invented data; `make all` rebuilds everything from the raw data. |
| `hooks/audit-log.sh` | Records every shell command the agent runs in `.agent-audit.log` and blocks git commit, merge and push. |
| `data/`, `docs/codebook.md` | The data, its checksum, the mock data and the codebook. |

## Settings for each tool

| Tool | Files | What they do |
|---|---|---|
| Claude Code | `.claude/settings.json`, `CLAUDE.md` | Asks before each command; agent cannot read or edit `data/raw/` or edit `PLAN.md`; sandbox on; audit-log hook |
| Codex | `.codex/config.toml`, `.codex/rules/`, `.codex/hooks.json` | Read-only sandbox, asks before writing; git commit/merge/push forbidden; audit-log hook. Trust the folder when Codex asks, and approve the hook in `/hooks`. |
| Cursor | `.cursor/hooks.json`, `.cursorignore` | Audit-log hook; agent file tools cannot see `data/raw/`. Set Run Mode to Allowlist with an empty list yourself. |
| Copilot (VS Code) | `.vscode/settings.json`, `.github/hooks/` | Reads `AGENTS.md`; no automatic approval of terminal commands; terminal sandbox on with network off (Preview); audit-log hook. Trust the workspace when VS Code asks. |
| Gemini CLI | `.gemini/settings.json` | Reads `AGENTS.md`; audit-log hook. Start it with `gemini --sandbox`. |

The hook needs `bash` and either `jq` or `python3`. On Windows, use WSL or Git Bash.

## Running the analysis yourself

```
make all
```

This deletes derived files and results, checks that the raw data is unchanged, and runs `analysis/run_all.R` or `analysis/run_all.py` on the raw data. Without `make`: run `Rscript analysis/run_all.R data/raw/survey.csv results` (or the Python equivalent).
