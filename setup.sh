#!/bin/bash

BASE_DIRECTORY="$HOME/Documents/dotfiles"
DIRECTORY_LOCATION=$BASE_DIRECTORY/dotfiles

#if [[ "$OSTYPE" == "darwin"* ]]; then
#  echo "Yup, mac alright..."
#  if ! command -v foo 2>/dev/null; then
#    echo "Homebrew not found. Installing now..."
#    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#  fi
#  brew bundle
#fi

ln -fs $DIRECTORY_LOCATION/.hammerspoon/init.lua $BASE_DIRECTORY/.hammerspoon/init.lua

ln -fs $DIRECTORY_LOCATION/.inputrc $BASE_DIRECTORY/.inputrc
ln -fs $DIRECTORY_LOCATION/.tmux.conf $BASE_DIRECTORY/.inputrc

ln -fs $DIRECTORY_LOCATION/config/nvim/init.vim $BASE_DIRECTORY/.config/nvim/init.vim

ln -fs $DIRECTORY_LOCATION/.gitignore_global $BASE_DIRECTORY/.gitignore_global
ln -fs $DIRECTORY_LOCATION/.gitconfig $BASE_DIRECTORY/.gitconfig
