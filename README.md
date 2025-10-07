# Dotfiles

My personal dotfiles for macOS development environment setup. This repository contains configuration files and setup scripts to quickly bootstrap a new macOS system with my preferred tools and settings.

## Features

- 🛠 Automated setup script for quick installation
- 🍺 Homebrew package management with Brewfile
- 💻 Terminal setup with:
  - Zsh configuration with Oh My Zsh
  - Starship prompt
  - Ghostty terminal emulator
  - Antidote plugin manager with extensive plugin suite
- 📝 Development tools:
  - Neovim configuration (NvChad-based)
  - Cursor (VS Code-based editor)
  - LazyGit for Git management
- 🔧 Uses GNU Stow for dotfile management
- 🎨 XDG Base Directory compliant configuration

## Prerequisites

- macOS
- Git
- Basic command line knowledge

## Installation

1. Clone this repository to your home directory:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Run the setup script:

```bash
./setup.sh
```

This will:

- Install Homebrew if not present
- Install all dependencies from Brewfile
- Install Oh My Zsh
- Symlink `.zshenv` to `$HOME` for XDG configuration
- Apply macOS system preferences (via `.macos`)
- Symlink all configuration files using GNU Stow

## What's Included

### Package Management

- **Homebrew**: Package manager for macOS
- **Brewfile**: Curated list of 60+ packages, casks, and Mac App Store apps

### Terminal & Shell

- **Zsh**: Default shell with extensive configuration
- **Oh My Zsh**: Zsh framework with plugins (git, docker, python, npm, etc.)
- **Antidote**: Fast Zsh plugin manager loading:
  - `rupa/z` - Directory jumping
  - `zsh-users/zsh-completions` - Additional completions
  - `zsh-users/zsh-autosuggestions` - Fish-like autosuggestions
  - `zsh-users/zsh-history-substring-search` - Better history search
  - `fast-syntax-highlighting` - Command syntax highlighting
  - `zsh-abbr` - Command abbreviations
  - Multiple Oh My Zsh plugins (docker, docker-compose, git, npm, python, pip, colored-man-pages, etc.)
- **Starship**: Minimal, fast, customizable prompt
- **Ghostty**: Modern, GPU-accelerated terminal emulator
- **XDG Base Directory**: Clean home directory with configs in `~/.config`

### Development Tools & Languages

- **Neovim**: Modern Vim-based editor with NvChad configuration including:
  - LSP support, linting, formatting
  - Plugins: Telescope, LazyGit, auto-session, outline, render-markdown, surround, and more
- **Cursor**: AI-powered code editor (VS Code fork)
- **LazyGit**: Terminal UI for Git commands
- **Python**: pyenv for version management, Poetry support
- **Node.js**: pnpm, yarn, nvm (via zsh-nvm)
- **Rust**: rustup toolchain
- **Lua**: luarocks package manager
- **Tools**: ripgrep, wget, socat, stow, mas, ffmpeg, yt-dlp, mpv

### Applications

#### Development
- **OrbStack**: Fast Docker Desktop alternative
- **Postman**: API development and testing
- **Postgres** & **Postico**: Database tools
- **Linear**: Project management

#### Productivity
- **Raycast**: Spotlight replacement and productivity tool
- **HiddenBar**: Menu bar organization
- **Amphetamine**: Keep Mac awake utility
- **DeskPad**: Virtual desktops enhancement
- **The Unarchiver**: Archive extraction

#### Communication & Collaboration
- **Discord**, **Slack**, **Telegram**, **Zoom**: Team communication
- **Loom**: Screen recording and sharing
- **Spark**: Email client

#### Browsers & AI
- **Google Chrome**, **Firefox**: Web browsers
- **ChatGPT**: AI assistant

#### Utilities
- **Tailscale**: VPN and secure networking
- **BlackHole**: Virtual audio driver
- **Logi Options+**: Logitech device customization
- **Private Screen**: Privacy utility
- **OBS**: Streaming and recording

#### Virtualization & Gaming
- **VMware Fusion**: Virtual machines
- **Windows App**: Microsoft remote desktop
- **Steam**: Gaming platform

## Repository Structure

```
dotfiles/
├── Brewfile              # Homebrew packages, casks, and Mac App Store apps
├── setup.sh              # Automated installation script
├── nvim/                 # Neovim configuration (NvChad-based)
│   ├── init.lua
│   └── lua/
│       ├── options.lua
│       ├── mappings.lua
│       └── plugins/      # Plugin configurations
├── zsh/                  # Zsh configuration
│   ├── .zshenv          # XDG Base Directory setup
│   ├── .zshrc           # Main Zsh configuration
│   └── .zsh_plugins.txt # Antidote plugin list
├── starship/            # Starship prompt configuration
│   └── starship.toml
├── ghostty/             # Ghostty terminal configuration
│   └── config
├── lazygit/             # LazyGit TUI configuration
│   └── config.yml
└── wezterm/             # WezTerm configuration (legacy)
    └── wezterm.lua
```

## Customization

Feel free to fork this repository and modify any configurations to match your preferences:

- **`Brewfile`**: Add/remove packages, applications, and fonts
- **`zsh/.zshrc`**: Customize shell settings, aliases, and environment variables
- **`zsh/.zsh_plugins.txt`**: Add/remove Zsh plugins
- **`starship/starship.toml`**: Customize your shell prompt
- **`nvim/`**: Modify Neovim plugins and settings
- **`ghostty/config`**: Adjust terminal appearance and behavior

The setup script uses GNU Stow to create symlinks, making it easy to manage and update configurations.

## Notes

- The `.zshenv` file is symlinked to `$HOME` to set up XDG Base Directory paths
- Configuration files follow XDG standards where possible (`~/.config/`)
- Python environment management via pyenv with custom aliases for projects
- Includes personal aliases for workflow optimization (customize these for your needs)
- Requires a `.backend_secrets` file in `$HOME` for private environment variables (not tracked in git)
