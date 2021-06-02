#!/usr/bin/env bash
# Setup script for setting up a new macos machine

echo "Starting setup"

# install xcode CLI
xcode-select —-install

# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Hide desktop icons
defaults write com.apple.finder CreateDesktop false
# Rearrange spaces based on recent use FALSE
defaults write com.apple.dock "mru-spaces" -bool "false"

# TextEdit - plain text
defaults write com.apple.TextEdit "RichText" -bool "false" && killall TextEdit

killall Finder
killall Dock

# Check for Homebrew to be present, install if it's missing
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install from bundle
brew bundle install

echo "Setup complete!"