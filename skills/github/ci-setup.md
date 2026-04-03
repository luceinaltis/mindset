# Skill: CI Setup

## Purpose
Set up a CI pipeline that enforces code quality on every PR.

## Minimal CI for Python Projects

```yaml
# .github/workflows/ci.yml
name: CI

on:
  pull_request:

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"
      - uses: astral-sh/setup-uv@v4
      - name: Install dependencies
        run: uv sync
      - name: Ruff lint
        run: uv run ruff check .
      - name: Ruff format
        run: uv run ruff format --check .
      - name: Pyright
        run: uv run pyright

  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: "3.12"
      - uses: astral-sh/setup-uv@v4
      - name: Install dependencies
        run: uv sync
      - name: Run tests
        run: uv run pytest
```

## pyproject.toml Config

```toml
[tool.ruff]
target-version = "py312"
line-length = 100

[tool.ruff.lint]
select = ["E", "F", "I", "W"]

[tool.pyright]
pythonVersion = "3.12"
typeCheckingMode = "basic"

[tool.pytest.ini_options]
testpaths = ["tests"]
```

## Rules

- **lint and test jobs must be separate** — lint failure shouldn't skip test results
- **Never skip CI on PR** — no `paths:` filter that excludes source files
- **Fail fast** — lint runs before tests to catch cheap errors first
- **No secrets in workflow files** — use GitHub Secrets (`${{ secrets.KEY }}`)

## Auto-merge Setup (optional)

Only add auto-merge if CI is stable and tests have meaningful coverage:

```yaml
auto-merge:
  needs: [lint, test]
  runs-on: ubuntu-latest
  permissions:
    contents: write
    pull-requests: write
  steps:
    - name: Enable auto-merge
      run: gh pr merge ${{ github.event.pull_request.number }} --auto --squash
      env:
        GH_TOKEN: ${{ github.token }}
```
