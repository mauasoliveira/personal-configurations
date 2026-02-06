#!/bin/bash

# Install dependencies
sudo apt update 
sudo apt upgrade -y

# Neovim Dependencies
sudo apt-get install ninja-build gettext cmake curl build-essential git

sudo apt install -y ripgrep fzf wget zoxide tmux tig zsh openssh-server fd-find lua5.1 luarocks podman mkcert docker-cli docker-compose libnss3-tools bat starship
# python3

git config --global pull.rebase false

mkdir -p ~/Documents/Projects/Opensources/
git clone https://github.com/neovim/neovim.git cd ~/Documents/Projetcs/Opensources/neovim
cd ~/Documents/Projects/Opensources/neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

echo "Installing MISE"
sudo install -dm 755 /etc/apt/keyrings
curl -fSs https://mise.jdx.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.asc 1> /dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.asc] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list

sudo apt update -y
sudo apt install -y mise

#
echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# echo "Installing Homebrew" /bin/bash -c "$(curl -fsSL 
# https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Install tools"
brew install fastfetch lazygit opencode sesh # tako8ki/tap/gobang mhzawadi/cbonsai/cbonsai

# Generate completion script
sesh completion zsh > _sesh

# Install system-wide (recommended)
sudo mkdir -p /usr/local/share/zsh/site-functions
sudo cp _sesh /usr/local/share/zsh/site-functions/

# echo " > Hurl " VERSION=6.1.1 curl --location --remote-name 
# https://github.com/Orange-OpenSource/hurl/releases/download/$VERSION/hurl_${VERSION}_amd64.deb 
# sudo apt update && sudo apt install 
# ./hurl_${VERSION}_amd64.deb

echo "PENDING"
echo ">> HURL"
echo ">> NVM"

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# snap install yazi --classic
