#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"

cp "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

echo "Installed .zshrc"
