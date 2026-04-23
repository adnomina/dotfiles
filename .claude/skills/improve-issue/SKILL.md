---
name: improve-issue
description: Improves GitHub issue descriptions by exploring the codebase and adding missing context so any reader — even with zero repo knowledge — can understand what the issue is and what needs to be done. Use when user wants to improve, enhance, enrich, or add context to a GitHub issue, or when an issue is vague/missing file paths/unclear scope.
---

# Improve Issue

Make GitHub issues self-contained. Reader with zero context must understand: what broken, where, why matters, what to do.

## Quick start

```
/improve-issue 42
/improve-issue https://github.com/owner/repo/issues/42
```

If no issue number given, ask for one before proceeding.

## Workflow

**Step 1 — Fetch issue**
```bash
gh issue view <number> --json title,body,labels,comments,author
```

**Step 2 — Identify gaps**

Ask: what would newcomer NOT understand?
- Unfamiliar terms / acronyms not explained
- No file paths or code locations
- Unclear expected vs actual behavior
- Missing reproduction steps
- Ambiguous scope (what to touch / avoid)
- No explanation of affected component's role

**Step 3 — Explore codebase**

Search for files, functions, types, configs mentioned or implied. Find:
- Exact file paths + line numbers
- How affected component works today
- Related code that constrains the fix
- Recent git history on affected area (if relevant)

**Step 4 — Draft improvement**

Only add what's missing. Never rewrite original. Append section:

```markdown
---
## Context (added by AI)

**Affected area:** `path/to/file.ts` — brief role of this module

**How it works today:** 1–2 sentences on current behavior

**Relevant code:** `path/to/file.ts:42` — `functionName` does X

**Reproduction:** steps (only if derivable from code/tests)

**Scope:** what to change / what NOT to change
```

Omit any sub-section that adds no value or can't be verified.

**Step 5 — Update issue**
```bash
gh issue edit <number> --body "<original_body>\n\n<improvement_section>"
```

Confirm with user before editing if uncertain about scope.

## Principles

- **Add, don't rewrite** — original text stays intact
- **Verify before adding** — no speculation; only facts from code/history
- **Tour guide voice** — explain where in codebase and why it matters
- **Minimal surface** — skip obvious; only add genuinely missing context
- **Codebase is truth** — if code contradicts issue, note the discrepancy
