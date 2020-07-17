source $HOME/.config/env
export PATH=/usr/sbin:/usr/local/bin:$HOME/.local/bin:$HOME/sdk/$GO_SDK_VERSION/bin:$HOME/go/bin:$PATH
export PROJECTS="$HOME/projects"
export ZSH="$HOME/.oh-my-zsh"
export LANG=ru_RU.UTF-8
ZSH_THEME="robbyrussell"
EDITOR=neovim
export DISABLE_FZF_KEY_BINDINGS="false"
export DISABLE_FZF_AUTO_COMPLETION="false"
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
alias mfa="sudo mount -t cifs -o vers=2.0,user=$ARCHIVE_USER,password=$ARCHIVE_PASS,file_mode=0777,dir_mode=0777 //$ARCHIVE_HOST/archive $HOME/mnt/archive"
alias ufa="sudo umount $HOME/mnt/archive"
alias mhf="vmhgfs-fuse $HOME/mnt/host -o allow_other"
alias zshc="v $HOME/.zshrc"
alias cls="clear"
alias top="htop"
alias pk="cd $PROJECTS/k8s"
alias pg="cd $PROJECTS/go"
alias v="neovim"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
bindkey -M viins "jj" vi-cmd-mode

