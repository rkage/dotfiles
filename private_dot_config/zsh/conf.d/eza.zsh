# vim: set filetype=zsh shiftwidth=2 tabstop=2 expandtab :
# shellcheck disable=SC2034,SC2153,SC2086,SC2155

if (( ${+commands[eza]} )); then
  alias ls='eza --group-directories-first --classify=auto'
  alias ll='ls --long'
  alias ld='ls --long --only-dirs'
  alias lf='ls --long --only-files'
  alias la='ls --long --all'
  alias lt='ls --long --all --sort=modified'
fi
