#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# Create directory for APT keyrings if it doesn't exist
sudo mkdir -p /etc/apt/keyrings

# Set up mise repository if not already installed
if ! command -v mise &>/dev/null; then
  # Import GPG key
  wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null

  # Get architecture
  ARCH=$(dpkg --print-architecture)

  # Add repository with correct architecture
  echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=$ARCH] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
fi

# Update and install all packages at once
sudo apt-get -qq update
sudo apt-get -qq --yes install silversearcher-ag htop net-tools tig fzf coreutils wget gpg git curl mise

# Copy files
ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install powerlevel10k
POWERLEVEL10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

if [ ! -d "${POWERLEVEL10K_DIR}" ]; then
  mkdir -p "${POWERLEVEL10K_DIR}"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${POWERLEVEL10K_DIR}"
fi

# Remove gitstatus directory
rm -rf "${POWERLEVEL10K_DIR}/gitstatus"

# Install syntax highlighting
ZSH_SYNTAX_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

if [ ! -d "${ZSH_SYNTAX_DIR}" ]; then
  mkdir -p "${ZSH_SYNTAX_DIR}"
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_SYNTAX_DIR}"
fi
