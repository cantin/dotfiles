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

alias gdt="git difftool"
alias gdtc="git difftool --cached"
alias gd="git diff"
alias gdc="git diff --cached"
alias gs="git status"
alias gco="git checkout"
alias ga="git add"
alias gp="git pull"
alias gpo='branch=$(git rev-parse --abbrev-ref HEAD); echo "git push origin $branch"; git push origin $branch'
alias gitlogp="git log --graph --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(blue)- %an, %ar%Creset' --abbrev-commit --all --decorate"
alias gitlogs="git log --pretty=format:'[%h] %ae, %ar: %s' --stat"
alias gm="git show -s --format=%B"
alias gdd="git diff > diff"
alias gdcd="gdc > diff"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash

  # Add git completion to aliases
  __git_complete gco _git_checkout
fi

# Script installed by fzf install
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias f="fzf"
export FZF_DEFAULT_COMMAND='ag -l -U'
#export FZF_DEFAULT_OPTS="--height=70% --reverse --inline-info --preview 'head -200 {} 2>/dev/null' --preview-window=right:60%:wrap -m --bind='ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy)'"
#export FZF_CTRL_T_OPTS="-m --preview 'head -200 {} 2>/dev/null'"

export FZF_DEFAULT_OPTS="--height=70% --reverse --inline-info -m --preview 'head -200 {} 2>/dev/null' --preview-window 'right:hidden:wrap' --bind 'ctrl-o:toggle-preview,ctrl-f:half-page-down,ctrl-b:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_CTRL_T_OPTS="-m --preview 'head -200 {} 2>/dev/null'"

# https://github.com/junegunn/fzf/wiki/Examples#autojump
j() {
  if [[ "$#" -ne 0 ]]; then
    cd $(autojump $@)
    return
  fi
  cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}
# opt-c to autojump with fzf
bind -x '"ç":"j"'

bind -x '"\C-g":"fg"'
bind -x '"\C-xf":"fg"'
bind -x '"\C-xj":"jobs"'
bind -x '"\C-xk":"kill %1"'
bind -x '"\C-xb":"bg"'

# For bash > 4
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB':menu-complete
# Display a list of the matching files
bind "set show-all-if-ambiguous on"
# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"

psall() {
  ps aux | grep "${1}" | grep -v "grep"
}

killbyname() {
  psall $1 | awk '{print $2}' | xargs kill $2
}

kill9byname() {
  psall $1 | awk '{print $2}' | xargs kill -9 $2
}


export GOPATH=$HOME/Workspace/gocode

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following
# to your /Users/Cantin/.bash_profile:
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
