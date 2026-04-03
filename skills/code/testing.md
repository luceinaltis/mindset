# Skill: Testing

## Purpose
Write tests that verify behavior and catch regressions.

## What to Test

**Test these:**
- Core business logic
- Edge cases and boundary conditions
- Failure modes — what happens when input is invalid or a dependency fails
- Behavior that would be painful to break silently

**Don't bother testing:**
- Framework/library internals
- Trivial getters/setters with no logic
- Code that's already covered by an integration test

## Test Types

### Unit Tests
- Test one function or class in isolation
- Mock external dependencies (DB, API, filesystem)
- Fast — should run in milliseconds
- Location: `tests/unit/`

### Integration Tests
- Test how components work together
- Use real dependencies where practical (test DB, local files)
- Slower — run on CI, not every save
- Location: `tests/integration/`

## Test Structure (AAA)

```python
def test_apply_discount_for_vip():
    # Arrange
    order = Order(total=100.0, is_vip=True)

    # Act
    result = apply_discount(order)

    # Assert
    assert result == 90.0
```

## Minimum Coverage Per Feature

- At least one success case
- At least one failure/error case
- Edge cases that are explicitly mentioned in requirements

## Python Test Conventions

```python
# File naming
tests/unit/test_<module>.py
tests/integration/test_<feature>.py

# Test naming — describe behavior, not implementation
def test_price_provider_returns_float_for_valid_ticker(): ...
def test_price_provider_raises_on_invalid_ticker(): ...

# Use pytest fixtures for shared setup
@pytest.fixture
def mock_client():
    return MagicMock(spec=FinnhubClient)
```

## Red Flags

- Tests that only test the happy path
- Tests with no assertions (`assert True`)
- Tests that test implementation details instead of behavior
- Mocking so much that the test doesn't verify anything real
- Tests that break when you rename a variable (too tightly coupled)
