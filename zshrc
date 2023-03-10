# general envs
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export ICLOUD='~/Library/Mobile\ Documents/com~apple~CloudDocs/'

# path management
export PATH="${PATH}:${HOME}/.local/bin/" #betterlock
export PATH="/usr/local/opt/ruby/bin:$HOME/go/bin:$PATH"
export PATH=$PATH:$HOME/dev/predictr

# omz & spaceship
ZSH_THEME="spaceship"
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_COLOR="yellow"
SPACESHIP_GCLOUD_SHOW=false
SPACESHIP_RUST_SYMBOL="🦀  "
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting vagrant)

[ -f $ZSH/oh-my-zsh.sh ] && source $ZSH/oh-my-zsh.sh

# sdkman
export SDKMAN_DIR="/Users/task3r/.sdkman"
[ -f "/Users/task3r/.sdkman/bin/sdkman-init.sh" ] && source "/Users/task3r/.sdkman/bin/sdkman-init.sh"

# gcloud
[ -f '/Users/task3r/dev/google-cloud-sdk/path.zsh.inc' ] && source '/Users/task3r/dev/google-cloud-sdk/path.zsh.inc'
[ -f '/Users/task3r/dev/google-cloud-sdk/completion.zsh.inc' ] && source '/Users/task3r/dev/google-cloud-sdk/completion.zsh.inc'

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
alias vim='nvim'
alias gitags="git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags"
alias python='python3'
alias py='python3'
command -v exa >/dev/null 2>&1 && alias ls='exa --group-directories-first'
bindkey \^U backward-kill-line

[ -z "$TMUX" ] && exec tmux new -As main
