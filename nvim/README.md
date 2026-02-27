# Personal Neovim Configuration

This repository contains my personal Neovim configuration based on [NvChad](https://github.com/NvChad/NvChad). It uses NvChad as a plugin and extends it with custom configurations.

## Structure

- `init.lua` - Main configuration file that bootstraps lazy.nvim and loads NvChad
- `lua/` - Directory containing custom configurations
  - `chadrc.lua` - NvChad configuration overrides
  - `options.lua` - Neovim options and settings
  - `mappings.lua` - Custom keymaps
  - `plugins/` - Custom plugin configurations
  - `configs/` - Additional configuration files

## Installed Plugins

### Core

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Lua functions library
- [which-key.nvim](https://github.com/folke/which-key.nvim) - Keybinding helper

### Editor Enhancement

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Syntax highlighting and code parsing
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto pair brackets and quotes
- [nvim-surround](https://github.com/kylechui/nvim-surround) - Surround text objects
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) - Indentation guides
- [auto-session](https://github.com/rmagatti/auto-session) - Session management

### Completion and LSP

- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configuration
- [mason.nvim](https://github.com/williamboman/mason.nvim) - Package manager for LSP servers
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet engine
- [neocodeium](https://github.com/neocodeium/neocodeium) - AI code completion

### File Management and Navigation

- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File explorer
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [outline.nvim](https://github.com/hedyhli/outline.nvim) - Code outline window

### Git Integration

- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git decorations
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) - Git interface

### Code Quality

- [conform.nvim](https://github.com/stevearc/conform.nvim) - Code formatter
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) - Linting engine

### Additional Features

- [render-markdown](https://github.com/render-markdown/render-markdown.nvim) - Markdown preview
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Auto close HTML/JSX tags

## Credits

- [NvChad](https://github.com/NvChad/NvChad) - The base configuration this setup is built upon
