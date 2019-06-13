#!/bin/bash

set -e

BASE_DIRECTORY="$HOME/Documents"
DIRECTORY_LOCATION=$BASE_DIRECTORY/dotfiles

ln -fs $DIRECTORY_LOCATION/.hammerspoon $HOME/.hammerspoon

#ln -fs $DIRECTORY_LOCATION/.inputrc $HOME/.inputrc
#ln -fs $DIRECTORY_LOCATION/.tmux.conf $HOME/.tmux.conf

ln -fs $DIRECTORY_LOCATION/config/nvim/init.vim $HOME/.config/nvim/init.vim

ln -fs $DIRECTORY_LOCATION/.gitignore_global $HOME/.gitignore_global
ln -fs $DIRECTORY_LOCATION/.gitconfig $HOME/.gitconfig
