# Amplifier Skill

Delegate tasks to [Microsoft Amplifier](https://github.com/microsoft/amplifier)'s AI agent ecosystem from any AI coding assistant.

**Works with:** Claude Code, Warp, Cursor, Windsurf, Continue, and any tool that supports skills/commands.

## Quick Start

### 1. Install Amplifier CLI

```bash
uv tool install git+https://github.com/microsoft/amplifier
amplifier init
```

### 2. Install the Skill

**Claude Code:**
```bash
claude skill add https://github.com/michaeljabbour/amplifier-skill/blob/main/SKILL.md
```

**Warp:**
```bash
mkdir -p ~/.claude/skills/amplifier
curl -o ~/.claude/skills/amplifier/SKILL.md https://raw.githubusercontent.com/michaeljabbour/amplifier-skill/main/SKILL.md
```

**Other tools:** Copy `SKILL.md` to your tool's skills/commands directory.

### 3. Use It

Mention **"Amplifier"** to delegate:

```
Use Amplifier to debug this code...
Have Amplifier review security...
Delegate to Amplifier for architecture planning...
Show me Amplifier context for this project...
```

## Features

### Task Delegation
Delegate heavy analysis to Amplifier's specialized agents:
- **zen-architect** — System design with ruthless simplicity
- **bug-hunter** — Systematic hypothesis-driven debugging
- **web-research** — Web research and content fetching
- **explorer** — Breadth-first codebase exploration
- **git-ops** — Git workflows and version control

Just describe the task — Amplifier picks the right specialist.

### Session Context
Query prior Amplifier sessions for project context:
```bash
# Resume last session
amplifier continue

# List sessions
amplifier session list

# Interactive mode
amplifier
```

## When to Use Amplifier

| Use Amplifier | Use Local Agent |
|---------------|------------------|
| Architecture analysis | Quick file edits |
| Security reviews | Simple grep/search |
| Complex debugging | Small, focused changes |
| Multi-file refactoring research | Shell commands |
| Second opinion on approach | Obvious fixes |

## Requirements

- [Amplifier CLI](https://github.com/microsoft/amplifier) (`uv tool install git+https://github.com/microsoft/amplifier`)
- Provider configured: `amplifier init`
- `ANTHROPIC_API_KEY` or `OPENAI_API_KEY`

## Documentation

- [Amplifier Quick Reference](docs/amplifier.md) — Commands, agents, bundles
- [Official Amplifier Docs](https://github.com/microsoft/amplifier) — Full documentation

## Files

```
├── SKILL.md                   # Universal skill definition
├── README.md                  # This file
├── docs/
│   └── amplifier.md           # Amplifier documentation
└── resources/
    └── agent-catalog.md       # Detailed agent reference
```

## License

MIT
