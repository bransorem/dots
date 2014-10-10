#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  adium
  alfred
  amadeus-pro
  anvil
  atom
  brackets
  calibre
  cyberduck
  dash
  dropbox
  evernote
  fantastical
  firefox
  flash
  flux
  google-chrome
  google-drive
  handbrake
  imageoptim
  jump-desktop
  little-snitch
  postgres
  prizmo
  qlcolorcode
  qlmarkdown
  qlstephen
  quicklook-json
  reflector
  screenflow
  sequel-pro
  sublime-text3
  transmission
  virtualbox
  vagrant
  vlc
)

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-fira-sans
  font-source-code-pro
  font-source-sans-pro
  font-source-serif-pro
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  brew install caskroom/cask/brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}

  # link with alfred
  alfred
  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

alfred() {
  brew cask alfred link
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
