# Amplifier Skill for Claude Code

Delegate tasks to [Microsoft Amplifier](https://github.com/microsoft/amplifier)'s remote AI agents from Claude Code.

## Quick Start

### 1. Install Amplifier CLI

```bash
uv tool install git+https://github.com/microsoft/amplifier
amplifier provider install
```

### 2. Install the Skill

```bash
claude skill add https://github.com/robotdad/claude-amplifier-skill/blob/main/Skill.md
```

Or manually:
```bash
curl -o ~/.claude/commands/amplifier.md https://raw.githubusercontent.com/robotdad/claude-amplifier-skill/main/Skill.md
```

### 3. Use It

In Claude Code, mention **"Amplifier"** to delegate:

```
Use Amplifier to debug this code...
Have Amplifier review security...
Delegate to Amplifier for architecture planning...
```

## How It Works

**"Amplifier" is the trigger word.**

| You say... | What happens |
|------------|--------------|
| "use bug-hunter" | Claude Code's local agent |
| "use **Amplifier** to debug" | Amplifier via CLI |

Without "Amplifier" → local agents. With "Amplifier" → remote delegation via `amplifier run`.

## Amplifier's Agents

| Specialty | Capabilities |
|-----------|--------------|
| Architecture | System design, module boundaries, refactoring |
| Debugging | Hypothesis-driven bug hunting, root cause analysis |
| Security | OWASP checks, vulnerability scanning |
| Testing | Coverage analysis, test case suggestions |
| Research | Codebase exploration, web research |
| Operations | Git workflows, API integration |

Just describe the task — Amplifier picks the right specialist.

## Verify It's Working

After using Amplifier, check for a new session:

```bash
ls -lt ~/.amplifier/projects/*/sessions/ | head -3
```

You should see `Bash(amplifier run ...)` in Claude Code, not `bug-hunter(...)`.

## Requirements

- [Amplifier CLI](https://github.com/microsoft/amplifier)
- Claude Code (not Claude Desktop — requires local CLI access)
- `ANTHROPIC_API_KEY` or `OPENAI_API_KEY`

## Files

```
├── Skill.md                   # Claude Code skill definition
├── README.md                  # This file
└── resources/
    └── agent-catalog.md       # Detailed agent reference
```

## License

MIT
