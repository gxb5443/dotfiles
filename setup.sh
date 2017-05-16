#!/bin/bash

brew bundle

ln -fs .hammerspoon/init.lua ~/.hammerspoon/init.lua

ln -fs .inputrc ~/.inputrc
ln -fs .tmux.conf ~/.inputrc

ln -fs ./config/nvim/init.vim ~/.config/nvim/init.vim

ln -fs zprofile ~/.zprezto/runcoms/zprofile
ln -fs zpreztorc ~/.zprezto/runcoms/zpreztorc
ln -fs zshrc ~/.zprezto/runcoms/zshrc
