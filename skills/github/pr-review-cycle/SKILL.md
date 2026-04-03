---
name: PR Review Cycle
description: Use when managing full PR review lifecycle — re-reviews, stale PR handling, and merge flow.
---

# Skill: PR Review Cycle

## Purpose
Manage the full review loop: initial review → changes requested → re-review → merge.

## Full Cycle

```
PR opened
  → Initial review (see pr-review.md)
  → If blocking issues: request changes
  → Author pushes fixes
  → Re-review changed parts only
  → Approve + Merge or repeat
```

## Re-review Process

1. **Check what changed since last review**
   ```bash
   gh pr view <number> --repo <owner>/<repo>
   gh pr diff <number> --repo <owner>/<repo>
   ```
   Focus on the parts that were flagged — don't re-review the whole PR.

2. **Verify each requested change was addressed**
   - Was the fix actually correct, or just cosmetic?
   - Did fixing one thing break another?

3. **Don't introduce new issues mid-cycle**
   - If you spot a new unrelated issue during re-review, note it but don't block the PR for it
   - Open a follow-up issue instead

4. **Approve when all blocking issues are resolved**
   - Non-blocking comments from the first review don't need to block merge
   - If the author addressed everything in good faith, approve

## Stale PR Policy

- If a PR has no activity for 7+ days after changes were requested: leave a comment asking for status
- If no response after another 7 days: close the PR with a note explaining why

## Common Failure Modes

- Re-reviewing the entire PR instead of just the changed parts (wastes time)
- Approving without checking if the requested changes were actually made
- Blocking on non-blocking issues from the first review
- Letting PRs go stale without following up
