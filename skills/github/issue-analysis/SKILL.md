---
name: Issue Analysis
description: Use when diagnosing bugs — reproduce, locate root cause, assess impact, and propose fix.
---

# Skill: Issue Analysis

## Purpose
Diagnose a bug or problem report and produce a clear, actionable analysis.

## Process

1. **Reproduce the issue**
   - Get exact steps, inputs, and expected vs. actual behavior
   - If reproducible locally: confirm with a minimal test case
   - If not reproducible locally: analyze statically — read the code path, identify where the behavior diverges
   - If neither is possible: state that clearly, don't guess

2. **Locate the root cause**
   - Start from the error/symptom, trace backwards
   - Use logs, stack traces, and diffs to narrow down
   - Distinguish: root cause vs. symptom vs. side effect

3. **Assess impact**
   - How widespread? (one user, all users, specific condition)
   - Is data corrupted or just UI broken?
   - Is there a workaround?

4. **Propose a fix**
   - Describe the fix concisely
   - Estimate scope: one-liner vs. larger refactor
   - Flag if the fix requires design decisions (don't silently make them)

5. **Document findings**
   - Post analysis as a GitHub issue comment
   - Include: root cause, affected scope, proposed fix, open questions

## Issue Comment Format

```
**Root Cause**
<one paragraph — what's actually wrong and why>

**Impact**
<who/what is affected and how severe>

**Proposed Fix**
<concrete suggestion — code snippet if helpful>

**Open Questions** (if any)
<things that need a decision before fixing>
```

## Red Flags During Analysis

- "It works on my machine" without checking environment differences
- Fixing the symptom without understanding root cause
- Assuming the fix is simple before reading the relevant code
- Making architectural decisions without flagging them
