# mindset

Agent mindset, principles, and shared skills for development projects.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/luceinaltis/mindset/main/install.sh | bash
```

> **Windows:** Run in Git Bash, not PowerShell.

---

## What it does

- Copies `AGENTS.md` to `.claude/` or `.codex/` directory
- Copies each skill into `.claude/skills/` or `.agents/skills/`
- No leftover files — temp clone is deleted after install
- Changes apply on next session start

## Update

Re-run the install command to get the latest version.

## Custom skills

Add project-specific skills to `.claude/skills/` or `.agents/skills/` — mindset won't overwrite them.
