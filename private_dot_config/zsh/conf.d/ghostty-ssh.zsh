# vim: set filetype=zsh shiftwidth=2 tabstop=2 expandtab :
# shellcheck disable=SC2034,SC2153,SC2086,SC2155

if (( ${+commands[ghostty]} )); then
  autoload -Uz is-at-least

  _ghostty_version=${${(f)"$(ghostty +version)"}[1]#Ghostty }

  if is-at-least 1.4.0 "$_ghostty_version"; then
    alias ssh='ghostty +ssh --'
  fi

  unset _ghostty_version
fi
