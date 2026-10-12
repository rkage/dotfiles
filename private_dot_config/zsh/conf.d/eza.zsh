# vim: set filetype=zsh shiftwidth=2 tabstop=2 expandtab :
# shellcheck disable=all

if (( ${+commands[eza]} )); then
  alias ls='eza --group-directories-first --classify=auto'
  alias ll='ls --long'
  alias ld='ls --long --only-dirs'
  alias lf='ls --long --only-files'
  alias la='ls --long --all'
  alias lt='ls --long --all --sort=modified'
fi
