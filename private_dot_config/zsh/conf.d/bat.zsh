# vim: set filetype=zsh shiftwidth=2 tabstop=2 expandtab :
# shellcheck disable=all

if (( ${+commands[bat]} )); then
  alias cat='bat --plain'
fi
