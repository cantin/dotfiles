HISTFILESIZE=5000
export HISTSIZE=5000

export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/share/npm/bin:$PATH" #add bower, grunt for node js

export LANG=zh_CN.UTF-8
export LC_CTYPE=C
export LC_ALL=en_US.UTF-8

export EDITOR=mvim
export PS1="\u:\W\$ "

alias bc='bundle exec'
alias ctags="`brew --prefix`/bin/ctags"
alias gitlogp="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(blue)- %an, %ar%Creset' --abbrev-commit --all --decorate"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
