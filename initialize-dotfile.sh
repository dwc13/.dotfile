#!/bin/bash

echo -e "Updating System\n"
for a in {1..35}; do echo -n =; done

sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

sudo apt install -y neofetch curl tmux

# FOR JEKYLL UNCOMMENT LINE BELOW
# ================================================================
# sudo apt install -y ruby-full build-essential zlib1g-dev


# ================================================================
# for a in {1..35}; do echo -n =; done
# echo -e "\nInstalling GEMs -> vimwiki_markdown jekyll bundler"
# sudo gem install --silent vimwiki_markdown jekyll bundler


# ================================================================
for a in {1..35}; do echo -n =; done
echo -e "\nRunning curl for vim-plug, make sure to run :PlugInstall in vim\n"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# ================================================================
for a in {1..35}; do echo -n =; done
echo -e "\nGenerating Symbolic Links:"
for a in {1..35}; do echo -n =; done


# ================================================================
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


# ================================================================
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


# ================================================================
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


# ================================================================
FILE_NEO="/home/dom/.config/neofetch/config.conf"
echo -e "======= Neofetch Config Link ======="
if [ -d "/home/dom/.config/neofetch" ]; then 
    # DIRECTORY EXISTS
    if [ -f "$FILE_NEO" ]; then {
        rm $FILE_NEO
        ln -s $(pwd)/neo.conf $FILE_NEO
        echo "Deleted and Relinked Neofetch conf"
    }
    else {
        ln -s $(pwd)/neo.conf $FILE_NEO
        echo "Linked Neofetch conf"
    }
    fi
else 
    # DIRECTORY DOES NOT EXIST
    mkdir -p /home/dom/.config/neofetch
    ln -s $(pwd)/neo.conf $FILE_NEO
    echo "Linked Neofetch conf"
fi	


# ================================================================
source $FILE_BASH
# ================================================================
