setopt histignorealldups sharehistory
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
alias mfa="sudo mount -t cifs -o vers=2.0,user=guest,password=,file_mode=0777,dir_mode=0777 //fileserver/archive $HOME/mnt/archive"
alias ufa="sudo umount $HOME/mnt/archive"
alias mhf="vmhgfs-fuse $HOME/mnt/host -o allow_other"
alias zshcfg="v $HOME/.zshrc"
alias cls="clear"
alias top="htop"
alias kp="cd $PROJECTS/k8s"
alias gp="cd $PROJECTS/go"
alias dp="cd $PROJECTS/docker"
alias v="nvr"
alias config="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias h="/usr/sbin/helm"
alias ccp="kubectl config use-context kubernetes-admin@kubernetes"
alias cct="kubectl config use-context minikube"
