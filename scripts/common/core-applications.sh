set +e

echo
echo "Installing Core Apps..."

# Neovim
brew install --cask neovim-nightly

brew install --cask hammerspoon
brew install --cask docker

brew install z
brew install lsd
brew install jq
brew install fd
brew install fzf
brew install htop
brew install fish
brew install bat
brew install bat-extras
brew install ripgrep
brew install ansible
brew install gnu-sed

brew install --cask firefox

brew install --cask slack

brew install --cask visual-studio-code

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
