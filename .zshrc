# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ttggttb/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH=~/go/bin:$PATH

autoload -Uz vcs_info
zstyle ':vcs_info:git*' formats "%b"
precmd() { vcs_info }
setopt prompt_subst
export PROMPT=$'\n''%B%F{15}%n in %~%f%b %F{red}${vcs_info_msg_0_}%f'$'\n''%F{cyan}--> %f '
