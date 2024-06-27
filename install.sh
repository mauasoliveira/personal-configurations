
#!/bin/bash
# Install dependencies
sudo apt update
sudo apt install -y ripgrep fzf wget fontconfig zoxide tmux neovim tig

echo "Installing Oh My ZSH"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing NVM"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

FONT_NAME="SourceCodePro"
echo "Installing $FONTNAME"
if fc-list | grep -qi "$FONT_NAME"; then
    echo "The font '$FONT_NAME' is already installed."
else
	echo "Installing $FONT_NAME font..."

	wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/$FONT_NAME.zip 

	cur_dir=$(pwd)
	cd ~/.local/share/fonts && unzip $FONT_NAME.zip && rm *Windows* && rm $FONT_NAME.zip && fc-cache -fv

	cd $cur_dir
fi


