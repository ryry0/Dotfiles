dir=$(pwd)
# dotfiles directory olddir=~/dotfiles_old
# old dotfiles backup directory
files=".bashrc .vimrc .vim .Xresources .crawlrc .fehbg .ryry.zsh-theme .spectrwm.conf .tmux.conf .xinitrc .zshalias"        # list of files/folders to symlink in homedir

for file in $files; do
    #echo "Moving any existing dotfiles from ~ to $olddir"
    #mv ~/$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done
