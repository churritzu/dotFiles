# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
alias ls='lsd'
alias vim="nvim"
alias oldvim="vim"
alias kssh="kitten ssh"
alias cat="bat"
# alias ytfzf="ytfzf -t -T chafa --sort --thumbnail-quality=maxres "

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# Android Emulator
export LD_LIBRARY_PATH=/usr/lib64/vulkan:$LD_LIBRARY_PATH
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ICONS
UBUNTU_ICON=$'\uf30a'
FOLDER_ICON=$'\uE5FE'
GIT_ICON=$'\uE725'
RIGHT_ARROW=$'\uE0B0'

# COLORES 
COLOR_RESET='\e[m'
COLORFG_NEGRO='\e[0;30m'
COLORFG_BLANCO='\e[0;97m'
COLORFG_LIGHTGRAY='\e[38;5;239m'
COLORFG_AMARILLO='\e[0;33m'
COLORFG_BLUE='\e[0;34m'

COLORBG_AMARILLO='\e[43m'
COLORBG_LIGHTGRAY='\e[48;5;239m'
COLORBG_BLUE='\e[44m'

# GIT Function
BRANCH=""
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e "s/*/$GIT_ICON/"
}
get_branch(){
    BRANCH=$(parse_git_branch)
    NO_EXISTE="$COLORFG_AMARILLO$RIGHT_ARROW$COLOR_RESET"
    EXISTE="$COLORFG_AMARILLO$COLORBG_BLUE$RIGHT_ARROW $COLORFG_BLANCO$COLORBG_BLUE$BRANCH $COLOR_RESET$COLORFG_BLUE$RIGHT_ARROW$COLOR_RESET"
    [ -z "$BRANCH" ] && BRANCH="$NO_EXISTE" || BRANCH="$EXISTE"
    echo -e "$BRANCH"
}
# export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ $RIGHT_ARROW "
export PS1="\n$COLORFG_NEGRO$COLORBG_AMARILLO $FOLDER_ICON \w $COLOR_RESET\$(get_branch)\n$COLORFG_BLANCO$COLORBG_LIGHTGRAY $UBUNTU_ICON \u@\h $COLOR_RESET$COLORFG_LIGHTGRAY$RIGHT_ARROW$COLOR_RESET"

# Own Vars
TERMINAL=/usr/bin/kitty

export TERM=xterm-256color

# If this is an Xterm set TERM to xterm-kitty
# [ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

eval "$(zoxide init --cmd cd bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# System Information
neofetch

