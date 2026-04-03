---
name: Dependency Management
description: Use when adding, removing, or updating project dependencies.
---

# Skill: Dependency Management

## Purpose
Evaluate and manage third-party dependencies responsibly.

## Before Adding a New Dependency

Ask these questions in order:

1. **Is it necessary?**
   - Can this be implemented in <50 lines without a library?
   - If yes, implement it. Don't add a dependency for trivial logic.

2. **Is there an existing dependency that already does this?**
   - Check `pyproject.toml` or `package.json` first
   - Prefer extending an existing library over adding a new one

3. **Is it well-maintained?**
   - Last release: within 12 months
   - Open issues: no critical unresolved bugs
   - Stars/downloads: meaningful adoption

4. **What's the license?**
   - MIT, Apache 2.0, BSD → safe
   - GPL → careful, can affect your project's license
   - Unknown or custom → flag before adding

5. **What's the blast radius if it breaks?**
   - Core dependency (used everywhere) → high risk, scrutinize more
   - Peripheral (used in one script) → lower risk

## Adding a Dependency

```bash
# Python (uv)
uv add <package>          # runtime dependency
uv add --dev <package>    # dev-only dependency
```

Always commit `pyproject.toml` and the lockfile together.

## Removing a Dependency

- Check all usages before removing: `grep -r "import <package>" .`
- Remove from `pyproject.toml` and run `uv sync`
- Verify tests still pass

## Updating Dependencies

- Don't update all dependencies at once — update one at a time
- After updating, run full test suite
- Check the changelog for breaking changes before updating major versions

## Red Flags

- Adding a heavy framework for a single utility function
- Pinning to an exact version without a comment explaining why
- Dependencies with no tests or documentation
- Transitive dependencies pulling in known vulnerable packages
