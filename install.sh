#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# Copy files
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc

# Install packages
sudo apt-get -qq update
sudo apt-get -qq --yes install silversearcher-ag htop net-tools tig

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Remove gitstatus directory
rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/gitstatus

# Install syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Setup otel profiling agent
setup-repo otel-profiling-agent
