#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Copy files
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc

# Install packages
sudo apt-get -qq update
sudo apt-get -qq --yes install silversearcher-ag htop net-tools tig fzf coreutils

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
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_SYNTAX_DIR}"
fi

# Install asdf
ASDF_DIR="${HOME}/.asdf"

if [ ! -d "${ASDF_DIR}" ]; then
  mkdir -p "${ASDF_DIR}"
  git clone https://github.com/asdf-vm/asdf.git "${ASDF_DIR}"
fi
