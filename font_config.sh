#!/bin/bash

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



