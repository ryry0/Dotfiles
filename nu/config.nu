# set editor
$env.config.buffer_editor = "/usr/bin/nvim"

# theming

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

# cargo aliases
alias cr = cargo run --
alias crr = cargo run --release --

# vi aliases
alias vi = nvim

# jobs
alias fg = job unfreeze

# commands

def mk [] {
    if not ("~/.marks" | path exists) {
        mkdir ~/.marks
    }

    let path = ([$nu.home-path ".marks" (pwd | path basename)] | path join)

    ln -sf (pwd) $path
}

def lm [] {
    ls -sl ~/.marks | select name target
}

def umk [link: string@"nu-complete marks"] {
    let path = ([$nu.home-path ".marks" $link] | path join)
    rm -i $path
}

def --env jp [link: string@"nu-complete marks"] {
    let path = ([$nu.home-path ".marks" $link] | path join)
    cd -P $path
}

def --env pr [link: string@"nu-complete marks"] {
    let path = ([$nu.home-path ".marks" $link] | path join)
    cd -P $path
    ^just project
}

def "nu-complete marks" [] {
    # seems like autocomplete must have a value and description column
    lm | rename value description
}

# config editor

def conf [target: string@"nu-complete conf"] {
    ^just -f ~/usr/justfile $target
}

def "nu-complete conf" [] {
    (^just -f ~/usr/justfile --dump --unstable --dump-format json | from json).recipes | transpose recipe data | flatten | where {|row| $row.private == false } | select recipe doc parameters | rename value description
}

# autocomplete for just
def "nu-complete just" [] {
    (^just --dump --unstable --dump-format json | from json).recipes | transpose recipe data | flatten | where {|row| $row.private == false } | select recipe doc parameters | rename value description
}

export extern "just" [
    ...recipe: string@"nu-complete just", # Recipe(s) to run, may be with argument(s)
]
