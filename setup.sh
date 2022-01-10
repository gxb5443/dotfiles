#!/bin/bash
#
# setup.sh: Setup my new environment
#
# Arguments:
# 	- a list of components to install
#
# Environment variables:
#   - none
#

set -ex

TARGET_DIRECTORY="$(pwd)"

#if [[ "$OSTYPE" == "darwin"* ]]; then
#  echo "Yup, mac alright..."
#  if ! command -v foo 2>/dev/null; then
#    echo "Homebrew not found. Installing now..."
#    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#  fi
#  brew bundle
#fi

echo "==> Setting up dotfiles..."

for var in "$@"
do
	echo "$var"
	FILE=${BASE_DIRECTORY}/scripts/opt-in/${var}.sh
	if [[ -f $FILE ]]; then
		source ${FILE}
	else
		echo "WARNING: $var is not a valid option"
	fi
done

ln -fs $TARGET_DIRECTORY/.hammerspoon $HOME/.hammerspoon

ln -fs $TARGET_DIRECTORY/.inputrc $HOME/.inputrc
ln -fs $TARGET_DIRECTORY/.tmux.conf $HOME/.tmux.conf

ln -fs $TARGET_DIRECTORY/config/nvim $HOME/.config/nvim

ln -fs $TARGET_DIRECTORY/config/fish/config.fish $HOME/.config/fish/config.fish

echo "==> Environment is ready to go!"
