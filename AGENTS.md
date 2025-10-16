# Developer Handover Document

## Project Overview

This is a comprehensive macOS development environment dotfiles repository that provides automated setup and configuration for a modern development workflow. The project uses GNU Stow for dotfile management and follows XDG Base Directory standards for clean configuration organization.

## Architecture & Design Principles

### Core Philosophy
- **XDG Base Directory Compliance**: All configurations follow XDG standards with configs in `~/.config/`
- **Modular Design**: Each tool has its own configuration directory
- **Automated Setup**: Single script (`setup.sh`) handles complete environment bootstrap
- **GNU Stow Integration**: Symlink management for clean dotfile organization
- **Plugin-Based Architecture**: Heavy use of plugin managers (Antidote, lazy.nvim)

### Key Design Decisions
1. **NvChad-based Neovim**: Chosen for its modern Lua configuration and extensive plugin ecosystem
2. **Antidote over Oh My Zsh**: Faster plugin loading and better performance
3. **Starship Prompt**: Minimal, fast, and highly customizable shell prompt
4. **Ghostty Terminal**: Modern, GPU-accelerated terminal with macOS-like keybindings
5. **Homebrew Bundle**: Centralized package management with Brewfile

## Project Structure

```
dotfiles/
├── AGENTS.md              # This handover document
├── README.md              # User-facing documentation
├── Brewfile               # Homebrew packages, casks, and Mac App Store apps
├── setup.sh              # Automated installation script
├── nvim/                  # Neovim configuration (NvChad-based)
│   ├── init.lua           # Main Neovim bootstrap
│   ├── lazy-lock.json     # Plugin version lock file
│   └── lua/
│       ├── chadrc.lua     # NvChad configuration overrides
│       ├── options.lua    # Neovim options and autocmds
│       ├── mappings.lua   # Custom keymaps
│       ├── configs/       # Additional configuration files
│       └── plugins/       # Custom plugin configurations
├── zsh/                   # Zsh configuration
│   ├── .zshenv           # XDG Base Directory setup
│   ├── .zshrc            # Main Zsh configuration
│   ├── .zsh_plugins.txt  # Antidote plugin list
│   └── functions/        # Custom Zsh functions (empty)
├── starship/             # Starship prompt configuration
│   └── starship.toml     # Prompt configuration with custom theme
├── ghostty/              # Ghostty terminal configuration
│   └── config            # Terminal settings and keybindings
├── lazygit/              # LazyGit TUI configuration
│   └── config.yml        # Git interface configuration
└── wezterm/              # WezTerm configuration (legacy)
    └── wezterm.lua       # Alternative terminal configuration
```

## Core Components

### 1. Package Management (`Brewfile`)
- **60+ packages** including development tools, applications, and fonts
- **Taps**: Custom Homebrew taps for additional packages
- **Casks**: GUI applications (Cursor, Discord, Postman, etc.)
- **Mac App Store**: Apps installed via `mas` (Amphetamine, Private Screen, Tailscale)

**Key Dependencies:**
- Development: `neovim`, `lazygit`, `ripgrep`, `starship`, `stow`
- Languages: `python@3.13`, `rustup`, `luarocks`, `pnpm`, `yarn`
- Tools: `ffmpeg`, `yt-dlp`, `mpv`, `wget`, `socat`
- Applications: `cursor`, `ghostty`, `orbstack`, `postman`, `raycast`

### 2. Shell Configuration (`zsh/`)
- **Oh My Zsh**: Base framework with git and poetry plugins
- **Antidote**: Fast plugin manager loading 15+ plugins
- **Starship**: Custom prompt with Catppuccin Mocha theme
- **XDG Compliance**: Configs in `~/.config/zsh/`
- **Environment**: Python (pyenv), Rust, custom aliases

**Plugin Stack:**
- Navigation: `rupa/z` (directory jumping)
- Completions: `zsh-users/zsh-completions`
- Suggestions: `zsh-users/zsh-autosuggestions`
- Syntax: `fast-syntax-highlighting`
- History: `zsh-users/zsh-history-substring-search`
- Abbreviations: `zsh-abbr`
- Oh My Zsh: git, docker, npm, python, pip, colored-man-pages

### 3. Neovim Configuration (`nvim/`)
- **Base**: NvChad v2.5 with lazy.nvim plugin manager
- **Theme**: OneDark with custom highlights
- **LSP**: Full language server support with Mason
- **Plugins**: 13 custom plugin configurations

**Key Plugins:**
- **Core**: lazy.nvim, plenary.nvim, which-key.nvim
- **Editor**: treesitter, autopairs, surround, indent-blankline
- **LSP**: lspconfig, mason, nvim-cmp, LuaSnip
- **Navigation**: telescope, nvim-tree, outline
- **Git**: gitsigns, lazygit
- **Quality**: conform, nvim-lint
- **Special**: lazympv, render-markdown, ts-autotag

### 4. Terminal Configuration
- **Primary**: Ghostty with macOS-like keybindings
- **Fallback**: WezTerm with OneDark theme
- **Features**: GPU acceleration, transparency, custom keybinds
- **Integration**: Neovim title updates, proper TERM handling

### 5. Development Tools
- **LazyGit**: Terminal UI for Git with One Dark theme
- **Starship**: Minimal prompt with directory, git, and language indicators
- **Custom Aliases**: MPV audio-only mode, backend secrets sourcing

## Setup Process (`setup.sh`)

The setup script performs these operations in sequence:

1. **Homebrew Installation**: Installs Homebrew if not present
2. **Package Installation**: Runs `brew bundle` to install all dependencies
3. **Oh My Zsh Installation**: Installs Zsh framework
4. **XDG Setup**: Symlinks `.zshenv` for XDG Base Directory compliance
5. **macOS Preferences**: Sources `.macos` file (referenced but not present)
6. **Stow Symlinks**: Creates all configuration symlinks

## Configuration Details

### Neovim Customizations
- **Theme**: OneDark with italic comments
- **UI**: Borderless telescope, cursor line highlighting
- **Autocmds**: Cursor restoration, file change detection, yank highlighting
- **Terminal Integration**: Ghostty title updates

### Shell Customizations
- **Prompt**: Starship with Catppuccin Mocha palette
- **Environment**: Python via pyenv, Rust toolchain, custom PATH
- **Aliases**: MPV audio-only mode, backend secrets sourcing
- **Terminal Detection**: Special handling for Ghostty terminal

### Terminal Customizations
- **Ghostty**: macOS-like keybindings, transparency, font size 18
- **WezTerm**: OneDark theme, pane navigation, tab management
- **Integration**: Proper TERM variable handling

## Dependencies & Requirements

### System Requirements
- **macOS**: Primary target platform
- **Git**: For repository cloning
- **Command Line**: Basic terminal knowledge

### External Dependencies
- **Homebrew**: Package manager
- **Oh My Zsh**: Zsh framework
- **GNU Stow**: Symlink management
- **Antidote**: Zsh plugin manager
- **lazy.nvim**: Neovim plugin manager

### Missing Components
- **`.macos` file**: Referenced in setup.sh but not present
- **`.backend_secrets`**: Referenced in .zshrc but not tracked in git

## Development Workflow

### Adding New Packages
1. Edit `Brewfile` to add new packages/casks
2. Run `brew bundle` to install
3. Update documentation if needed

### Modifying Neovim
1. Edit files in `nvim/lua/plugins/` for plugin configs
2. Edit `nvim/lua/options.lua` for Neovim settings
3. Edit `nvim/lua/mappings.lua` for keymaps
4. Edit `nvim/lua/chadrc.lua` for NvChad overrides

### Updating Shell Configuration
1. Edit `zsh/.zshrc` for main configuration
2. Edit `zsh/.zsh_plugins.txt` for plugin management
3. Edit `starship/starship.toml` for prompt customization

### Adding New Tools
1. Add to `Brewfile` if installable via Homebrew
2. Create configuration directory if needed
3. Add to `setup.sh` if special setup required
4. Update documentation

## Troubleshooting

### Common Issues
1. **Stow Conflicts**: Remove existing configs before running stow
2. **Plugin Loading**: Check Antidote installation and plugin list
3. **Neovim Issues**: Check lazy.nvim installation and plugin configs
4. **Terminal Issues**: Verify Ghostty installation and config syntax

### Debugging Steps
1. Check Homebrew installation: `brew --version`
2. Verify Stow symlinks: `ls -la ~/.config/`
3. Test Zsh plugins: `antidote list`
4. Check Neovim plugins: `:Lazy` in Neovim

## Security Considerations

- **Secrets Management**: Uses `.backend_secrets` file (not tracked in git)
- **XDG Compliance**: Keeps sensitive data in appropriate directories
- **Plugin Sources**: All plugins from trusted repositories
- **Package Sources**: Homebrew packages from official sources

## Performance Optimizations

- **Antidote**: Fast plugin loading vs Oh My Zsh
- **Lazy Loading**: Neovim plugins loaded on demand
- **Starship**: Minimal prompt for fast rendering
- **Ghostty**: GPU acceleration for terminal performance

## Future Maintenance

### Regular Updates
- **Homebrew**: `brew update && brew upgrade`
- **Neovim Plugins**: `:Lazy update` in Neovim
- **Zsh Plugins**: `antidote update`
- **System**: macOS updates and security patches

### Monitoring
- **Plugin Conflicts**: Watch for plugin compatibility issues
- **Performance**: Monitor shell startup time and Neovim load time
- **Dependencies**: Track Homebrew package updates and breaking changes

## Handover Checklist

- [ ] Verify all configurations are working on target system
- [ ] Test setup.sh script on clean macOS installation
- [ ] Document any custom modifications made
- [ ] Update README.md if needed
- [ ] Ensure all secrets are properly excluded from git
- [ ] Test Neovim plugin functionality
- [ ] Verify terminal configurations work correctly
- [ ] Check all aliases and functions work as expected

## Contact & Support

This configuration was maintained by the previous developer. For questions about specific configurations or modifications, refer to:

- **NvChad Documentation**: https://nvchad.com/
- **Antidote Documentation**: https://getantidote.github.io/
- **Starship Documentation**: https://starship.rs/
- **Ghostty Documentation**: https://mitchellh.com/ghostty/

---

*Last Updated: $(date)*
*Maintained by: Previous Developer*
*Next Review: 3 months*