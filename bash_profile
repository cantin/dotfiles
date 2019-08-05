HISTFILESIZE=5000
export HISTSIZE=5000

export PATH="$PATH:/usr/local/share/npm/bin" #add npm global bin
export PATH="$PATH:./bin" #add current directory bin

export LANG=zh_CN.UTF-8
export LC_CTYPE=C
export LC_ALL=en_US.UTF-8

export EDITOR=mvim
export GIT_EDITOR=vim
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

#gurobi
export GRB_LICENSE_FILE="/Users/Cantin/WorkSpace/gurobi.lic"

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash

  # Add git completion to aliases
  __git_complete gco _git_checkout
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias f="fzf"
export FZF_DEFAULT_COMMAND='ag -l'
#export FZF_DEFAULT_OPTS="--height=70% --reverse --inline-info --preview 'head -200 {} 2>/dev/null' --preview-window=right:60%:wrap -m --bind='ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy)'"
#export FZF_CTRL_T_OPTS="-m --preview 'head -200 {} 2>/dev/null'"

export FZF_DEFAULT_OPTS="--height=70% --reverse --inline-info -m --preview 'head -200 {} 2>/dev/null' --preview-window 'right:hidden:wrap' --bind 'ctrl-o:toggle-preview,ctrl-f:half-page-down,ctrl-b:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_CTRL_T_OPTS="-m --preview 'head -200 {} 2>/dev/null'"

bind -x '"\C-g":"fg"'
bind -x '"\C-xf":"fg"'
bind -x '"\C-xj":"jobs"'
bind -x '"\C-xk":"kill %1"'
bind -x '"\C-xb":"bg"'

psall() {
  ps aux | grep "${1}" | grep -v "grep"
}

killbyname() {
  psall $1 | awk '{print $2}' | xargs kill $2
}


export GOPATH=$HOME/Workspace/gocode
