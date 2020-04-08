#!/bin/bash
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gpr='git pull --rebase'
alias gphm='git push heroku master'
alias gp='git push'
alias gdc='git diff --cached'
alias gpf='git push --force-with-lease'
alias h='history'
alias be='bundle exec'
alias bec='bundle exec cucumber'
alias ber='bundle exec rspec'
alias :q="exit"
alias dew='docker exec iou-dev_webapp_1'
alias shipit='git push && gphm'
alias iou='cd ~/dev/iou-dev'
alias py='python3'
growl() { growlnotify -n 'Terminal' -m $1; }
