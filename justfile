link:
	ln -sf $PWD/zsh/.zshrc ~/.zshrc
	ln -sf $PWD/git/.gitconfig ~/.gitconfig
	ln -sf $PWD/nvim ~/.config/nvim

keyd:
	cp $PWD/keyd/default.conf /etc/keyd/default.conf
