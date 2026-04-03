---
name: Repo Setup
description: Use when bootstrapping new repositories — project structure, AGENTS.md, CI, and initial commit.
---

# Skill: Repo Setup

## Purpose
Bootstrap a new GitHub repository with proper structure and agent configuration.

## Steps

1. **Create the repo**
   ```bash
   gh repo create <name> --public --description "<description>"
   ```

2. **Clone and initialize**
   ```bash
   git clone https://github.com/<owner>/<name>
   cd <name>
   ```

3. **Read mindset for context**
   - Fetch `mindset/MINDSET.md` for global principles
   - Fetch relevant `mindset/skills/` for project type

4. **Create AGENTS.md**
   Based on `mindset/MINDSET.md` + project-specific rules:
   - Project overview and purpose
   - Tech stack
   - Project structure
   - Coding conventions
   - Common commands

5. **Set up CI**
   - Add `.github/workflows/` with lint + test jobs
   - Use `pyproject.toml` or `package.json` for tooling config

6. **Initial commit**
   ```bash
   git add .
   git commit -m "chore: initial project setup"
   git push
   ```
