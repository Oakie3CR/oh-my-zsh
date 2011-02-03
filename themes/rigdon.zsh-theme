#   autoload -Uz vcs_info
#   
#   # Set some variables for colors.
#   for COLOR in RED GREEN YELLOW WHITE BLACK CYAN; do
#     eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'        
#     eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
#   done                                                
#   PR_RESET="%{${reset_color}%}"; 
#    
#   zstyle ':vcs_info:*' check-for-changes true
#   zstyle ':vcs_info:*' stagedstr "$PR_GREEN●$PR_RESET"
#   zstyle ':vcs_info:*' unstagedstr "$PR_YELLOW●$PR_RESET"
#   zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat "%b$PR_RED:$PR_YELLOW%r%PR_RESET"
#   zstyle ':vcs_info:*' enable git svn


PROMPT='%{$fg_no_bold[cyan]%}%n%{$fg_no_bold[magenta]%}➜%{$fg_no_bold[green]%}%3~$(git_prompt_info)%{$reset_color%}» '

# git theming
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗%{$fg_bold[blue]%})"
