#!/bin/bash

echo "Installing Applications:\n\tVim\n\tGit"
apt install -y vim git


ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.bashrc ~/.bashrc
ln -s $(pwd)/.gitconfig ~/.gitconfig
