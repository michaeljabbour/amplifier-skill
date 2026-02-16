# Amplifier Skill

Delegate tasks to Microsoft Amplifier's AI agent ecosystem and query session context.

## Trigger

USE WHEN user says "amplifier", "use amplifier", "delegate to amplifier", "amplifier context", "amplifier history", "what did amplifier work on", or wants to delegate heavy analysis.

## Instructions

### 1. Task Delegation

When user wants to delegate a task to Amplifier:

```bash
amplifier run "<task description>"
```

**Best tasks for Amplifier:**
- Architecture analysis and design proposals
- Security vulnerability review
- Complex debugging with hypothesis generation
- Large codebase exploration/research
- Multi-file refactoring planning

**Keep local (don't delegate):**
- Quick file edits
- Simple shell commands
- Small, focused changes
- Obvious fixes

**Examples:**
```bash
# Security review
amplifier run "Review this codebase for security vulnerabilities, focusing on auth and input validation"

# Architecture analysis
amplifier run "Analyze the architecture of this project and suggest improvements for scalability"

# Complex debugging
amplifier run "Debug why the API returns 500 errors intermittently - investigate race conditions"

# Use specific agent
amplifier run "Use bug-hunter to systematically debug this error: <paste error>"
```

### 2. Session Context Query

When user asks about prior Amplifier work ("amplifier context", "amplifier history"):

**List recent sessions for current project:**
```bash
PROJECT_PATH=$(echo $PWD | tr '/' '-' | sed 's/^-//')
find ~/.amplifier/projects -type d -name "*${PROJECT_PATH}*" -exec find {} -name metadata.json \; 2>/dev/null | \
  xargs -I{} sh -c 'echo "---"; cat "{}"' 2>/dev/null | \
  grep -A5 'session_id\|name\|description\|created'
```

**Quick check for any recent sessions:**
```bash
find ~/.amplifier/projects/*/sessions -name metadata.json -mtime -7 2>/dev/null | \
  head -5 | xargs -I{} sh -c 'echo "=== {} ==="; cat "{}" | jq -r ".name // .session_id"' 2>/dev/null
```

**List all projects with sessions:**
```bash
ls -lt ~/.amplifier/projects/ 2>/dev/null | head -10
```

**Resume a session:**
```bash
amplifier session resume <session-id>
```

### 3. Available Bundles & Agents

To show Amplifier's capabilities:
```bash
amplifier bundle list 2>/dev/null | head -20
```

In chat mode, use `/agents` to see available agents.

### 4. Amplifier's Specialized Agents

Amplifier automatically routes to the right specialist:

- **zen-architect** — System design with ruthless simplicity
- **bug-hunter** — Systematic hypothesis-driven debugging
- **web-research** — Web research and content fetching
- **modular-builder** — Code implementation
- **explorer** — Breadth-first exploration with citation-ready summaries
- **git-ops** — Git workflows and version control

Just describe the task — Amplifier picks the right one.

### 5. Interactive Mode

For complex multi-turn tasks:
```bash
# Start interactive chat
amplifier

# Resume last session
amplifier continue

# Resume specific session
amplifier session resume <session-id>
```

## Decision Guide

| Scenario | Action |
|----------|--------|
| User says "use Amplifier to..." | Delegate via `amplifier run` |
| User asks "what did Amplifier work on" | Query session context |
| User wants architecture/security review | Recommend Amplifier delegation |
| Quick edit or simple task | Handle locally, don't delegate |
| Complex multi-turn analysis | Use `amplifier` interactive mode |

## Prerequisites

- Amplifier CLI: `uv tool install git+https://github.com/microsoft/amplifier`
- Provider configured: `amplifier provider install`
- API key: `ANTHROPIC_API_KEY` or `OPENAI_API_KEY`

## Notes

- Sessions persist and can be resumed with `amplifier continue`
- Complex tasks may take 1-5 minutes
- Sessions are stored in `~/.amplifier/projects/<project>/sessions/`
- Use `amplifier bundle add <url>` to add capability bundles
