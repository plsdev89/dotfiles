#!/usr/bin/env bash

# Dotfiles Install Script
# This script downloads the dotfiles repository and sets up your development environment

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
DOTFILES_REPO="https://github.com/plsdev89/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check if directory exists and is not empty
dir_exists_and_not_empty() {
    [ -d "$1" ] && [ "$(ls -A "$1" 2>/dev/null)" ]
}

# Backup existing dotfiles
backup_existing_dotfiles() {
    print_status "Checking for existing dotfiles..."
    
    local files_to_backup=(
        "$HOME/.zshrc"
        "$HOME/.zshenv"
        "$HOME/.zprofile"
        "$HOME/.bashrc"
        "$HOME/.bash_profile"
        "$HOME/.gitconfig"
        "$HOME/.gitignore_global"
        "$HOME/.vimrc"
        "$HOME/.vim"
        "$HOME/.config/nvim"
        "$HOME/.config/wezterm"
        "$HOME/.config/ghostty"
        "$HOME/.config/lazygit"
    )
    
    local has_existing=false
    for file in "${files_to_backup[@]}"; do
        if [ -e "$file" ]; then
            has_existing=true
            break
        fi
    done
    
    if [ "$has_existing" = true ]; then
        print_warning "Existing dotfiles detected. Creating backup in $BACKUP_DIR"
        mkdir -p "$BACKUP_DIR"
        
        for file in "${files_to_backup[@]}"; do
            if [ -e "$file" ]; then
                local backup_path="$BACKUP_DIR/$(basename "$file")"
                if [ -d "$file" ]; then
                    cp -r "$file" "$backup_path"
                else
                    cp "$file" "$backup_path"
                fi
                print_status "Backed up: $file"
            fi
        done
        
        print_success "Backup completed in $BACKUP_DIR"
    fi
}

# Download and setup dotfiles repository
setup_dotfiles_repo() {
    print_status "Setting up dotfiles repository..."
    
    # Remove existing dotfiles directory if it exists
    if [ -d "$DOTFILES_DIR" ]; then
        print_warning "Existing dotfiles directory found. Removing it..."
        rm -rf "$DOTFILES_DIR"
    fi
    
    # Clone the repository
    print_status "Cloning dotfiles repository..."
    if ! git clone "$DOTFILES_REPO" "$DOTFILES_DIR"; then
        print_error "Failed to clone dotfiles repository. Please check your internet connection and repository URL."
        exit 1
    fi
    
    # Navigate to dotfiles directory
    cd "$DOTFILES_DIR"
    
    print_success "Dotfiles repository cloned successfully"
}

# Install dependencies based on OS
install_dependencies() {
    print_status "Installing system dependencies..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        print_status "Detected macOS - installing dependencies..."
        
        # Check if curl is available (needed for downloading dependencies)
        if ! command_exists curl; then
            print_error "curl is required but not installed. Please install curl first."
            exit 1
        fi
        
        # Check for Homebrew and install if we don't have it
        if ! command_exists brew; then
            print_status "Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
            
            # Add Homebrew to PATH
            echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
        
        # Update Homebrew
        print_status "Updating Homebrew..."
        brew update
        
        # Install packages from Brewfile
        print_status "Installing packages from Brewfile..."
        brew tap homebrew/bundle
        brew bundle --file "$DOTFILES_DIR/Brewfile"
        
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        print_status "Detected Linux - installing dependencies..."
        
        # Check if this is Ubuntu
        if command_exists apt-get && grep -q "Ubuntu" /etc/os-release 2>/dev/null; then
            print_status "Detected Ubuntu - installing packages..."
            sudo apt-get update
            sudo apt-get install -y curl git stow zsh neovim ripgrep build-essential python3-pip
            
            # Install additional tools
            install_starship
            install_lazygit
            install_nvm
            install_pyenv
            install_poetry
        else
            print_warning "This script is optimized for Ubuntu. You may need to install dependencies manually."
            print_status "Please ensure you have: git, curl, stow, zsh, neovim, ripgrep, build-essential, python3-pip"
        fi
    else
        print_error "Unsupported operating system: $OSTYPE"
        print_error "Supported systems: macOS, Linux (Ubuntu recommended)"
        exit 1
    fi
}

# Install Starship prompt
install_starship() {
    if ! command_exists starship; then
        print_status "Installing Starship prompt..."
        curl -sS https://starship.rs/install.sh | sh
    fi
}

# Install LazyGit
install_lazygit() {
    if ! command_exists lazygit; then
        print_status "Installing LazyGit..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        rm lazygit.tar.gz lazygit
    fi
}

# Install NVM
install_nvm() {
    if ! command_exists nvm; then
        print_status "Installing NVM..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
        echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
        echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
        echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc
    fi
}

# Install pyenv
install_pyenv() {
    if ! command_exists pyenv; then
        print_status "Installing pyenv..."
        curl https://pyenv.run | bash
        echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
        echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
        echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    fi
}

# Install Poetry
install_poetry() {
    if ! command_exists poetry; then
        print_status "Installing Poetry..."
        curl -sSL https://install.python-poetry.org | python3 -
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    fi
}

# Install Oh My Zsh
install_oh_my_zsh() {
    if ! command_exists omz; then
        print_status "Installing Oh My Zsh..."
        /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
    fi
}

# Setup shell configuration
setup_shell_config() {
    print_status "Setting up shell configuration..."
    
    # Install Oh My Zsh
    install_oh_my_zsh
    
    # Setup .zshenv symlink
    if [ -f "$HOME/.zshenv" ]; then
        rm -f "$HOME/.zshenv"
    fi
    ln -sw "$DOTFILES_DIR/zsh/.zshenv" "$HOME/.zshenv"
    
    print_success "Shell configuration completed"
}

# Symlink configuration files using GNU Stow
symlink_configs() {
    print_status "Symlinking configuration files..."
    
    if ! command_exists stow; then
        print_error "GNU Stow is required but not installed. Please install it first."
        exit 1
    fi
    
    # Create .config directory if it doesn't exist
    if [ ! -d "$HOME/.config" ]; then
        print_status "Creating ~/.config directory..."
        mkdir -p "$HOME/.config"
    fi
    
    # Navigate to dotfiles directory
    cd "$DOTFILES_DIR"
    
    # Use stow to symlink all configurations
    stow .
    
    print_success "Configuration files symlinked successfully"
}

# Main installation function
main() {
    print_status "Starting dotfiles installation..."
    print_status "Repository: $DOTFILES_REPO"
    print_status "Installation directory: $DOTFILES_DIR"
    
    # Install dependencies first (including git and curl for Linux)
    install_dependencies
    
    # Check if git is now available after installation
    if ! command_exists git; then
        print_error "Git installation failed. Please install Git manually."
        exit 1
    fi
    
    # Backup existing dotfiles
    backup_existing_dotfiles
    
    # Setup dotfiles repository
    setup_dotfiles_repo
    
    # Setup shell configuration
    setup_shell_config
    
    # Symlink configuration files
    symlink_configs
    
    print_success "Dotfiles installation completed successfully!"
    print_status "Your dotfiles are now installed in: $DOTFILES_DIR"
    
    if [ -d "$BACKUP_DIR" ]; then
        print_status "Your previous dotfiles have been backed up to: $BACKUP_DIR"
    fi
    
    print_status "Please restart your terminal or run 'source ~/.zshrc' to apply the new configuration."
    print_status "You may need to log out and back in for all changes to take effect."
}

# Run main function
main "$@"
