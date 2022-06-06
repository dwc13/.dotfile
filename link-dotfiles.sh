#!/bin/bash

echo -e "Installing Applications:\n\tVim\n\tGit"
for a in {1..35}; do echo -n =; done
echo -e "\n"  
apt install -y vim git


echo -e "\nGenerating Symbolic Links:"
for a in {1..35}; do echo -n =; done

echo -e "\n======= Vimrc Link ======="
ln -s $(pwd)/.vimrc ~/.vimrc

echo -e "======= Bashrc Link ======="
ln -s $(pwd)/.bashrc ~/.bashrc

echo -e "======= Git Config Link ======="
ln -s $(pwd)/.gitconfig ~/.gitconfig
