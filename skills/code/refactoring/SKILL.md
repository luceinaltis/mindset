---
name: Refactoring
description: Use when restructuring existing code — extract functions, rename, move modules without changing behavior.
---

# Skill: Refactoring

## Purpose
Improve code structure, readability, and maintainability without changing behavior.

## When to Refactor

- Function exceeds 50 lines
- Same logic appears 3+ times (DRY)
- Function/class does more than one thing (SRP violation)
- Naming is misleading or unclear
- Dependency on a concrete implementation instead of an interface

## When NOT to Refactor

- No tests exist for the code — write tests first
- Behavior is unclear — clarify intent before restructuring
- Refactor scope creep — stay focused on the original target

## Process

1. **Understand before touching**
   - Read the full function/module, not just the target area
   - Identify what the code is actually doing vs. what it should do

2. **Write or verify tests first**
   - Refactoring without tests is guessing
   - If no tests exist, write a minimal characterization test before proceeding

3. **Make one change at a time**
   - Extract function → commit
   - Rename → commit
   - Move module → commit
   - Never bundle unrelated changes in one refactor PR

4. **Verify behavior is unchanged**
   - Run existing tests after each step
   - If tests break, the refactor changed behavior — stop and investigate

5. **Update docs if needed**
   - If the module structure changed, update `AGENTS.md` project structure
   - If a public API changed, update relevant docs

## Common Patterns

### Extract Function
```python
# Before
def process_order(order):
    total = sum(item.price * item.qty for item in order.items)
    discount = total * 0.1 if order.is_vip else 0
    return total - discount

# After
def calculate_total(items) -> float:
    return sum(item.price * item.qty for item in items)

def apply_discount(total: float, is_vip: bool) -> float:
    return total * 0.9 if is_vip else total

def process_order(order):
    total = calculate_total(order.items)
    return apply_discount(total, order.is_vip)
```

### Dependency Inversion
```python
# Before — depends on concrete class
def analyze(provider: FinnhubAdapter): ...

# After — depends on protocol
def analyze(provider: PriceProvider): ...
```

## PR Guidelines

- Title: `refactor: <what changed>`
- Description must explain: what changed and why, not how
- One logical change per PR — don't mix refactor with feature work
