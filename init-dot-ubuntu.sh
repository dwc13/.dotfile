#!/bin/bash

# UPDAT AND INSTALL PROGRAMS
# ================================================================
echo -e "Updating System\n"
for a in {1..35}; do echo -n =; done

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y
sudo apt install -y curl tmux git 

# VIM-PLUG 
# ================================================================
for a in {1..35}; do echo -n =; done
echo -e "\nRunning curl for vim-plug, make sure to run :PlugInstall in vim\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# FOR JEKYLL UNCOMMENT LINE BELOW
# ================================================================
# echo -e "\nInstalling Jekyll and GEMs"
# sudo apt install -y ruby-full build-essential zlib1g-dev
# sudo gem install --silent vimwiki_markdown jekyll bundler

# FOR LAZYGIT
# ================================================================
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
echo -e "\nRun command 'lazygit --version' to check version."


# SYMLINK FILES
# ================================================================
for a in {1..35}; do echo -n =; done
echo -e "\nGenerating Symbolic Links:"

##### VIMRC ##### 
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

##### GIT CONFIG ##### 
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

##### BASHRC ##### 
FILE_BASH="/home/dom/.bashrc"
echo -e "======= Bashrc Link ======="
if [ -f "$FILE_BASH" ]; then {
	rm $FILE_BASH
	ln -s $(pwd)/.bashrc-ubuntu $FILE_BASH
	echo "Deleted $FILE_BASH and Relinked"
}
else {
	ln -s $(pwd)/.bashrc-ubuntu $FILE_BASH
	echo "Linked $FILE_BASH"
}
fi	
source $FILE_BASH
