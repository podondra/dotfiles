local EXIT_CODE="%{$fg[red]%}%(?.. %?)%{$reset_color%}"

PROMPT='%n@%m:%(!.%{$fg[red]%}.%{$fg[green]%})%~%{$reset_color%}%# '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPROMPT='$(git_prompt_info)$(git_prompt_status)${EXIT_CODE}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%}!"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}>"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}?"
