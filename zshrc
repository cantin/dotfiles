source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
  git
  rbenv
  autojump
  cp
  ruby
EOBUNDLES

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme af-magic
antigen theme awesomepanda

# Tell Antigen that you're done.
antigen apply

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=transparent,bold,underline"

#⌥ + ← or → - move one word backward/forward
bindkey "[D" backward-word
bindkey "[C" forward-word

HISTFILESIZE=5000
export HISTSIZE=5000

export PATH="$PATH:/usr/local/share/npm/bin" #add npm global bin
export PATH="$PATH:./bin" #add current directory bin

export LANG=zh_CN.UTF-8
export LC_CTYPE=C
export LC_ALL=en_US.UTF-8

export EDITOR=mvim
export GIT_EDITOR=vim
#export PS1="\u:\W\$ "

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

#[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

#if [ -f ~/.git-completion.zsh ]; then
  #source ~/.git-completion.zsh

  ## Add git completion to aliases
  #__git_complete gco _git_checkout
#fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias f="fzf"
export FZF_DEFAULT_COMMAND='ag -l -U'
#export FZF_DEFAULT_OPTS="--height=70% --reverse --inline-info --preview 'head -200 {} 2>/dev/null' --preview-window=right:60%:wrap -m --bind='ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy)'"
#export FZF_CTRL_T_OPTS="-m --preview 'head -200 {} 2>/dev/null'"

export FZF_DEFAULT_OPTS="--height=70% --reverse --inline-info -m --preview 'head -200 {} 2>/dev/null' --preview-window 'right:hidden:wrap' --bind 'ctrl-o:toggle-preview,ctrl-f:half-page-down,ctrl-b:half-page-up,ctrl-y:execute-silent(echo {+} | pbcopy)'"
export FZF_CTRL_T_OPTS="-m --preview 'head -200 {} 2>/dev/null'"

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

j() {
  if [[ "$#" -ne 0 ]]; then
    cd $(autojump $@)
    return
  fi
  cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)" 
}

zle -N j
# opt-c to autojump with fzf
bindkey "ç" j
# opt + ->
bindkey "^[[1;3C" forward-word
# opt + <-
bindkey "^[[1;3D" backward-word
