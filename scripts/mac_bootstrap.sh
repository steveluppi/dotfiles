#!/usr/bin/env bash

# Run with: /bin/bash -c "$(curl https://raw.githubusercontent.com/steveluppi/dotfiles/main/scripts/mac_bootstrap.sh)"

# Dotfiles
echo "[$(date '+%Y-%m-%d %H:%M')] Checking Dotfiles"
if [ ! -d ~/.dotfiles ]; then
	echo "[$(date '+%Y-%m-%d %H:%M')] Cloning Dotfiles"
	git clone https://github.com/steveluppi/dotfiles ~/.dotfiles
else
	echo "[$(date '+%Y-%m-%d %H:%M')] Getting Latest Dotfiles"
	cd ~/.dotfiles; git pull; cd ~

fi

# # Homebrew
# echo "[$(date '+%Y-%m-%d %H:%M')] Installing Homebrew"
# export NONINTERACTIVE=1
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# eval "$(/opt/homebrew/bin/brew shellenv)"
# brew bundle --file ~/.dotfiles/brew/Brewfile

