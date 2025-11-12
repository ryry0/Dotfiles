# set editor
$env.config.buffer_editor = "/usr/bin/nvim"

# remove banner
$env.config.show_banner = false

# git aliases
alias gs = git status

alias gd = git diff
alias gdc = git diff --cached
alias gdhh = git diff HEAD^ HEAD

alias ga = git add
alias gau = git add -u

alias gc = git commit
alias glg = git log --graph --all --decorate

alias gpo = git push origin
alias gpom = git push origin main

alias gfa = git fetch --all

# vi aliases
alias vi = nvim

# jobs
alias fg = job unfreeze
