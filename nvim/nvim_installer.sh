#!/bin/bash
echo "Installing vim-plug"
sleep 2
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "Vim Plug is installed"
mkdir -p /home/$(whoami)/.config
mkdir -p /home/$(whoami)/.config/nvim
curl https://raw.githubusercontent.com/MrDisguised/config/main/nvim/init.nvim > /home/$(whoami)/.config/nvim/init.nvim
echo "All done :)"
echo "PLEASE MAKE SURE TO OPEN /home/username/.config/nvim/init.nvim and run :PlugInstall"
