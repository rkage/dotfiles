# vim: set filetype=zsh shiftwidth=2 tabstop=2 expandtab :
# shellcheck disable=SC2034,SC2153,SC2086,SC2155

if (( ${+commands[bat]} )); then
  alias cat='bat --plain'
fi
