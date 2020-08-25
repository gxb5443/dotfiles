#!/bin/bash

set -ex

BASE_DIRECTORY="$HOME/Documents"
DIRECTORY_LOCATION=$BASE_DIRECTORY/dotfiles

#if [[ "$OSTYPE" == "darwin"* ]]; then
#  echo "Yup, mac alright..."
#  if ! command -v foo 2>/dev/null; then
#    echo "Homebrew not found. Installing now..."
#    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#  fi
#  brew bundle
#fi

ln -fs $DIRECTORY_LOCATION/.hammerspoon $HOME/.hammerspoon

ln -fs $DIRECTORY_LOCATION/.inputrc $HOME/.inputrc
ln -fs $DIRECTORY_LOCATION/.tmux.conf $HOME/.tmux.conf

ln -fs $DIRECTORY_LOCATION/config/nvim $HOME/.config/nvim

#ln -fs $DIRECTORY_LOCATION/.gitignore_global $HOME/.gitignore_global
#ln -fs $DIRECTORY_LOCATION/.gitconfig $HOME/.gitconfig
