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
alias mfa="sudo mount -t fuse.sshfs -o allow_other,default_permissions rpi:/media/pi $HOME/mnt/rpi"
alias ufa="sudo umount $HOME/mnt/rpi"
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

# The next line updates PATH for Yandex Cloud CLI.
if [ -f '/home/mksm/yandex-cloud/path.bash.inc' ]; then source '/home/mksm/yandex-cloud/path.bash.inc'; fi

# The next line enables shell command completion for yc.
if [ -f '/home/mksm/yandex-cloud/completion.zsh.inc' ]; then source '/home/mksm/yandex-cloud/completion.zsh.inc'; fi

