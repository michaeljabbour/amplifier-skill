# Amplifier Documentation

> Source: [microsoft/amplifier](https://github.com/microsoft/amplifier)

## What is Amplifier?

Amplifier is an AI-powered modular development assistant from Microsoft. It brings AI assistance to your command line with a modular, extensible architecture.

**Key Features:**
- **Modular**: Swap AI providers, tools, and behaviors like LEGO bricks
- **Bundle-based**: Composable configuration packages for different scenarios
- **Session persistence**: Pick up where you left off, even across projects
- **Extensible**: Build your own modules, bundles, or entire custom experiences

## Quick Start

### Install

```bash
# Install UV first
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install Amplifier
uv tool install git+https://github.com/microsoft/amplifier

# First-time setup
amplifier init
```

### Basic Usage

```bash
# Single command
amplifier run "Explain async/await in Python"

# Interactive chat mode
amplifier

# Resume last session
amplifier continue
```

## Supported Providers

- **Anthropic Claude** (recommended) - Sonnet 4.5, Opus 4.6, Haiku 4.5
- **OpenAI** - GPT-5.2, GPT-5.2-Pro, GPT-5.1-Codex
- **Azure OpenAI** - Enterprise with managed identity support
- **Ollama** - Local, free (llama3, codellama, etc.)

```bash
# Switch providers
amplifier provider use anthropic --model claude-opus-4-6
amplifier provider use openai --model gpt-5.2
```

## Bundles

Bundles are composable configuration packages:

```bash
# See current bundle
amplifier bundle current

# Add bundles
amplifier bundle add git+https://github.com/microsoft/amplifier-bundle-recipes@main
amplifier bundle add git+https://github.com/microsoft/amplifier-bundle-design-intelligence@main

# Use a bundle
amplifier bundle use recipes
```

**The `foundation` bundle** (default) includes:
- **Tools**: filesystem, bash, web, search, task delegation
- **Agents**: 14 specialized agents
- **Behaviors**: logging, redaction, streaming UI, todo tracking

## Agents

Specialized AI personas for focused tasks:

| Agent | Purpose |
|-------|---------|
| zen-architect | System design with ruthless simplicity |
| bug-hunter | Systematic debugging |
| web-research | Web research and content fetching |
| modular-builder | Code implementation |
| explorer | Breadth-first exploration with citations |
| git-ops | Git workflows |

```bash
# Let AI pick the right agent
amplifier run "Design a caching layer"

# Request specific agent
amplifier run "Use bug-hunter to debug this error: [paste]"
```

## Sessions

Sessions persist automatically:

```bash
# Resume most recent session
amplifier continue

# List sessions (current project)
amplifier session list

# List all sessions
amplifier session list --all-projects

# Resume specific session
amplifier session resume <session-id>
```

Sessions are project-scoped — different directory, different sessions.

## Chat Commands

In interactive mode:
- `/help` - Show available commands
- `/agents` - List available agents
- `/tools` - Show loaded tools
- `/status` - Session status
- `/config` - Current configuration
- `/think` and `/do` - Toggle plan mode

## Configuration

```bash
# Switch provider
amplifier provider use anthropic --model claude-opus-4-6

# Switch bundle
amplifier bundle use foundation

# Add modules
amplifier module add tool-jupyter
```

## Links

- **Main Repo**: https://github.com/microsoft/amplifier
- **Core Library**: https://github.com/microsoft/amplifier-core
- **Foundation Bundle**: https://github.com/microsoft/amplifier-foundation
- **Bundle Guide**: https://github.com/microsoft/amplifier-foundation/blob/main/docs/BUNDLE_GUIDE.md
- **Agent Authoring**: https://github.com/microsoft/amplifier-foundation/blob/main/docs/AGENT_AUTHORING.md
