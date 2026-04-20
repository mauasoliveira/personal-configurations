echo "Packages"
sudo apt update ; sudo apt upgrade -y

echo "Brew"
brew upgrade

echo "Flatpak"
flatpak upgrade -y

echo "nvim"
cd ~/Documents/Projects/Opensources/neovim/
update
sudo make distclean ; make CMAKE_TYPE=Release ; sudo make install
