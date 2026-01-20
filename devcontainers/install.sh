#!/bin/bash
set -e

# curl -sS https://starship.rs/install.sh | sh -s -- -y
curl -s https://ohmyposh.dev/install.sh | bash -s

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Install .zshrc (sets SSH_AUTH_SOCK on macOS, containers use forwarded agent)
cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Install .gitconfig (user info, signing key, SSH signing enabled)
cp "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"

cp "$DOTFILES_DIR/.config/oh-my-posh.json" "$HOME/.config/oh-my-posh.json"

