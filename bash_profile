HISTFILESIZE=5000
export HISTSIZE=5000

export PATH="$PATH:/usr/local/share/npm/bin" #add npm global bin
export PATH="$PATH:./bin" #add current directory bin

export LANG=zh_CN.UTF-8
export LC_CTYPE=C
export LC_ALL=en_US.UTF-8

export EDITOR=mvim
export PS1="\u:\W\$ "

alias bc='bundle exec'
alias ctags="`brew --prefix`/bin/ctags"

alias gd="git diff"
alias gdc="git diff --cached"
alias gs="git status"
alias gco="git checkout"
alias gitlogp="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(blue)- %an, %ar%Creset' --abbrev-commit --all --decorate"
alias gm="git show -s --format=%B"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash

  # Add git completion to aliases
  __git_complete gco _git_checkout
fi
