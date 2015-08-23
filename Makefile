DOTFILES=tmux vim

install: $(DOTFILES)
	@echo "Install Completed"
tmux: ./tmux/.tmux.conf FORCE
	@echo "Create Link .tmux.conf"
	@ln -sf $(CURDIR)/tmux/.tmux.conf ~/.tmux.conf
vim: ./vim/.vim ./vim/.vimrc FORCE
	@echo "Create Link .vim/"
	@ln -sf $(CURDIR)/vim/.vim ~/.vim
	@echo "Create Link .vimrc"
	@ln -sf $(CURDIR)/vim/.vimrc ~/.vimrc
FORCE:
