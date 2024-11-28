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

# Alias
alias ls='lsd'
alias vim="nvim"
alias oldvim="vim"
alias kssh="kitten ssh"
alias cat="bat"

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

# Folder themporal para nix.
export TMPDIR=/tmp/nix-tmp

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(zoxide init --cmd cd bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

