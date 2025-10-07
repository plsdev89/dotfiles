#!/usr/bin/env bash

echo "Setting up your Mac..."



# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle --file ./Brewfile

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Removes .zshenv from $HOME (if it exists) and symlinks the .zshenv file from the .dotfiles
rm -rf $HOME/.zshenv
ln -sw $HOME/dotfiles/zsh/.zshenv $HOME/.zshenv

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

stow .
