#!/bin/bash

linebar() {
  for a in {1..35}; do echo -n =; done
}

cd ~
echo -e "Updating System\n"
linebar
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

linebar
echo -e "Installing Programs\n"
linebar
sudo apt install -y curl tmux git vim

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
echo -e "\nRun command 'lazygit --version' to check version."

# VIM-PLUG
cd ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# yazi
sudo snap install yazi --clasic

linebar
echo -e "\nGenerating Symbolic Links:"
linebar

cd ~
CONFIG_DIR="./.dotfile"
##### VIMRC #####
FILE_VIM=".vimrc"
echo -e "\n======= Vimrc Link ======="
if [ -f "$FILE_VIM" ]; then
  {
    rm $FILE_VIM
    ln -s $CONFIG_DIR/$FILE_VIM $FILE_VIM
    echo "Deleted $FILE_VIM and Relinked"
  }
else
  {
    ln -s $CONFIG_DIR/$FILE_VIM $FILE_VIM
    echo "Linked $FILE_VIM"
  }
fi

##### GIT CONFIG #####
FILE_GIT=".gitconfig"
echo -e "======= Git Config Link ======="
if [ -f "$FILE_GIT" ]; then
  {
    rm $FILE_GIT
    ln -s $CONFIG_DIR/$FILE_GIT $FILE_GIT
    echo "Deleted $FILE_GIT and Relinked"
  }
else
  {
    ln -s $CONFIG_DIR/$FILE_GIT $FILE_GIT
    echo "Linked $FILE_GIT"
  }
fi

##### BASHRC #####
FILE_BASH=".bashrc"
echo -e "======= Bashrc Link ======="
if [ -f "$FILE_BASH" ]; then
  {
    rm $FILE_BASH
    ln -s $CONFIG_DIR/.bashrc-ubuntu $FILE_BASH
    echo "Deleted $FILE_BASH and Relinked"
  }
else
  {
    ln -s $CONFIG_DIR/.bashrc-ubuntu $FILE_BASH
    echo "Linked $FILE_BASH"
  }
fi
source $FILE_BASH

linebar
echo -e "\nRun :PlugInstall in vim"
