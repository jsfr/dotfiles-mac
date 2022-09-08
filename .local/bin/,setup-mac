#!/usr/bin/env sh
set -euxo pipefail

HOSTNAME=kukunochi

# Set hostname and computer name
sudo scutil --set HostName kukunochi
sudo scutil --set ComputerName kukunochi

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Setup .gitconfig
curl -Lks https://raw.githubusercontent.com/jsfr/dotfiles-mac/master/.gitconfig > ~/.gitconfig

# Create SSH key for Github
ssh-keygen -t ed25519 -C "jsfr@users.noreply.github.com"

# Add SSH key to Github
gh auth login
gh ssh-key add ~/.ssh/id_ed25519.pub -t "${USER}@${HOSTNAME}"

# Run setup dotfiles
curl -Lks https://raw.githubusercontent.com/jsfr/dotfiles-mac/master/.local/bin/setup-dotfiles | /bin/bash

# Install all packages managed by brewfile
brew bundle install

# Start skhd
brew services start skhd

# Start yabai
brew services start yabai
sudo yabai --install-sa

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install tpm plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# Speed up the keyboard
defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 2         # normal minimum is 2 (30 ms)

# Install latest LTS node
n lts

# Install NPM packages
npm install -g yarn
npm install -g snyk

# Install pipx packages
pipx install git-delete-merged-branches

# Clone and install rmenu
mkdir -p ~/Repos/github.com/jsfr
cd ~/Repos/github.com/jsfr
git clone git@github.com:jsfr/rmenu.git
just install
cd ~

# Set up k8s, aws-vault, vault and keychain
read -p "Set up k8s, aws-vault, vault and keychain. Then press Enter to continue" </dev/tty

# Add keychain entry for hammerspoon pull request widget
read -p "Set up a Github Token for Hammerspoon PR widget. Then press Enter to continue" </dev/tty

# Install native module for tridactyl
read -p "To use .tridactylrc open Firefox and run :nativeinstall. Then press Enter to continue" </dev/tty
