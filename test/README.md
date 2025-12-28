# Testing

## Validation

Check config and binary availability:

```bash
./test/validate.sh
```

## Integration Test (Manual)

Start Claude Code with the plugin:

```bash
ENABLE_LSP_TOOL=1 claude --plugin-dir /path/to/claude-lsp-plugins
```

### Python (ty)

Test against `test/fixtures/example.py`:

| Operation | Command | Expected |
|-----------|---------|----------|
| Hover | `LSP hover test/fixtures/example.py 7 7` | Shows `class User` docstring |
| Go to def | `LSP goToDefinition test/fixtures/example.py 23 12` | Jumps to `create_user` (line 18) |
| Find refs | `LSP findReferences test/fixtures/example.py 7 7` | Shows User usages |
| Doc symbols | `LSP documentSymbol test/fixtures/example.py 1 1` | Lists User, create_user, main |

### Elixir (expert)

Test against `test/fixtures/example.ex`:

| Operation | Command | Expected |
|-----------|---------|----------|
| Hover | `LSP hover test/fixtures/example.ex 1 12` | Shows module doc |
| Go to def | `LSP goToDefinition test/fixtures/example.ex 36 17` | Jumps to `User.new` (line 16) |
| Find refs | `LSP findReferences test/fixtures/example.ex 16 7` | Shows `new/3` usages |
| Doc symbols | `LSP documentSymbol test/fixtures/example.ex 1 1` | Lists modules and functions |
