# Open X server when logging in to tty1, tmux on tty2, 256 color tmux in urxvt
if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx

elif [[ $(tty) = /dev/tty2 ]] ; then
	sudo setfont ter-214n
	tmux

elif [[ $TERM = "rxvt-unicode-256color" ]] ; then
	exec tmux -2
fi

# The following fixes the libswmhackso.0.0 cannot be preloaded problem
LD_PRELOAD="/usr/lib/libswmhack.so.0.0"

# Set PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/bin/core_perl
export PATH=/home/ryan/Dropbox/Programming/etc/bin:$PATH

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
