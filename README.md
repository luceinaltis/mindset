# mindset

Agent mindset, principles, and shared skills for development projects.

## Structure

```
mindset/
├── AGENTS.md              # Global principles + behavior guidelines
└── skills/                # Shared skills
    ├── code/
    │   ├── feature-dev.md
    │   ├── design.md
    │   ├── refactoring.md
    │   ├── testing.md
    │   ├── quality.md
    │   └── dependencies.md
    └── github/
        ├── pr-review.md
        ├── pr-review-cycle.md
        ├── issue-analysis.md
        ├── ci-setup.md
        ├── hotfix.md
        └── repo-setup.md
```

---

## Installation

### Option 1: Global (all projects)

Apply mindset to every Claude Code session on your machine.

```bash
# Clone mindset somewhere stable
git clone https://github.com/luceinaltis/mindset ~/mindset

# Create or edit your global CLAUDE.md
mkdir -p ~/.claude
```

Add to `~/.claude/CLAUDE.md`:

```markdown
@~/mindset/AGENTS.md
```

Done. Claude Code loads this at the start of every session, across all projects.

---

### Option 2: Per-project

Apply mindset to a specific project only.

```bash
# Clone mindset somewhere stable (skip if already done)
git clone https://github.com/luceinaltis/mindset ~/mindset
```

Add to your project's `CLAUDE.md` (or create one):

```markdown
@AGENTS.md
@~/mindset/AGENTS.md
```

To include specific skills only:

```markdown
@AGENTS.md
@~/mindset/skills/code/feature-dev.md
@~/mindset/skills/github/pr-review.md
```

---

## Updating

```bash
cd ~/mindset
git pull
```

Changes take effect the next time Claude Code starts a session.

---

## Adding Custom Skills

Add project-specific skills in your project's `AGENTS.md` or in a separate file:

```markdown
# AGENTS.md (project-level)
@~/mindset/AGENTS.md

## Project-Specific Skills

### Our Custom Rule
...
```

Or create a dedicated file and import it:

```markdown
# CLAUDE.md
@~/mindset/AGENTS.md
@./docs/our-custom-skill.md
```
