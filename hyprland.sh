!# /bin/bash

echo "HYPRLAND INSTALL"
apt install -y hyprland
apt install -y hyprpaper

echo "HYRPLAND CONF CLONE"
cp ./config/hypr/ ~/.config/hypr
cp ./config/kitty/ ~/.config/kitty
