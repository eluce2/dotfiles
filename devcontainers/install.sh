#!/bin/bash
set -e

curl -sS https://starship.rs/install.sh | sh -s -- -y
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

# Install .zshrc (sets SSH_AUTH_SOCK on macOS, containers use forwarded agent)
cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
echo "Installed .zshrc"

# Install .gitconfig (user info, signing key, SSH signing enabled)
cp "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
echo "Installed .gitconfig"

echo "Git SSH signing configured (uses forwarded 1Password agent)"
