#! /bin/bash

#Instalando git

echo "############################"
echo "##### GIT INSTALL ##########"
echo "############################"
apt install -y git

#Instalando Neovim
echo "###############################"
echo "###### instalando neovim ######"
echo "###############################"
apt install -y neovim

#Instalando .files Lazyvim
echo "#######################################"
echo "###### instalando .files lazyvim ######"
echo "#######################################"
mkdir ~/.cofing/nvim
git clone https://github.com/felipenovorocha/neovim-config ~/.config/nvim

#Instalando tree-sitter cli
echo "####################################"
echo "###### TREE-SITTER INSTALL #########"
echo "####################################"
apt install -y tree-sitter-cli

#Instalando ripgrep
echo "#############################"
echo "###### RIPGREP INSTALL ######"
echo "#############################"
apt install -y ripgrep ## Instalando Nerd Font

echo "##################################"
echo "###### NERD FONT INSTALL #########"
echo "##################################"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/nerd-fonts/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv

# Instalando brave
echo "##########################"
echo "##### BRAVE INSTALL ######"
echo "##########################"
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
curl -fsSLo /etc/apt/sources.list.d/brave-browser-release.sources https://brave-browser-apt-release.s3.brave.com/brave-browser.sources
apt install brave-browser
xdg-settings set default-web-browser brave-browser.desktop

#Instalando Rclone

echo "########################"
echo "#### RCLONE INSTALL ####"
echo "########################"
curl https://rclone.org/install.sh | sudo bash

echo "########################"
echo "#### STEAM INSTALL #####"
echo "########################"
sudo snap install steam

echo "########################"
echo "#### REAPER INSTALL #####"
echo "########################"
wget https://www.reaper.fm/files/7.x/reaper705_linux_x86_64.tar.xz
tar xvf reaper705_linux_x86_64.tar.xz
cd reaper_linux_x86_64
rm -rf reaper705_linux_x86_64.tar.xz
rm -rf reaper705_linux_x86_64.tar.xz

apt update
apt install build-essential libgtk-3-dev git pipewire-jack

./install-reaper.sh
