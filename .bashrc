#
# ~/.bashrc
#
#TERM=xterm-256color
export PYTHONPATH=/usr/lib/python3.6/site-packages

[[ $- != *i* ]] && return

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh


alias open='xdg-open'


# so it doesnt affect scripts

[ -z "$PS1" ] && return

function cd {
	builtin cd "$@" && ls -F
}
