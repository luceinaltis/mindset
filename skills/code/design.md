# Skill: Design Before Implementing

## Purpose
Make explicit design decisions before writing implementation code.

## When to Apply

- Adding a new module or class
- Introducing a new dependency
- Changing how two components interact
- Feature that touches 3+ existing modules

## Design Checklist

1. **Define the interface first**
   - What are the inputs and outputs?
   - What does the caller need to know vs. what's internal?
   - Write the function/class signature before the body

2. **Identify dependencies**
   - What does this component need from the outside?
   - Depend on protocols/interfaces, not concrete implementations
   - If a new external dependency is needed, flag it

3. **Define failure modes**
   - What can go wrong?
   - How does the caller know something failed?
   - Use typed exceptions — never return `None` to signal failure silently

4. **Check for existing patterns**
   - Does the project already solve this kind of problem?
   - Use the same pattern — don't introduce a new one without reason

5. **Flag decisions that need input**
   - If multiple valid designs exist, present the options with tradeoffs
   - Don't silently pick one when the choice has meaningful consequences

## Example: Defining Interface First

```python
# Step 1: define the interface
class PriceProvider(Protocol):
    async def get_price(self, ticker: str) -> float: ...
    async def get_ohlcv(self, ticker: str, days: int) -> list[OHLCV]: ...

# Step 2: write the implementation
class FinnhubAdapter:
    async def get_price(self, ticker: str) -> float:
        ...
```

## Design Decisions to Always Flag

- Adding a new database table or changing schema
- Changing a public API (function signature, return type)
- Introducing a new third-party dependency
- Choosing between two valid architectural approaches
