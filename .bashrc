# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=200000

HISTTIMEFORMAT='%d/%m/%y %T '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#=====================================================================
#			MY BASH FILE
#=====================================================================

shopt -s autocd
shopt -s histappend

export HISTSIZE=5000
export HISTFILESIZE=10000
txtcyn='\[\e[4;36m\]'
txtgrn='\[\e[4;32m\]'
txtylw='\e[1;33m'
bldblu='\[\e[1m\e[4;34m\]'
tc='\[\e[0m\]'
brk='\[\e[1;33m\]'

LS_COLORS=$LS_COLORS:'di=1;32:fi=0;36:ln=0;97:' ; export LS_COLORS

neofetch

CODENAME=$(lsb_release -cs)
#=====================================================================
#		 SOURCE	
#=====================================================================

# echo -e "\tCurrent Distribution: $CODENAME"
# if [ "$CODENAME" == 'bionic' ] && [ "$WSL_DISTRO_NAME" == 'Ubuntu-OpenPCDet' ]; then
#     echo -e "\tSourcing ROS Melodic"
#     source /opt/ros/melodic/setup.bash
# else
# 	echo -e "\tDid not source ROS for $CODENAME"
# fi
# echo -e "=============================================\n"

#=====================================================================
#			EXPORTS	
#=====================================================================


export EDITOR="vim"

if [ "$CODENAME" == 'melodic' ] || [ "$CODENAME" == 'bionic' ]; then
	export LIBGL_ALWAYS_INDIRECT=0
	export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
fi

function cuda117 () {
  echo 'Sourced CUDA 11.7 libraries'
  export PATH=/usr/local/cuda-11.7/bin${PATH:+:${PATH}}
  export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
  export CUDA_HOME=/usr/local/cuda-11.7
}
function cuda111 () {
  echo 'Sourced CUDA 11.1 libraries'
  export PATH=/usr/local/cuda-11.1/bin${PATH:+:${PATH}}
  export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
  export CUDA_HOME=/usr/local/cuda-11.1
}
function numbacuda() {
  export LD_LIBRARY_PATH="/usr/lib/wsl/lib/"
  export NUMBA_CUDA_DRIVER="/usr/lib/wsl/lib/libcuda.so.1"
}
function dnumbacuda() {
  export LD_LIBRARY_PATH="/usr/lib/x86_64-linux-gnu/"
  export NUMBA_CUDA_DRIVER="/usr/lib/x86_64-linux-gnu/libcuda.so.1"
}
function hype() {
    source activate vc2
    echo 'Activated Conda Environment'

    cuda111

    numbacuda
    echo 'Setup NUMBA CUDA libraries'

    # Exports for OpenGl for me to be able to use Open3d Visualization Tools
    # References:
        # https://github.com/isl-org/Open3D/issues/4429
        # https://github.com/isl-org/Open3D/issues/2836
    export LIBGL_ALWAYS_INDIRECT=0
    export MESA_GL_VERSION_OVERRIDE=4.5
    export MESA_GLSL_VERSION_OVERRIDE=450
    export LIBGL_ALWAYS_SOFTWARE=1

    cd ~/HybridCP/
}
function dhype() {
    conda activate vc2
    echo 'Activated Conda Environment'

    cuda111

    dnumbacuda
    echo 'Setup NUMBA CUDA libraries'

    # Exports for OpenGl for me to be able to use Open3d Visualization Tools
    # References:
        # https://github.com/isl-org/Open3D/issues/4429
        # https://github.com/isl-org/Open3D/issues/2836
    export LIBGL_ALWAYS_INDIRECT=0
    export MESA_GL_VERSION_OVERRIDE=4.5
    export MESA_GLSL_VERSION_OVERRIDE=450
    export LIBGL_ALWAYS_SOFTWARE=1

    cd ~/HybridCP/
}
function jek() {
    # source activate website
    # echo  'Activate Conda Environment'
    cd $HOME/dwc13.github.io

    # Ruby Gems install to ~/gems
    export GEM_HOME="$HOME/gems"
    export PATH="$HOME/gemsbin:$PATH"
    echo  'Export GEM Paths'
}

#=====================================================================
#			ALIASES	
#=====================================================================

alias l="ls -la"
alias vr="vim ~/.vimrc"
alias br="vim ~/.bashrc"

alias tm="~/.dotfile/3wintmux.sh"

# GIT
# ------------
alias stat="git status"
alias gc="git commit -m "$1""
alias gl="git log --reverse"

# NOTES
# ------------
# alias note="vim ./$(date +%d-%m-%y)-notes.md"
# alias notes="cd ~/dwc-notes && vim ./index.md"
# alias notes="cd /mnt/z/notes && obsidian"
# alias notes="cd /mnt/z/notes && vim ."
# alias fire="/mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe"
# alias edge="/mnt/c/Program\ Files\ \(x86\)/Microsoft/Edge/Application/msedge.exe"

#=====================================================================
#			FUNCTIONS	
#=====================================================================

function mkcd () {
    mkdir -p $1 && cd $1
}

# ISSUE DBUS when openning some programs
# ------------
# Found dbus error fix on WSL GitHub https://github.com/microsoft/WSL/issues/7915
# function export_dbus () {
#     # export DISPLAY=$(hostname -I):0
#     service dbus start
#     export XDG_RUNTIME_DIR=/run/user/$(id -u)
#     sudo mkdir $XDG_RUNTIME_DIR
#     sudo chmod 700 $XDG_RUNTIME_DIR
#     sudo chown $(id -un):$(id -gn) $XDG_RUNTIME_DIR
#     export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/bus
#     dbus-daemon --session --address=$DBUS_SESSION_BUS_ADDRESS --nofork --nopidfile --syslog-only &
# }

# To Open PDF in Window's Firefox
# alias wsl-pdf="fire file://///wsl$/Ubuntu-22.04/home/dom/"$1""
# alias wsl-pdf="fire file://///wsl$/Ubuntu-22.04/$(ppwd)/"$1""
# function wsl-pdf () {
#     echo "Attempting to open file in Windows Firefox: path > file://///wsl$/Ubuntu-$(lsb_release -rs)$(ppwd)/$1"
#     $(fire file://///wsl$/Ubuntu-$(lsb_release -rs)/$(ppwd)/$1)
# }

# To Open Notes in Window's Firefox
# alias wnotes="cd ~/dwc-notes/site_html && falkon ./index.html &"
# alias wnotes="cd ~/dwc-notes/site_html && /mnt/c/Program\ Files/Mozilla\ Firefox/firefox.exe $(ppwd)/index.html"
# function wnotes () {
#     echo "Attempting to open notes in Window's Firefox.\nPath > file://///wsl$/Ubuntu-$(lsb_release -rs)/home/dom/dwc-notes/site_html/index.html"
#     $(fire file://///wsl$/Ubuntu-$(lsb_release -rs)/home/dom/dwc-notes/site_html/index.html)
# }

#=====================================================================
#		    ANACONDA SETUP
#=====================================================================

source /home/dom/anaconda3/bin/activate  # commented out by conda initialize

#=====================================================================
#		    START PS	
#=====================================================================

PS1="$tc[\A] $brk\u$tc: $txtcyn\w$tc $ "


