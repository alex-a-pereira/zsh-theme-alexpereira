# sorin.zsh-theme
# screenshot: https://i.imgur.com/aipDQ.png


branch_name() {
  red_trimmed_branch_name="%{$fg[red]%}%18>…>$(current_branch)%>>"
  open_bracket="$ZSH_THEME_GIT_PROMPT_PREFIX"
  close_bracket="$ZSH_THEME_GIT_PROMPT_SUFFIX"
  echo "$open_bracket$red_trimmed_branch_name$close_bracket"
}


if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  local return_status="%{$fg[red]%}%(?..⏎)%{$reset_color%}"

  # ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}git%{$reset_color%}:%{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}("
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"

  PROMPT='%{$fg[cyan]%}%c $(branch_name)$(git_prompt_status) %(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%}❯)%{$reset_color%} '
  
  # git:branch
  # ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}git%{$reset_color%}:%{$fg[red]%}"
  # 
  # ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%} (%{$fg[red]%}"
  # ZSH_THEME_GIT_PROMPT_PREFIX=" %2>…>$(current_branch)%>>"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}%{$reset_color%}'
  RPROMPT+='%{$fg[green]%}$(virtualenv_prompt_info)%{$reset_color%}%'

  # UNCOMMENT FOR COLORED GIT STATUS RETURNS
  # ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  # ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
  # ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  # ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  # ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  # ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✭"

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✹"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[yellow]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[yellow]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} ✭"
else
  MODE_INDICATOR="❮❮❮"
  local return_status="%(?::⏎)"

  PROMPT='%c$(git_prompt_info) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi

