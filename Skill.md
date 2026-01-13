---
name: amplifier-agent-delegation
description: Delegate tasks to Microsoft Amplifier's remote agent ecosystem via CLI.
allowed-tools:
  - Bash
---

# Amplifier Remote Agent Delegation

When the user asks to use **"Amplifier"** to do something, delegate to Microsoft Amplifier's remote agent ecosystem via the CLI.

## Trigger Words

Invoke Amplifier when the user says:
- "Use **Amplifier** to..."
- "**Delegate to Amplifier**..."
- "Ask **Amplifier** to..."
- "Have **Amplifier** analyze..."
- "Run this through **Amplifier**..."

If the user just says "use bug-hunter" without mentioning Amplifier, use your local/native agents instead.

## How to Delegate

Run this bash command:

```bash
amplifier run --bundle foundation "{user's task description}"
```

**Examples:**

```bash
# User: "Use Amplifier to debug this code"
amplifier run --bundle foundation "Debug this code and find potential issues: {code}"

# User: "Have Amplifier review security"  
amplifier run --bundle foundation "Review this code for security vulnerabilities: {code}"

# User: "Delegate architecture planning to Amplifier"
amplifier run --bundle foundation "Analyze this system architecture and suggest improvements: {context}"
```

## Amplifier's Specialized Agents

Amplifier automatically routes tasks to the right specialist:

| Specialty | What It Does |
|-----------|--------------|
| Architecture | System design, module boundaries, refactoring strategies |
| Debugging | Hypothesis-driven bug hunting, root cause analysis |
| Security | OWASP checks, vulnerability scanning, auth review |
| Testing | Coverage analysis, test case suggestions, gap identification |
| Research | Codebase exploration, web research, documentation |
| Operations | Git workflows, API integration, dependency management |

You don't need to specify which agent — just describe the task and Amplifier picks the right one.

## When to Use Amplifier vs Local Agents

| Use Amplifier When... | Use Local Agents When... |
|-----------------------|--------------------------|
| User explicitly says "Amplifier" | User just names a task type |
| Task needs Amplifier's full tool ecosystem | Quick local analysis suffices |
| Multi-step workflows with context | Single-step tasks |
| User wants a second opinion from Amplifier | Default behavior |

## Verification

After running, you can verify Amplifier was used:
```bash
ls -lt ~/.amplifier/projects/*/sessions/ | head -3
```

## Prerequisites

- Amplifier CLI: `uv tool install git+https://github.com/microsoft/amplifier`
- Provider configured: `amplifier provider install`
- API key set: `ANTHROPIC_API_KEY` or `OPENAI_API_KEY`

## Limitations

- **Claude Desktop not supported** — requires local CLI access
- Each call is stateless (no memory between calls)
- May take 1-5 minutes for complex tasks
