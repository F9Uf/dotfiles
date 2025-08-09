#!/bin/bash
set -e

# create local bin
mkdir -p ~/.local/bin

echo ">>> Installing Homebrew if not exists..."
if ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo ">>> Installing packages from Brewfile..."
brew bundle --file=~/dotfiles/Brewfile

echo ">>> Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo ">>> Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

echo ">>> Installing MesloLGS Nerd Font..."
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font


echo ">>> Linking dotfiles with Stow..."
cd ~/dotfiles
stow zsh git vscode

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# install gvm
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# install python3
brew install python

echo ">>> Setup complete!"
