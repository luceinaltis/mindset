# Skill: Feature Development

## Purpose
Implement a new feature from requirement to merged PR.

## Process

1. **Understand the requirement**
   - What problem does this solve?
   - What is the expected input and output?
   - What are the edge cases and failure modes?
   - If unclear: ask before writing a single line of code

2. **Read existing code first**
   - Find the relevant module(s)
   - Understand the current data flow
   - Identify where the new feature fits — don't add a new pattern if one already exists

3. **Design before implementing** (see `design.md`)
   - Define the interface first
   - Identify dependencies
   - If the design requires a decision from Kihwan, flag it before proceeding

4. **Implement incrementally**
   - Start with the core logic, not the wiring
   - Get the logic working before integrating with the rest of the system
   - Commit at logical checkpoints — not just "done"

5. **Write tests alongside code**
   - Don't defer tests to the end (see `testing.md`)
   - At minimum: one success case, one failure case per function

6. **Open a PR**
   - Branch: `feat/<feature-name>`
   - Title: `feat: <what it does>`
   - Description: what changed, why, how to test it
   - Keep PRs focused — one feature per PR

## Rules

- Never start implementing without understanding the requirement
- Never skip the "read existing code" step — don't reinvent patterns that already exist
- If the feature touches 3+ modules, consider breaking it into smaller PRs
