#
# ~/.bashrc
#
#TERM=xterm-256color
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


# so it doesnt affect scripts

[ -z "$PS1" ] && return

function cd {
	builtin cd "$@" && ls -F
}
