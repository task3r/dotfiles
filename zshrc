export PATH="${PATH}:${HOME}/.local/bin/" #betterlock
export M3_HOME=/Users/task3r/Software/apache-maven-3.6.3
export LSDS_HOME=/Users/task3r/dev/lsdsuite
export PATH=$PATH:$M3_HOME/bin
export PATH=$PATH:$LSDS_HOME/bin
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
alias vim='nvim'
alias gits='git status'
alias gitd='git diff'
alias gitch='git checkout'
alias gitc='git commit'
alias gitcm='git commit -m'
alias gita='git add'
alias gitp='git push'
alias gitags="git for-each-ref --sort=creatordate --format '%(refname) %(creatordate)' refs/tags"
alias python2='/usr/bin/python'
alias python='python3'
alias py='python3'
alias proj='f() { cd ~/Documents/teaching/es1920/es20tg_$1-project/backend};f'
alias esgrade='gitinspector --grading  -x author:Pedro,author:Rito,author:Samuel,author:"José Rocha" --file-types=java,groovy'
alias cleardb='dropdb tutordb; createdb tutordb; psql tutordb < ~/dev/quizzes-tutor/data/dumps/demo.sql'
alias vg="vagrant"
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="vim"

ZSH_THEME="spaceship"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/task3r/.sdkman"
[[ -s "/Users/task3r/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/task3r/.sdkman/bin/sdkman-init.sh"
