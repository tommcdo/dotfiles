autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%F{cyan}{%f%F{yellow}%b%f%F{cyan}}%f'

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f%F{blue}%~%f${vcs_info_msg_0_}(%F{cyan}$?%f)$ '
