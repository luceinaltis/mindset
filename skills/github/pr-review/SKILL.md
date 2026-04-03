---
name: PR Review
description: Use when reviewing pull requests — diff analysis, blocking vs non-blocking issues, and merge decisions.
---

# Skill: PR Review

## Purpose
Review a GitHub Pull Request and provide actionable feedback.

## Steps

1. **Fetch PR info**
   ```bash
   gh pr view <number> --repo <owner>/<repo>
   gh pr diff <number> --repo <owner>/<repo>
   ```

2. **Analyze the diff**
   - Does it match the PR description?
   - Does it follow the project's coding conventions (AGENTS.md)?
   - Are there obvious bugs, missing error handling, or untested edge cases?
   - Does it introduce unnecessary complexity?

3. **Post a review comment**
   ```bash
   gh pr comment <number> --repo <owner>/<repo> --body "<review>"
   ```
   Format:
   - Start with overall intent assessment
   - List issues with specific file/line references and suggested fixes
   - Keep tone practical, developer-to-developer

4. **Approve or request changes**
   - If no blocking issues: Approve + Squash Merge
     ```bash
     GITHUB_TOKEN=<bot-token> gh pr review <number> --repo <owner>/<repo> --approve
     GITHUB_TOKEN=<bot-token> gh pr merge <number> --repo <owner>/<repo> --squash --delete-branch --admin
     ```
   - If blocking issues: leave review comment, do not merge

## Blocking vs Non-Blocking

**Blocking — do not merge until fixed:**
- Bug or incorrect logic
- Hardcoded secret or credential
- Silent error swallowing (`except: pass`)
- Missing declared dependency (implicit import)
- Breaking change without documentation
- Test that verifies wrong behavior

**Non-Blocking — comment but still merge:**
- Missing type hints on internal functions
- Style inconsistency not caught by linter
- Minor naming improvement
- Missing docstring on non-public function
- `TODO` with a tracking issue

## Review Checklist

- [ ] Code matches PR description intent
- [ ] Follows project conventions (naming, structure, style)
- [ ] No silent error swallowing
- [ ] No hardcoded secrets or credentials
- [ ] Dependencies are declared (not implicit)
- [ ] No dead code introduced
