#
# Binary installer
#

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
brew update && brew upgrade brew-cask

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew tap caskroom/fonts
brew tap homebrew/versions
# brew tap homebrew/homebrew-php

# Install other useful binaries
binaries=(
  autoconf
  automake
  bash
  boot2docker
  cmake
  coreutils
  curl
  docker
  eigen
  elasticsearch
  ffmpeg
  findutils
  git
  go
  gpg2
  grep
  imagemagick
  lame
  libgcrypt
  memcached
  mongodb
  nmap
  nvm
  opencv
  openssh
  openssl
  osxfuse
  pandoc
  postgresql
  python
  qt
  redis
  rbenv
  ruby-build
  rsync
  sbt
  socat
  sqlite
  tcsh
  tesseract
  tree
  vim
  wget
  wireshark
  zsh
)

# Install the binaries
brew install ${binaries[@]}

# Add osx specific command line tools
if test ! $(which subl); then
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

# Install spot
if test ! $(which spot); then
  curl -L https://raw.github.com/guille/spot/master/spot.sh -o /usr/local/bin/spot && chmod +x /usr/local/bin/spot
fi

# Remove outdated versions from the cellar
brew cleanup

exit 0
