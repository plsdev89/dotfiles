# Dotfiles

My personal dotfiles for macOS development environment setup. This repository contains configuration files and setup scripts to quickly bootstrap a new macOS system with my preferred tools and settings.

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
- Set up Zsh configuration
- Configure development tools
- Apply macOS system preferences
- Symlink all configuration files using GNU Stow

## What's Included

### Package Management

- Homebrew for package management
- Brewfile with curated list of essential tools and applications

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

- Development: Docker, Postman, Postgres
- Productivity: Raycast, HiddenBar
- Communication: Discord, Slack, Telegram, Zoom
- Browsers: Google Chrome

## Customization

Feel free to fork this repository and modify any configurations to match your preferences. The main configuration files are organized in their respective directories:

- `nvim/` - Neovim configuration
- `zsh/` - Zsh shell configuration
- `starship/` - Starship prompt configuration
- `wezterm/` - WezTerm terminal configuration
- `ghostty/` - Ghostty terminal configuration
- `lazygit/` - LazyGit configuration
- `cursor/` - Cursor editor configuration

## License

MIT License - Feel free to use and modify as you see fit.

```bash
./setup.sh
```
