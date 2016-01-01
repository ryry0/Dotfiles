dir=$(pwd)
# dotfiles directory olddir=~/dotfiles_old
# old dotfiles backup directory
# list of files/folders to symlink in homedir
files=".bashrc .vimrc .vim .crawlrc \
.spectrwm.conf .tmux.conf .juliarc.jl \
.zshalias .zshcomp .zshfunc .zshkeys .zshopts .zshrc .ryry.zsh-theme \
.xinitrc .Xresources .mirrorboard.xkb .tips"

for file in $files; do
    #echo "Moving any existing dotfiles from ~ to $olddir"
    #mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done