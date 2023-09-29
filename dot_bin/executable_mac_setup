#!/bin/sh
#
# Install script: Bootstraps a dev environment from Mac OS X defaults.
# (Installer functions borrowed from github.com/thoughtbot/laptop)

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

brew_install_or_upgrade() {
  if brew_is_installed "$1"; then
    if brew_is_upgradable "$1"; then
      fancy_echo "Upgrading %s ..." "$1"
      brew upgrade "$@"
    else
      fancy_echo "Already using the latest version of %s. Skipping ..." "$1"
    fi
  else
    fancy_echo "Installing %s ..." "$1"
    brew install "$@"
  fi
}

brew_is_installed() {
  local name="$(brew_expand_alias "$1")"

  brew list -1 | grep -Fqx "$name"
}

brew_is_upgradable() {
  local name="$(brew_expand_alias "$1")"

  ! brew outdated --quiet "$name" >/dev/null
}

brew_tap() {
  brew tap "$1" 2> /dev/null
}

brew_expand_alias() {
  brew info "$1" 2>/dev/null | head -1 | awk '{gsub(/:/, ""); print $1}'
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    fancy_echo "Updating %s ..." "$1"
    gem update "$@"
  else
    fancy_echo "Installing %s ..." "$1"
    gem install "$@"
    rbenv rehash
  fi
}

brew_launchctl_restart() {
  local name="$(brew_expand_alias "$1")"
  local domain="homebrew.mxcl.$name"
  local plist="$domain.plist"

  fancy_echo "Restarting %s ..." "$1"
  mkdir -p "$HOME/Library/LaunchAgents"
  ln -sfv "/usr/local/opt/$name/$plist" "$HOME/Library/LaunchAgents"

  if launchctl list | grep -Fq "$domain"; then
    launchctl unload "$HOME/Library/LaunchAgents/$plist" >/dev/null
  fi
  launchctl load "$HOME/Library/LaunchAgents/$plist" >/dev/null
}

# Ask for sudo access
fancy_echo "I need your admin password to install everything."
sudo -v

# Better OSX defaults
fancy_echo "Setting better OS X defaults..."
defaults write com.apple.dock persistent-apps -array; # remove icons in Dock
defaults write com.apple.dock autohide -bool true; # turn Dock auto-hidng on
defaults write com.apple.dock autohide-delay -float 0; # remove Dock show delay
defaults write com.apple.dock autohide-time-modifier -float 0; # remove Dock show delay
defaults write NSGlobalDomain AppleShowAllExtensions -bool true; # show all file extensions
killall Dock 2>/dev/null;
killall Finder 2>/dev/null;

# Install Mac Command Line Tools
fancy_echo "Installing Xcode Command Line Tools..."
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
PROD=$(softwareupdate -l |
  grep "\*.*Command Line" |
  head -n 1 | awk -F"*" '{print $2}' |
  sed -e 's/^ *//' |
  tr -d '\n')
softwareupdate -i "$PROD" -v;

# Install Homebrew
if ! command -v brew >/dev/null; then
  fancy_echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby
else
  fancy_echo "Homebrew already installed. Skipping ..."
fi

# Update Homebrew
fancy_echo "Updating Homebrew..."
brew update

# Tap necessary casks
fancy_echo "Tapping casks..."
brew_tap neovim/neovim
brew_tap caskroom/versions;
brew_tap igas/fry

# Install Homebrew packages
brew_install_or_upgrade fish
brew_install_or_upgrade git
brew_install_or_upgrade postgres
brew_launchctl_restart 'postgresql'
brew_install_or_upgrade redis
brew_launchctl_restart 'redis'

brew_install_or_upgrade caskroom/cask/brew-cask
brew_install_or_upgrade ctags
brew_install_or_upgrade elixir
brew_install_or_upgrade fry
brew_install_or_upgrade heroku-toolbelt
brew_install_or_upgrade hub
brew_install_or_upgrade leiningen
brew_install_or_upgrade mongodb
brew_install_or_upgrade neovim
brew_install_or_upgrade node
brew_install_or_upgrade python
brew_install_or_upgrade ruby_install
brew_install_or_upgrade the_silver_searcher
brew_install_or_upgrade tmux

brew_install_or_upgrade 'openssl'
brew unlink openssl && brew link openssl --force
brew_install_or_upgrade 'libyaml'

fancy_echo "Installing a bunch of casks..."
brew cask install \
  boot2docker \
  dropbox \
  evernote \
  firefox \
  google-chrome \
  google-hangouts \
  google-notifier \
  haskell-platform \
  harvest \
  java \
  spectacle \
  spotify \
  vagrant \
  virtualbox

# Use OSX Keychain for git
git config --global credential.helper osxkeychain; # activate git credentials storage

# Install oh-my-fish
fancy_echo "Installing oh-my-fish..."
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/tools/install.fish | fish
rm install.fish

# Install polka
fancy_echo "Installing polka..."
git clone https://github.com/dysnomian/polka.git ~/.dotfiles
sh ~/.dotfiles/install.sh

# Install ruby
fancy_echo "Installing current Ruby..."
ruby-install ruby

# Install basic gems
gem_install_or_update bundler
gem_install_or_update foreman

# install Oracle VM VirtualBox Extension Pack (needed to load OS X on VirtualBox)
# http://alanthing.com/blog/2013/03/17/virtualbox-extension-pack-with-one-line
export version=$(/usr/bin/vboxmanage -v) &&
export var1=$(echo ${version} | cut -d 'r' -f 1) &&
export var2=$(echo ${version} | cut -d 'r' -f 2) &&
export file="Oracle_VM_VirtualBox_Extension_Pack-${var1}-${var2}.vbox-extpack" &&
curl --silent --location http://download.virtualbox.org/virtualbox/${var1}/${file} \
  -o ~/Downloads/${file} && VBoxManage extpack install ~/Downloads/${file} --replace &&
rm ~/Downloads/${file} &&
unset version var1 var2 file;

# Install Yosemite vagrant box
vagrant box add jhcook/osx-yosemite-10.10;

# Install Arch vagrant box
vagrant box add archlinux-x86_64

# Change shell to fish
chsh -s /usr/local/bin/fish

# Install oh-my-fish stuff
omf install

