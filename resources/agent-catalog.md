# Agent Discovery Guide

Do not rely on static agent catalogs. Discover agents dynamically at runtime,
then fall back to cached bundle manifests.

## Preferred Discovery Flow

1. Run runtime discovery:

```bash
amplifier agents list --bundle <bundle-name>
```

2. If runtime output is missing or blocked, use the bundled fallback:

```bash
./scripts/list_agents.sh --bundle <bundle-name>
```

3. Inspect bundle composition for context:

```bash
amplifier bundle show <bundle-name>
```

## Why This File Is Lean

- Amplifier bundles and agent sets change frequently.
- Static copies drift and become misleading.
- This skill is designed to prefer live runtime state.

## Practical Commands

```bash
# List currently available bundles
amplifier bundle list

# Attempt runtime agent discovery for current/default context
./scripts/list_agents.sh

# Target a specific bundle
./scripts/list_agents.sh --bundle foundation
./scripts/list_agents.sh --bundle recipes
```
