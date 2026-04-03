# mindset

Agent mindset, principles, and shared skills for development projects.

## Structure

```
mindset/
├── MINDSET.md              # Global agent principles (Level 1)
├── skills/                 # Shared skills across all projects
│   ├── github/
│   │   ├── pr-review.md    # How to review PRs
│   │   └── repo-setup.md   # How to set up a new repo
│   └── code/
│       ├── quality.md      # Code quality standards
│       └── conventions.md  # General coding conventions
└── personas/               # Agent persona templates (Level 2)
    └── dev-reviewer.md     # Developer + code reviewer persona
```

## How to Use

When starting a new project, the agent reads `MINDSET.md` and relevant `skills/` to bootstrap the project's `AGENTS.md`.

Project-specific rules always live in the project's own `AGENTS.md` (Level 3).
