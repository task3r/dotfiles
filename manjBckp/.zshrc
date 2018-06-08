setopt PROMPT_SUBST

local user_name="%{$fg[cyan]%}task3r_"
local path_string="%{$fg[yellow]%}%~"
local prompt_string="$"

# Make prompt_string red if the previous command failed.
local return_status="%(?:%{$fg[blue]%}$prompt_string:%{$fg[red]%}$prompt_string)"


# Load completions for Ruby, Git, etc.
autoload compinit
compinit

git_custom_prompt() {
  # branch name (.oh-my-zsh/plugins/git/git.plugin.zsh)
  local branch=$(current_branch)
  if [ -n "$branch" ]; then
    # parse_git_dirty echoes PROMPT_DIRTY or PROMPT_CLEAN (.oh-my-zsh/lib/git.zsh)
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$branch$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT="${user_name} ${return_status} %{$reset_color%}"
RPROMPT="${path_string} $(git_custom_prompt)"
setopt menucomplete
