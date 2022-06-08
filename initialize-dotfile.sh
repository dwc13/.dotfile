#!/bin/bash

echo -e "Installing Applications:\n\tVim\n\tGit\nDocker"
for a in {1..35}; do echo -n =; done
echo -e "\n"  
sudo apt install -y vim git docker


echo -e "\nGenerating Symbolic Links:"
for a in {1..35}; do echo -n =; done

echo -e "\n======= Vimrc Link ======="
ln -s ~/.dotfile/.vimrc ~/.vimrc

echo -e "======= Bashrc Link ======="
ln -s ~/.dotfile/.bashrc ~/.bashrc

echo -e "======= Git Config Link ======="
ln -s ~/.dotfile/.gitconfig ~/.gitconfig

source ~/.bashrc
