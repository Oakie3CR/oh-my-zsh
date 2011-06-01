autoload -Uz vcs_info

#zstyle ':vcs_info:*' enable git svn hg
#zstyle ':vcs_info:*+*' debug true
zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' nvcsformats " »"
zstyle ':vcs_info:*+set-message:*' hooks setPromptChar
zstyle ':vcs_info:git*:*' check-for-changes true
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked setPromptChar
zstyle ':vcs_info:git*:*' stagedstr "%F{green}●%f"
zstyle ':vcs_info:git*:*' unstagedstr "%F{yellow}●%f"
zstyle ':vcs_info:git*:*' formats '%F{cyan}(%b%c%u%f%F{cyan})%f %s'
zstyle ':vcs_info:git*:*' actionformats '%F{cyan}(%F{yellow}%a|%f%b%c%u%f%F{cyan})%f %s'
zstyle ':vcs_info:hg*:*' formats ' %s'
#zstyle ':vcs_info:(sv[nk]):*' branchformat "%b%F{red}:%f%F{yellow}%r%f"

# Change this next one to be svn specific when I have hg worked out
#zstyle ':vcs_info:*' formats '%F{cyan}(%b%c%u%f%F{cyan})%f'

precmd() {
  vcs_info
  PROMPT='%{$fg_no_bold[red]%}%n %{$fg_no_bold[green]%}%3~%{$reset_color%}${vcs_info_msg_0_} '
}

function +vi-git-untracked {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
    git status --porcelain | grep '??' &> /dev/null ; then
    hook_com[unstaged]+='%F{red}●%f'
  fi
}

### Detects the VCS and shows the appropriate sign
function +vi-setPromptChar {
  [[ ${hook_com[vcs_orig]} == git ]] && hook_com[vcs]=±
  [[ ${hook_com[vcs_orig]} == 'hg-hgsubversion' ]] && hook_com[vcs]=☿
  [[ ${hook_com[vcs_orig]} == 'git-svn' ]] && hook_com[vcs]=⚡
}

