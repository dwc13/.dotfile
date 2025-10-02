#!/bin/bash

linebar() {
  for a in {1..35}; do echo -n =; done
}

cd ~
echo -e "Updating System\n"
linebar
sudo pacman -Syu
sudo pacman -Sy cosmic

echo -e "Installing Programs\n"
linebar
sudo pacman -Sy curl tmux git yazi tree \
  ripgrep fzf vim lazygit neovim \
  evince shotwell fastfetch vivaldi \
  bitwarden kwallet kwalletmanager kwallet-pam \
  ghostty rofi code \
  networkmanager networkmanager-openconnect openconnect
sudo pacman -S python3 python-pip
sudo pacman -S --needed git base-devel yay
sudo pacman -S linux-headers

git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

yay -Sy opencode displaylink code-features

echo -e "\nGenerating Symbolic Links:"
linebar

cd ~
CONFIG_DIR="./.dotfile"
##### NEOVIM CONFIG #####

##### GIT CONFIG #####
FILE_GIT=".gitconfig"
echo -e "\n======= Git Config Link ======="
if [ -f "$FILE_GIT" ]; then
  {
    rm $FILE_GIT
    ln -s $CONFIG_DIR/.gitconfig $FILE_GIT
    echo "Deleted $FILE_GIT and Relinked"
  }
else
  {
    ln -s $CONFIG_DIR/.gitconfig $FILE_GIT
    echo "Linked $FILE_GIT"
  }
fi

##### BASHRC #####
FILE_BASH=".bashrc"
echo -e "======= Bashrc Link ======="
if [ -f "$FILE_BASH" ]; then
  {
    rm $FILE_BASH
    ln -s $CONFIG_DIR/.bashrc-arch $FILE_BASH
    echo "Deleted $FILE_BASH and Relinked"
  }
else
  {
    ln -s $CONFIG_DIR/.bashrc-arch $FILE_BASH
    echo "Linked $FILE_BASH"
  }
fi
source $FILE_BASH

linebar
cp -r $CONFIG_DIR/arch-config/* .config/
echo -e '\nCopy Config folder'
