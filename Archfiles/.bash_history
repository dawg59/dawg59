git clone https://github.com/dawg59/dawg59.git
cls
clear
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
fastfetch --gen-config
chmod +x folders-color-chooser.sh
sh folders-color-chooser.sh -c grey
sh folders-color-chooser.sh -l
sh folders-color-chooser.sh -C
sh folders-color-chooser.sh -c white

