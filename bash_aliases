#!/bin/bash
alias cde='cd ~/Projects/Corndog'
alias etl='cd ~/Projects/cde-etl'
alias gs='git status'
alias gc='git checkout'
alias gb='git branch'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gpr='git pull --rebase'
alias gphm='git push heroku master'
alias gp='git push'
alias h='history'
alias be='bundle exec'
alias gmim='mvim'
alias pairme='sh ~/User\ Scripts/pair_me_up.sh'
alias bec='bundle exec cucumber'
alias ber='bundle exec rspec'
alias unhitch='hitch -u'
alias jaz="phantomjs spec/javascripts/runner.coffee http://localhost:5555/jasmine | grep -h -B3 -A1 '\(failures\|\"passed\": false\|messages\)'"
alias zcu="zeus cucumber"
alias zr="zeus test"
alias zc="zeus console"
alias zs="zeus server"
alias zr="zeus rake"
alias :q="exit"
alias tac='tail -r'
growl() { growlnotify -n 'Terminal' -m $1; }
