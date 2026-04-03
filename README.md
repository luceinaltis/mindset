# mindset

Agent mindset, principles, and shared skills for development projects.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/luceinaltis/mindset/main/install.sh | bash
```

---

## What it does

- Clones this repo to `~/mindset`
- Adds `@~/mindset/AGENTS.md` to `~/.claude/CLAUDE.md` (global) or `./CLAUDE.md` (project)
- Claude Code picks it up automatically on next session start

## Update

```bash
git -C ~/mindset pull
```

## Custom skills

Add project-specific rules in your project's `AGENTS.md` or import a custom file:

```markdown
# CLAUDE.md
@~/mindset/AGENTS.md
@./docs/our-custom-skill.md
```
