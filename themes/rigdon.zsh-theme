autoload -Uz vcs_info

#zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{green}●%f"
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}●%f"
zstyle ':vcs_info:*' nvcsformats "" "%F{cyan}(%b%c%u%f%F{cyan})%f"
#zstyle ':vcs_info:(sv[nk]):*' branchformat "%b%F{red}:%f%F{yellow}%r%f"

# Change this next one to be svn specific when I have hg worked out
#zstyle ':vcs_info:*' formats '%F{cyan}(%b%c%u%f%F{cyan})%f'

precmd() {
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
  echo '»'
}

PROMPT='%{$fg_no_bold[red]%}%n %{$fg_no_bold[green]%}%3~${vcs_info_msg_0_}%{$reset_color%} $(prompt_char) '
