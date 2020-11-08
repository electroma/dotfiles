#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install a modern version of Bash.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install ack
#brew install exiv2
brew install git
brew install git-lfs
brew install git-extras
brew install git-secret
brew install gs
brew install htop
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rlwrap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install zopfli

# Tools of trade
brew install asdf
brew install awscli
brew install ffmpeg
brew install hugo
brew install jq
brew install openjdk
brew install pass
brew install pwgen
brew install python3
brew install wget
brew install youtube-dl
brew install zsh

# Casks

brew cask install adobe-acrobat-reader
brew cask install caffeine
brew cask install ccmenu
brew cask install etcher
brew cask install firefox
brew cask install freemind
brew cask install gimp
brew cask install hammerspoon
brew cask install iterm2
brew cask install jetbrains-toolbox
brew cask install keybase
brew cask install pencil
brew cask install postman
brew cask install qbittorrent
brew cask install shotcut
brew cask install slack
brew cask install teamviewer
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install vlc
brew cask install whatsapp
brew cask install zoomus

# Remove outdated versions from the cellar.
brew cleanup
