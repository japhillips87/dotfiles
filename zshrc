source ~/.git-prompt.sh
source ~/.aliases

precmd () { __git_ps1 "%F{red}%n %F{green}%~%F{yellow}" " %F{cyan}$ %F{white}" " (%s)" }
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_HIDE_IF_PWD_IGNORED=true

if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

export PATH=$HOME.rbenv/shims:/usr/local/bin:/usr/local/opt/mysql@5.6/bin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export HISTCONTROL=ignoredups

# searches for given string in filenames in current and all subdirectories
function s { find . -nowarn -name "*$1*" 2>/dev/null; }
# searches for given filename exactly in current and all subdirectories
function ss { find . -nowarn -name "$1" 2>/dev/null; }

ssh-add -K > /dev/null 2>&1

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

eval "$(rbenv init -)"

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
CASE_SENSITIVE="false"

autoload -Uz compinit && compinit

# delete this if non-linux install
synergys
