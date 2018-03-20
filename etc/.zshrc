# Open X server when logging in to tty1, tmux on tty2, 256 color tmux in urxvt
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx

elif [[ $(tty) = /dev/tty2 ]] ; then
	sudo setfont ter-214n
	tmux
fi

# The following fixes the libswmhackso.0.0 cannot be preloaded problem
# LD_PRELOAD="/usr/lib/libswmhack.so.0.0"
export SUDO_EDITOR="$(which vim)"

# Set PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl:$PATH
export PATH=$HOME/usr/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# support colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Set theme
autoload -U colors && colors

source ~/.ryry.zsh-theme

# Set history

HISTSIZE=10000
SAVEHIST=9000
HISTFILE=~/.zsh_history

# Load the rest of the options
source ~/.zshopts 	# Source options
source ~/.zshkeys	# Source keybindings
source ~/.zshalias 	# Source aliases
source ~/.zshfunc	# Source functions
source ~/.zshcomp	# Source completions
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/usr/bin/rdir.sh ] &&  source rdir.sh
[ -f ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&
        source ~/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh &&
        source ~/.zshhigh

[ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] &&
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh &&
        source ~/.zshhigh

# Change LS colors
[ -f ~/.dircolors ] &&
eval $(dircolors ~/.dircolors -b)
