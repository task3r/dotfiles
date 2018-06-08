#
# ~/.bashrc
#
#TERM=xterm-256color
[ -n "$XTERM_VERSION" ] && transset-df -p -t 0.875 --id "$WINDOWID" >/dev/null
export PYTHONPATH=/usr/lib/python3.6/site-packages

[[ $- != *i* ]] && return

#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh
function parse_git_dirty {
  [[ $(git status --porcelain  2> /dev/null | tail -n1) != "" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)] /"
}

#(parse_git_branch)

export PS1="\[\033[38;5;245m\]\u\[$(tput sgr0)\]\[\033[38;5;1m\]@\[$(tput sgr0)\]\[\033[38;5;238m\]\h\[$(tput sgr0)\]\[\033[38;5;1m\]:\[$(tput sgr0)\]\[\033[38;5;15m\] [\[$(tput sgr0)\]\[\033[38;5;243m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]] \[$(tput sgr0)\]\[\033[38;5;1m\]\$(parse_git_branch)\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias open='xdg-open'
alias ls='ls --color=auto'


# so it doesnt affect scripts

[ -z "$PS1" ] && return

function cd {
	builtin cd "$@" && ls -F
}

# added by Anaconda3 installer
#export PATH="/home/task3r_/anaconda3/bin:$PATH"
export I3="~/.config/i3"
export TERMINAL="xterm"
export QUOTING_STYLE=literal
LS_COLORS=$LS_COLORS:'di=;91:'; export LS_COLORS
#set -o vi
bind -m vi-insert "\C-l":clear-screen

export CVS_RSH=ssh
alias godev="cd ~/go/src/github.com/task3r"
