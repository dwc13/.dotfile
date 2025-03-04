#!/bin/bash

# UPDATE AND INSTALL PROGRAMS
# ================================================================
cd ~
echo -e "Updating System\n"
for a in {1..35}; do echo -n =; done
sudo pacman -Syu
echo -e "Installing Programs\n"
sudo pacman -Sy curl tmux git pdftk gnupg yazi ffmpeg p7zip \
    jq poppler fd ripgrep fzf zoxide imagemagick vim lazygit \
    evince shotwell pdftk screenfetch waybar
sudo pacman -S --needed base-devel
sudo pacman -Sy discord firefox

# YAY
# ================================================================
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay --version
cd ~

yay -S tofi

# VIM-PLUG
# ================================================================
for a in {1..35}; do echo -n =; done
echo -e "\nRunning curl for vim-plug, make sure to run :PlugInstall in vim\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# FOR JEKYLL UNCOMMENT LINE BELOW
# ================================================================
# echo -e "Installing Jekyll and GEMs"
# sudo pacman -S ruby base-devel
# sudo gem install --silent vimwiki_markdown jekyll bundler

# SYMLINK FILES
# ================================================================
for a in {1..35}; do echo -n =; done
echo -e "\nGenerating Symbolic Links:"

HOME="/home/dom"
##### VIMRC #####
FILE_VIM="/home/dom/.vimrc"
echo -e "\n======= Vimrc Link ======="
if [ -f "$FILE_VIM" ]; then {
	rm $FILE_VIM
	ln -s $HOME/.dotfile/.vimrc $FILE_VIM
	echo "Deleted $FILE_VIM and Relinked"
}
else {
	ln -s $HOME/.dotfile/.vimrc $FILE_VIM
	echo "Linked $FILE_VIM"
}
fi	

##### GIT CONFIG #####
FILE_GIT="/home/dom/.gitconfig"
echo -e "======= Git Config Link ======="
if [ -f "$FILE_GIT" ]; then {
	rm $FILE_GIT
	ln -s $HOME/.dotfile/gitconfig $FILE_GIT
	echo "Deleted $FILE_GIT and Relinked"
}
else {
	ln -s $HOME/.dotfile/.gitconfig $FILE_GIT
	echo "Linked $FILE_GIT"
}
fi	

##### BASHRC #####
FILE_BASH="/home/dom/.bashrc"
echo -e "======= Bashrc Link ======="
if [ -f "$FILE_BASH" ]; then {
	rm $FILE_BASH
	ln -s $HOME/.dotfile/.bashrc-arch $FILE_BASH
	echo "Deleted $FILE_BASH and Relinked"
}
else {
	ln -s $HOME/.dotfile/.bashrc-arch $FILE_BASH
	echo "Linked $FILE_BASH"
}
fi	
source $FILE_BASH

echo -e "\nMAKE SURE TO MOVE CONFIG FOLDERS FROM .dotfile/arch-config TO CONFIG DIRECTORY\n"
echo -e "\nFOR JEKYLL OR ANDROID-STUDIO GOT TO https://developer.android.com/studio\n"

