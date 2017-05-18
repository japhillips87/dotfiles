#!/bin/bash

source ~/.bash_aliases
#source git_prompt
#source git-completion.bash
#source git-flow-completion.bash

# Set git autocompletion and PS1 integration
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

GIT_PS1_SHOWDIRTYSTATE=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export PATH=/usr/local/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HISTCONTROL=ignoredups
export PM_CHEF="~/pm_chef"
export LAND_REPO="~/landing"
export MGMT_REPO="~/mgmt"
export PATH=/opt/chefdk/bin:$PATH

PS1='\[\e[0;91m\]\u\[\e[m\] \[\e[0;92m\]\w\[\e[m\]\[\e[0;93m\]$(__git_ps1)\[\033[00m\] \[\e[0;96m\]\$ \[\e[m\]\[\e[0;97m\]'

PROMPT_COMMAND='update_terminal_cwd; echo -ne "\033]0; ${PWD##*/}\007"'

export PATH=$HOME/bin:$HOME/xbin:$PATH:$HOME/phantomjs/bin:$PATH:$HOME/.rvm/bin:/usr/local/share/npm/bin
export PATH=$HOME/local/bin:$PATH

# searches for given string in filenames in current and all subdirectories
function s { find . -nowarn -name "*$1*" 2>/dev/null; }
# searches for given filename exactly in current and all subdirectories
function ss { find . -nowarn -name "$1" 2>/dev/null; }

export EDITOR=/usr/local/bin/mvim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

ssh-add -K > /dev/null 2>&1
