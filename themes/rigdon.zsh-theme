autoload -Uz vcs_info

#zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr "%F{green}●%f"
zstyle ':vcs_info:*' unstagedstr "%F{yellow}●%f"
#zstyle ':vcs_info:(sv[nk]):*' branchformat "%b%F{red}:%f%F{yellow}%r%f"

# Change this next one to be svn specific when I have hg worked out
zstyle ':vcs_info:*' formats '%F{cyan}(%b%c%u%f%F{cyan})%f'

precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:git:*' formats '%F{cyan}(%b%c%u%f%F{cyan})%f'
  } else {
    zstyle ':vcs_info:git:*' formats '%F{cyan}(%b%c%u%f%F{red}●%f%F{cyan})%f'
  }
 
	vcs_info
}

### Detects the VCS and shows the appropriate sign
function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	hg root >/dev/null 2>/dev/null && echo '☿' && return
  #svn info >/dev/null 2>/dev/null && echo '⚡' && return
	echo '»'
}

PROMPT='%{$fg_no_bold[red]%}%n %{$fg_no_bold[green]%}%3~ ${vcs_info_msg_0_}%{$reset_color%} $(prompt_char) '
#PROMPT='%{$fg_no_bold[cyan]%}%n%{$fg_no_bold[magenta]%}➜%{$fg_no_bold[green]%}%3~$(git_prompt_info)%{$reset_color%}» '

# git theming
#ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg_no_bold[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX=""
#ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[blue]%})"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}✗%{$fg_bold[blue]%})"
