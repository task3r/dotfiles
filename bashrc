# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    alias ls="ls --color=auto"
else # OS X `ls`
    alias ls="ls -G"
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if which nvim &> /dev/null; then
    alias vim=nvim
fi
export EDITOR=vim

if [ ! -d ~/.fzf ]; then 
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    printf "y\ny\ny" | ~/.fzf/install
fi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ ! -d ~/.gitstatus ]; then
    git clone --depth 1 https://github.com/romkatv/gitstatus.git ~/.gitstatus
fi
source ~/.gitstatus/gitstatus.prompt.sh

function prompt_status {
  if [ "$?" == "0" ]; then
    echo -e '\033[01;32m$\033[00m'
  else
    echo -e '\033[01;31m$\033[00m'
  fi
}

PS1='\[\033[01;32m\]\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] ${GITSTATUS_PROMPT}\n\[$(prompt_status)\] '

# Aliases

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# git
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdw='git diff --word-diff'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gp='git push'
alias gst='git status'
