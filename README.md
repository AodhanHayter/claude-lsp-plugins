# claude-lsp-plugins

LSP configurations for Claude Code.

## Languages

- **Python** via [ty](https://github.com/astral-sh/ty)
- **Elixir** via [expert](https://github.com/elixir-lang/expert)

## Prerequisites

Install the LSP servers:

```bash
# Python (ty)
uv tool install ty

# Elixir (expert)
# Download from https://github.com/elixir-lang/expert/releases
```

Ensure `ty` and `expert` are in your PATH.

## Installation

```bash
claude --plugin-dir /path/to/claude-lsp-plugins
```

Or add to your Claude Code settings.

## Usage

The LSP tool becomes available for Python and Elixir files:

```
# Go to definition
LSP goToDefinition file.py 10 5

# Find references
LSP findReferences file.ex 20 10

# Hover info
LSP hover file.py 15 8
```

## Note

Requires `ENABLE_LSP_TOOL=1` in your shell profile.
