# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Claude Code plugin providing LSP server configurations for Python (ty) and Elixir (expert).

## Plugin Structure

- `.claude-plugin/plugin.json` - plugin manifest
- `.lsp.json` - LSP server configurations (keyed by language ID)

## LSP Configuration Format

Each entry in `.lsp.json`:
```json
{
  "language-id": {
    "command": "executable",
    "args": ["flags"],
    "extensionToLanguage": { ".ext": "language-id" },
    "transport": "stdio",
    "initializationOptions": {},
    "settings": {},
    "maxRestarts": 3
  }
}
```

## Adding New LSP Servers

1. Add entry to `.lsp.json` with language ID as key
2. Set `command` to LSP executable name (must be in PATH)
3. Map all relevant file extensions in `extensionToLanguage`
