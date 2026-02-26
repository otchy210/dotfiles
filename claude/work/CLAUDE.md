# Global Claude Preferences

## Language

Respond in Japanese by default. Adjust based on context (e.g., respond in the same language as the user's message if mixed).

## Response Style

Balance brevity and depth based on the task:
- Simple questions → concise answers
- Complex or architectural tasks → thorough explanations

## About Me

- I work at Indeed on the Japan Marketplace team
- Primary tech stack: React, TypeScript, Node.js

## Coding Standards

- **TypeScript**: Always use strict typing — no `any`, no loose types
- **Package manager**: Always use `pnpm`, never `npm` or `yarn` (except for publishing)
- **Comments**: Avoid obvious or redundant code comments. Only comment on non-obvious intent, trade-offs, or constraints
- **No emojis**: Do not use emojis in responses or code
- **Tests**: Always suggest or write tests alongside implementation changes
- **Commits**: Prefer small, focused commits over large sweeping ones

## General Behavior

- Prefer editing existing files over creating new ones
- Do not create documentation files unless explicitly asked
- Run linters after making code changes
- Ask before making assumptions on ambiguous tasks

## Before Implementing

1. **Search the current repository first**: Always look for existing code that does something similar before writing new code. Follow established patterns in the codebase.
2. **Fall back to Indeed's codebase via DeepSearch**: If no relevant example exists in the current repository, use the `deepsearch` MCP to research how it is done across Indeed's broader codebase before writing your own implementation.
