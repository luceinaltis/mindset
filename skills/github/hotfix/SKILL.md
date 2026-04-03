---
name: Hotfix
description: Use when fixing production issues urgently — minimal change, fast PR, regression test.
---

# Skill: Hotfix

## Purpose
Fix a critical production issue quickly with minimal risk.

## When to Use
- Production is broken or severely degraded
- Data integrity is at risk
- Security vulnerability is exposed
- Normal PR process is too slow for the situation

## Core Rule
**Minimal change. Fix only the bug. Nothing else.**
No refactoring, no cleanup, no "while I'm here" changes.

## Process

1. **Confirm the issue**
   - Identify exactly what is broken and what the impact is
   - Do not start writing code until the root cause is clear

2. **Branch from the right place**
   ```bash
   git checkout main
   git pull
   git checkout -b fix/hotfix-<short-description>
   ```

3. **Make the smallest possible fix**
   - Change only what is necessary to resolve the issue
   - If a refactor is needed to make the fix clean, do it in a separate PR after

4. **Test the fix**
   - Run existing tests — they must not break
   - Add a regression test that would have caught the original bug

5. **Open a PR immediately**
   - Title: `fix: <what was broken>`
   - Description must include:
     - What broke and why
     - What the fix does
     - How to verify it's fixed

6. **Merge and monitor**
   - Squash merge
   - Watch logs/metrics after deploy to confirm the fix holds

## What NOT to Do

- Don't fix unrelated issues in the same PR
- Don't skip tests because it's "urgent"
- Don't merge without a description
- Don't leave the regression test for later — add it now

## After the Hotfix

- Open a follow-up issue documenting root cause and any tech debt introduced
- If the fix was hacky, create a cleanup PR immediately after
