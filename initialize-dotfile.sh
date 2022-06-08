#!/bin/bash

echo -e "Installing Applications:\n\tVim\n\tDocker"
for a in {1..35}; do echo -n =; done
echo -e "\n"
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y vim docker

# Install Flatpak
# apt install -y flatpak
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo -e "\nGenerating Symbolic Links:"
for a in {1..35}; do echo -n =; done

FILE_VIM="/home/dom/.vimrc"
echo -e "\n======= Vimrc Link ======="
if [ -f "$FILE_VIM" ]; then {
	rm $FILE_VIM
	ln -s $(pwd)/.vimrc $FILE_VIM
	echo "Deleted $FILE_VIM and Relinked"
}
else {
	ln -s $(pwd)/.vimrc $FILE_VIM
	echo "Linked $FILE_VIM"
}
fi	

FILE_BASH="/home/dom/.bashrc"
echo -e "======= Bashrc Link ======="
if [ -f "$FILE_BASH" ]; then {
	rm $FILE_BASH
	ln -s $(pwd)/.bashrc $FILE_BASH
	echo "Deleted $FILE_BASH and Relinked"
}
else {
	ln -s $(pwd)/.bashrc $FILE_BASH
	echo "Linked $FILE_BASH"
}
fi	

FILE_GIT="/home/dom/.gitconfig"
echo -e "======= Git Config Link ======="
if [ -f "$FILE_GIT" ]; then {
	rm $FILE_GIT
	ln -s $(pwd)/.gitconfig $FILE_GIT
	echo "Deleted $FILE_GIT and Relinked"
}
else {
	ln -s $(pwd)/.gitconfig $FILE_GIT
	echo "Linked $FILE_GIT"
}
fi	

source $FILE_BASH
