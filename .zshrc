export PATH=$HOME/bin:/usr/sbin:/usr/local/bin:~/.local/bin:~/sdk/go1.14.6/bin:~/go/bin:$PATH
export ZSH='/home/mksm/.oh-my-zsh'
export LANG=ru_RU.UTF-8
ZSH_THEME='robbyrussell'
EDITOR=neovim
export DISABLE_FZF_KEY_BINDINGS='false'
export DISABLE_FZF_AUTO_COMPLETION='false'
plugins=(
	git
	vi-mode
	fzf
	debian
	kubectl
	helm
	gpg-agent
	zsh-completions
	zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
alias zshc='v $HOME/.zshrc'
alias cls='clear'
alias top='htop'
alias wnk='cd $HOME/dev/nurtelecom/k8s'
alias v="neovim"
alias mhfs='vmhgfs-fuse $HOME/mnt/ -o allow_other'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
bindkey -M viins 'jj' vi-cmd-mode

