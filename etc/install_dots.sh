dir=$(pwd)
# dotfiles directory
olddir=~/.dotfiles_old
# old dotfiles backup directory
# list of files/folders to symlink in homedir
files=".bashrc .vimrc .vim .crawlrc \
.spectrwm.conf .tmux.conf .juliarc.jl \
.zshalias .zshcomp .zshfunc .zshkeys .zshopts .zshrc .ryry.zsh-theme .zshhigh \
.xinitrc .Xresources .mirrorboard.xkb .tips .metacaps.xkb .themes.d \
.fehbg.sh .muttrc .dircolors .gitconfig"

echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    mv -v ~/$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/$file
done

echo "Installing vim directories"
install -dv ~/.temp/bak
install -dv ~/.temp/swp

ln -s ~/usr/conf.d/hyprland.conf ~/.config/hypr/hyprland.conf
ln -s ~/usr/conf.d/hypridle.conf ~/.config/hypr/hypridle.conf
ln -s ~/usr/conf.d/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

ln -s ~/usr/conf.d/foot.ini ~/.config/foot/foot.ini

ln -s ~/usr/conf.d/dunstrc ~/.config/dunst/dunstrc

ln -s ~/usr/conf.d/wofi/config ~/.config/wofi/config
ln -s ~/usr/conf.d/wofi/style.css ~/.config/wofi/style.css

ln -s ~/usr/conf.d/cava/config ~/.config/cava/config

ln -s ~/usr/conf.d/waybar/config ~/.config/waybar/config
ln -s ~/usr/conf.d/waybar/style.css ~/.config/waybar/style.css

ln -s ~/usr/conf.d/wlogout ~/.config/wlogout
ln -s ~/usr/conf.d/nvim ~/.config/nvim
