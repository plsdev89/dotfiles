# AGENTS.md — Dotfiles Repository

## Project Overview

macOS dotfiles repo using GNU Stow to symlink configs into `~/.config/`. No build system, test suite, or CI. Changes are validated manually by reloading the relevant tool.

## Setup & Commands

```bash
# Full bootstrap (Homebrew, packages, Oh My Zsh, stow symlinks)
./setup.sh

# Install/update packages only
brew bundle --file ./Brewfile

# Apply symlinks (uses .stowrc to target ~/.config/)
stow .

# Update Neovim plugins
# Inside Neovim: :Lazy update

# Update Zsh plugins
antidote update

# Update Homebrew packages
brew update && brew upgrade
```

There are no test commands. There is no CI pipeline. Linting and formatting are handled inside Neovim via conform.nvim and nvim-lint (not as standalone CLI commands).

## Project Structure

```
dotfiles/
├── setup.sh               # Bootstrap script (bash)
├── Brewfile               # Homebrew manifest (Ruby DSL)
├── .stowrc                # Stow config: target=~/.config/, ignore patterns
├── .macos                 # macOS preferences (currently empty)
├── aerospace/             # AeroSpace tiling window manager (TOML)
├── ghostty/               # Ghostty terminal emulator (custom key=value)
├── lazygit/               # LazyGit git TUI (YAML)
├── nvim/                  # Neovim/NvChad config (Lua)
│   ├── .stylua.toml       # Lua formatter config
│   ├── init.lua           # Bootstrap entry point
│   └── lua/
│       ├── chadrc.lua     # NvChad theme/UI overrides
│       ├── options.lua    # Vim options and autocmds
│       ├── mappings.lua   # Custom keymaps
│       ├── configs/       # Plugin manager config (lazy.lua)
│       └── plugins/       # One file per plugin (14 files)
├── starship/              # Starship prompt (TOML)
├── tmux/                  # Tmux multiplexer (tmux.conf)
├── wezterm/               # WezTerm terminal - legacy (Lua)
├── zellij/                # Zellij multiplexer (KDL)
└── zsh/                   # Zsh shell config
    ├── .zshenv            # XDG env vars
    ├── .zshrc             # Main shell config
    └── .zsh_plugins.txt   # Antidote plugin list
```

## Code Style by Language

### Lua (Neovim — `nvim/lua/`)

Governed by `nvim/.stylua.toml`:

- **Indentation:** 2 spaces
- **Line width:** 120 columns
- **Quotes:** Double quotes preferred (`AutoPreferDouble`)
- **Call parentheses:** Omitted (`call_parentheses = "None"`) — write `require "module"` not `require("module")`
- **Line endings:** Unix (LF)

Conventions:

- **Naming:** `snake_case` for all local variables and functions. PascalCase only for Neovim event names (`BufWritePost`, `InsertLeave`). camelCase only when matching external API keys (LSP server settings).
- **Module pattern:** Plugin files return a single lazy.nvim spec table: `return { "author/plugin", opts = { ... } }`
- **NvChad modules** use `local M = {} ... return M` pattern (see `chadrc.lua`).
- **Requires:** Use `require "module"` (no parens) per StyLua config. Both forms appear in the codebase but no-parens is the standard.
- **Type annotations:** Use `---@type` and `---@module` (LuaLS/EmmyLua style) when type info helps. Not required everywhere.
- **Comments:** Single-line `--` only. Use for section headers, inline explanations, and `-- stylua: ignore` directives.
- **Error handling:** Defensive nil checks (`if not vim.uv.fs_stat(path) then`). No pcall/xpcall patterns. Silently filter known-benign errors (e.g., eslint_d "no config found").
- **Lazy loading:** Use `event`, `cmd`, `keys`, or `lazy = true` to defer plugin loading. Prefer the most specific trigger.

### Lua (WezTerm — `wezterm/wezterm.lua`)

- **Indentation:** Tabs (not spaces — different from Neovim Lua)
- Uses `require("wezterm")` with parentheses (WezTerm convention)
- `local config = {} ... return config` pattern

### Shell (Bash/Zsh)

- **Shebang:** `#!/usr/bin/env bash` for scripts
- **Indentation:** 2 spaces
- **Variables:** Double-quote all expansions: `"$HOME"`, `"$(command)"`
- **Conditionals:** `if test ! $(which tool); then` or `if [[ "$VAR" == "value" ]]; then`
- **No `set -e`** or error trapping in existing scripts
- **Exports:** `export VAR="value"` format

### TOML (Starship, AeroSpace, StyLua)

- `snake_case` keys for Starship and StyLua
- `kebab-case` keys for AeroSpace (tool convention)
- Single quotes for simple values, double quotes for format strings

### YAML (LazyGit)

- 2-space indentation
- `camelCase` keys (matches LazyGit's config schema)

### KDL (Zellij)

- 4-space indentation
- `//` comments
- `kebab-case` for options, `PascalCase` for actions (`SwitchToMode`, `MoveFocus`)

### Ghostty Config

- Flat `key = value` format (not TOML)
- `kebab-case` keys: `font-size`, `background-opacity`
- `#` comments

### Brewfile

- Ruby DSL: `tap "name"`, `brew "name"`, `cask "name"`, `mas "name", id: NUMBER`
- One entry per line, no comments

## Git Conventions

- **Branch:** `main`
- **Commit style:** Short, lowercase, imperative or descriptive. No conventional commits prefix. No trailing period.
- **Remote:** `git@github.com:plsdev89/dotfiles.git`
- **Secrets:** `.backend_secrets` is sourced in `.zshrc` but never committed. Do not commit secrets or credentials.

## Key Design Patterns

1. **One directory per tool** — each tool's config lives in its own top-level directory, stowed into `~/.config/`.
2. **One file per Neovim plugin** — plugin configs live in `nvim/lua/plugins/`, each exporting a lazy.nvim spec table.
3. **XDG compliance** — all configs target `~/.config/` via `.zshenv` and `.stowrc`.
4. **Stow ignore** — `.stowrc` excludes repo-level files (setup.sh, Brewfile, README, etc.) from being symlinked.

## Adding a New Tool Configuration

1. Create a directory at the repo root: `mkdir toolname/`
2. Add config files inside it (matching what the tool expects under `~/.config/toolname/`)
3. Run `stow .` to create symlinks
4. If the tool needs Homebrew: add to `Brewfile`, run `brew bundle`
5. If special setup is needed: add steps to `setup.sh`

## Language Support (Neovim LSP/Lint/Format)

| Language      | LSP Server    | Formatter | Linter   |
| ------------- | ------------- | --------- | -------- |
| Lua           | (none)        | stylua    | luacheck |
| Python        | pyright       | autopep8  | flake8   |
| JS/TS/JSX/TSX | ts_ls         | prettier  | eslint_d |
| Rust          | rust-analyzer | rustfmt   | (none)   |
| HTML          | html          | prettier  | (none)   |
| CSS           | cssls         | prettier  | (none)   |
| Tailwind      | tailwindcss   | (none)    | (none)   |
| JSON/YAML/MD  | (none)        | prettier  | (none)   |
| GraphQL       | (none)        | prettier  | (none)   |

Formatting runs on `BufWritePost` (async, 3s timeout). Linting runs on `BufEnter`, `BufWritePost`, `InsertLeave`.
