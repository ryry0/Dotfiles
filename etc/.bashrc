#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export PATH=/home/ryan/Dropbox/Programming/etc/bin:$PATH
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/.zshalias
