# vim: set filetype=zsh shiftwidth=2 tabstop=2 expandtab :
# shellcheck disable=all

if (( ${+commands[claude]} )); then
  cc() { command claude --resume || { command clear && claude; } }
fi

# Human-only niceties. Claude Code (CLAUDECODE=1) snapshots this file into the
# shell it runs commands in, where these break things: `cp -i` blocks on an
# invisible overwrite prompt, the cd hook buries output, and a helper named `c`
# collides with the alias.
if [[ -z $CLAUDECODE ]]; then
  alias cp='cp -iv'
  alias mv='mv -iv'
  alias mkdir='mkdir -pv'
  alias less='less -FSRXc'
  alias c='clear'
  alias h='history'
fi
