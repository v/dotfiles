---
allowed-tools: Bash(gt create:*), Bash(gt submit:*), Bash(git status:*), Bash(git diff:*)
description: Commit, push, and open a PR
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`

## Your task

Based on the above changes:
1. Create a new commit with an appropriate message using `gt create`
2. Submit the stack as a pull request using `gt submit`
3. You have the capability to call multiple tools in a single response. You MUST do all of the above in a single message. Do not use any other tools or do anything else. Do not send any other text or messages besides these tool calls.
