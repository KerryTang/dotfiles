DOTFILES=Tmux Vim
PROMPT = $(shell while [ -z "$$REPLY" ]; do \
			read -p "$(1) configuration file was detected. Do you want to overwrite?[y/N]: " REPLY; \
		done; echo $$REPLY;)

install: $(DOTFILES)
	@echo "Install Completed"

Tmux: ./tmux/.tmux.conf FORCE
ifneq ($(wildcard ~/.tmux.conf),)
	$(eval CONTINUE = $(call PROMPT,$@))
	@if [ $(CONTINUE) = "y" ]; then \
		echo "Overwrite .tmux.conf"; \
		ln -sf $(CURDIR)/tmux/.tmux.conf ~/.tmux.conf; \
	fi
else
	@echo "Create Link .tmux.conf"
	@ln -s $(CURDIR)/tmux/.tmux.conf ~/.tmux.conf
endif

Vim: ./vim/.vim ./vim/.vimrc FORCE
ifneq ($(wildcard ~/.vimrc)$(wildcard ~/.vim),)
	$(eval CONTINUE = $(call PROMPT,$@))
	@if [ $(CONTINUE) = "y" ]; then \
		echo "Overwrite .vim/"; \
		ln -sf $(CURDIR)/vim/.vim ~/.vim; \
		echo "Overwrite .vimrc"; \
		ln -sf $(CURDIR)/vim/.vimrc ~/.vimrc; \
	fi
else
	@echo "Create link .vim/"
	@ln -s $(CURDIR)/vim/.vim ~/.vim
	@echo "Create link .vimrc"
	@ln -s $(CURDIR)/vim/.vimrc ~/.vimrc
endif

FORCE:
