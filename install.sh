#!/bin/bash

# Install dependencies
sudo apt update sudo apt upgrade -y

# Neovim Dependencies
sudo apt-get install ninja-build gettext cmake curl build-essential git

sudo apt install -y ripgrep fzf wget zoxide tmux tig zsh openssh-server fd-find lua5.1 luarocks podman mkcert docker-cli docker-compose libnss3-tools bat
# python3

git config --global pull.rebase false

mkdir -p ~/Documents/Projects/Opensources/
git clone https://github.com/neovim/neovim.git cd ~/Documents/Projetcs/Opensources/neovim
cd ~/Documents/Projects/Opensources/neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

# echo "Installing NVM" wget -qO- 
# https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh 
# | bash

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s 
# "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s 
# "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm 
# nvm install --lts nvm use --lts
#
echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# echo "Installing Homebrew" /bin/bash -c "$(curl -fsSL 
# https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Install tools"
brew install lazygit opencode # tako8ki/tap/gobang mhzawadi/cbonsai/cbonsai

# echo " > Hurl " VERSION=6.1.1 curl --location --remote-name 
# https://github.com/Orange-OpenSource/hurl/releases/download/$VERSION/hurl_${VERSION}_amd64.deb 
# sudo apt update && sudo apt install 
# ./hurl_${VERSION}_amd64.deb

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "PENDING" echo "HURL" echo "NVM"

# snap install yazi --classic
