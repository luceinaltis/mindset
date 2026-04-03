# mindset

Agent mindset, principles, and shared skills for development projects.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/luceinaltis/mindset/main/install.sh | bash
```

> **Windows:** Run in Git Bash, not PowerShell.

---

## What it does

- Clones this repo to `~/.claude/mindset` or `~/.codex/mindset`
- Claude Code: adds `@~/.claude/mindset/AGENTS.md` to `CLAUDE.md`
- Codex: copies `AGENTS.md` to the target location
- Symlinks each skill into `.claude/skills/` or `.agents/skills/`
- Changes apply on next session start

## Update

```bash
# Claude Code
git -C ~/.claude/mindset pull

# Codex
git -C ~/.codex/mindset pull
```

## Custom skills

Add project-specific rules in your project's `AGENTS.md` or import a custom file:

```markdown
# CLAUDE.md
@~/.claude/mindset/AGENTS.md
@./docs/our-custom-skill.md
```
