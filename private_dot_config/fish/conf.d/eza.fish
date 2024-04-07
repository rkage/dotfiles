# vim:filetype=fish:shiftwidth=4

# Aliases for ls using eza
if command -qv eza
    alias ld "eza -lD"
    alias lf "eza -lf --color=always | grep -v /"
    alias lh "eza -dl .* --group-directories-first"
    alias ll "eza -alf --color=always --sort=size | grep -v /"
    alias ls "eza -al --color=always --group-directories-first"
    alias lt "eza -al --sort=modified"
end

