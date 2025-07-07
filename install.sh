#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y git ripgrep fzf wget zoxide tmux neovim tig zsh openssh-server fd-find

# echo "Installing NVM"
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# nvm install --lts nvm use --lts
#
echo "Installing TPM"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing dev tools"

echo " > Hurl "
# VERSION=6.1.1
curl --location --remote-name https://github.com/Orange-OpenSource/hurl/releases/download/$VERSION/hurl_${VERSION}_amd64.deb
sudo apt update && sudo apt install ./hurl_${VERSION}_amd64.deb

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "PENDING"
echo "HURL"
echo "NVM"

snap install yazi --classic
