# determine which editor to set within the shell environment
# vim:filetype=fish:shiftwidth=4

if command -qv nvim
    set -gx EDITOR nvim
    abbr -a vim $EDITOR
else 
    set -gx EDITOR vim
end

abbr -a vi $EDITOR
set -gx VISUAL $EDITOR
set -gx KUBE_EDITOR $EDITOR
