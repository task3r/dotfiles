fpath=($fpath "/home/task3r/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


if [ -f ~/.dir_colors ]; then  
  eval `dircolors ~/.dir_colors`
fi 

alias ls='ls --color=auto'

SPACESHIP_TIME_SHOW=true
SPACESHIP_CHAR_SYMBOL='➤ '
