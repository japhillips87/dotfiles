#!/bin/bash

source ~/.bash_aliases
#source git_prompt
#source git-completion.bash
#source git-flow-completion.bash

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export PATH=$HOME.rbenv/shims:/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HISTCONTROL=ignoredups
export PM_CHEF="~/pm_chef"
export LAND_REPO="~/landing"
export MGMT_REPO="~/mgmt"

PS1='\[\e[0;91m\]\u\[\e[m\] \[\e[0;92m\]\w\[\e[m\]\[\e[0;93m\]$(__git_ps1)\[\033[00m\] \[\e[0;96m\]\$ \[\e[m\]\[\e[0;97m\]'

# searches for given string in filenames in current and all subdirectories
function s { find . -nowarn -name "*$1*" 2>/dev/null; }
# searches for given filename exactly in current and all subdirectories
function ss { find . -nowarn -name "$1" 2>/dev/null; }

export EDITOR=/usr/local/bin/code

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

ssh-add -K > /dev/null 2>&1

bind "set completion-ignore-case on"

eval "$(rbenv init -)"
export PATH="$(brew --prefix qt@5.5)/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"
