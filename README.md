# Dotfiles

My personal dotfiles for macOS and Linux development environment setup. This repository contains configuration files and setup scripts to quickly bootstrap a new macOS or Linux system with my preferred tools and settings.

## Features

- 🛠 Automated setup script for quick installation
- 🍺 Homebrew package management with Brewfile
- 💻 Terminal setup with:
  - Zsh configuration with Oh My Zsh
  - Starship prompt
  - WezTerm and Ghostty terminal emulators
- 📝 Development tools:
  - Neovim configuration
  - Cursor (VS Code-based editor)
  - LazyGit for Git management
- 🔧 Uses GNU Stow for dotfile management

## Prerequisites

- macOS or Linux (Ubuntu/Debian, Red Hat/CentOS, or Arch-based distributions)
- Git
- Basic command line knowledge

## Installation

### Quick Install (Recommended)

Run this one-liner to automatically download and install everything:

```bash
curl -fsSL https://raw.githubusercontent.com/plsdev89/dotfiles/main/install.sh | bash
```

This will:

- Download the dotfiles repository
- Backup any existing dotfiles
- Install all dependencies (Homebrew, packages, etc.)
- Set up your shell configuration
- Symlink all configuration files

### Manual Installation

If you prefer to install manually:

1. Clone this repository to your home directory:

```bash
git clone https://github.com/plsdev89/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Run the install script:

```bash
./install.sh
```

The install script will automatically:

- Backup any existing dotfiles
- Install all system dependencies (Homebrew, packages, etc.)
- Set up your shell configuration (Oh My Zsh, Starship, etc.)
- Install development tools (LazyGit, NVM, pyenv, Poetry)
- Symlink all configuration files using GNU Stow

## What's Included

### Package Management

**macOS:**

- Homebrew for package management
- Brewfile with curated list of essential tools and applications

**Linux:**

- Native package managers (apt, yum, pacman) for system packages
- Manual installation of development tools (Starship, LazyGit)

### Terminal & Shell

- Zsh configuration with Oh My Zsh
- Starship prompt for a minimal, fast shell prompt
- WezTerm and Ghostty terminal emulators
- Antidote for Zsh plugin management

### Development Tools

- Neovim configuration
- Cursor (VS Code-based editor)
- LazyGit for improved Git workflow
- Development fonts (Fira Code and JetBrains Mono Nerd Fonts)

### Applications

**macOS:**

- Development: Docker, Postman, Postgres
- Productivity: Raycast, HiddenBar
- Communication: Discord, Slack, Telegram, Zoom
- Browsers: Google Chrome

**Linux:**

- Development: Docker, Postman, Postgres (via package managers)
- Terminal emulators: WezTerm, Ghostty
- Communication: Discord, Slack, Telegram, Zoom (via package managers)
- Browsers: Google Chrome (via package managers)

## Repository Structure

This repository is organized into logical folders for better maintainability:

```
dotfiles/
├── install.sh               # Standalone installation script
├── Brewfile                 # Homebrew package list
├── packages.md              # macOS package documentation
├── linux-packages.md        # Linux package documentation
├── SCRIPTS.md               # Script structure documentation
├── nvim/                    # Neovim configuration
├── zsh/                     # Zsh shell configuration
├── wezterm/                 # WezTerm terminal configuration
├── ghostty/                 # Ghostty terminal configuration
└── lazygit/                 # LazyGit configuration
```

## Customization

Feel free to fork this repository and modify any configurations to match your preferences. The main configuration files are organized in their respective directories:

- `nvim/` - Neovim configuration
- `zsh/` - Zsh shell configuration
- `wezterm/` - WezTerm terminal configuration
- `ghostty/` - Ghostty terminal configuration
- `lazygit/` - LazyGit configuration
