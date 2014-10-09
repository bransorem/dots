#!/usr/bin/env bash

set -e

# modules
source "$lib/symlink/index.sh"
source "$lib/is-osx/index.sh"

# Only run if on a Mac
if [ 0 -eq `osx` ]; then
  exit 0
fi

# exit 1
# paths
osx="$os/osx"

# Run each program
sh "$osx/defaults.sh"
sh "$osx/binaries.sh"
sh "$osx/apps.sh"


# Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Change default
chsh -s /bin/zsh

# RVM - ruby
curl -L get.rvm.io | bash -s stable --ruby

# NVM - node
nvm install 0.10

# Keybase
npm install -g keybase-installer
keybase-installer


# Symlink the profile
if [[ ! -e "$HOME/.bash_profile" ]]; then
  echo "symlinking: $osx/profile.sh => $HOME/.bash_profile"
  symlink "$osx/profile.sh" "$HOME/.bash_profile"
  source $HOME/.bash_profile
else
  echo "$HOME/.bash_profile already exists. remove and run again."
fi
