#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Yup, mac alright..."
  if ! command -v foo 2>/dev/null; then
    echo "Homebrew not found. Installing now..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew bundle
fi

ln -fs .hammerspoon/init.lua ~/.hammerspoon/init.lua

ln -fs .inputrc ~/.inputrc
ln -fs .tmux.conf ~/.inputrc

ln -fs ./config/nvim/init.vim ~/.config/nvim/init.vim

ln -fs zprofile ~/.zprofile
ln -fs zshrc ~/.zshrc
