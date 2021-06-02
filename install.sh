#!/usr/bin/env bash
# Setup script for setting up a new macos machine

echo "Starting setup"

# install xcode CLI
xcode-select —-install

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.finder CreateDesktop false

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

PACKAGES=(
    node
    python
)

CASKS=(
    setapp
    rocket
    1password
    spotify
    slack
    visual-studio-code
    steam
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

# any additional steps you want to add here

# link readline
brew link --force readline

echo "Installing cask apps..."
brew install ${CASKS[@]}

echo "Setup complete!"