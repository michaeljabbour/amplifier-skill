# Amplifier Quick Reference

Short command cheatsheet used by this skill. Prefer runtime discovery over
static catalogs.

## Install and Setup

```bash
uv tool install git+https://github.com/microsoft/amplifier
amplifier init
```

## Preflight

```bash
command -v amplifier
amplifier --help
amplifier provider current
amplifier bundle current
```

## Delegate Work

```bash
# Single-shot delegation
amplifier run "Review this codebase for security issues"

# Interactive delegation
amplifier
amplifier continue
amplifier session resume <session-id>

# Optional targeting
amplifier run --bundle foundation "Analyze architecture tradeoffs"
amplifier run --provider provider-anthropic "Compare two designs"
```

## Sessions

```bash
# Current project
amplifier session list -n 10

# Specific project path
amplifier session list --project /abs/path/to/repo -n 10

# All projects
amplifier session list --all-projects -n 10

# Show one session
amplifier session show <session-id>
```

## Agent and Bundle Discovery

```bash
# Discover bundles
amplifier bundle list
amplifier bundle show <bundle-name>

# Try runtime agent discovery
amplifier agents list --bundle <bundle-name>
```

For this skill's fallback discovery commands:

```bash
./scripts/list_agents.sh --bundle foundation
./scripts/session_context.sh --project "$PWD" --limit 10
```

## Troubleshooting

### `amplifier: command not found`

Install Amplifier, then verify:

```bash
uv tool install git+https://github.com/microsoft/amplifier
which amplifier
```

### Provider not configured

Run:

```bash
amplifier init
```

### Runtime command fails in restricted/sandboxed environments

Use filesystem fallback scripts:

```bash
./scripts/session_context.sh --all-projects --limit 10
./scripts/list_agents.sh
```

### Multiple Amplifier binaries on PATH

Inspect resolution order:

```bash
which -a amplifier
```

## Canonical Sources

- [microsoft/amplifier](https://github.com/microsoft/amplifier)
- [Amplifier Foundation](https://github.com/microsoft/amplifier-foundation)
