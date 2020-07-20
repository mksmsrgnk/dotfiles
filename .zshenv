HISTSIZE=1000
SAVEHIST=1000
ZSH_THEME="robbyrussell"
EDITOR=vim
export PROJECTS="$HOME/projects"
export ZSH="$HOME/.oh-my-zsh"
export LANG=ru_RU.UTF-8
export DISABLE_FZF_KEY_BINDINGS="false"
export DISABLE_FZF_AUTO_COMPLETION="false"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
path+=$HOME/go/bin
path+=$HOME/.local/bin
typeset -U path
