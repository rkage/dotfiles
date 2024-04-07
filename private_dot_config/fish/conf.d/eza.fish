# vim:filetype=fish:shiftwidth=4

# Aliases for ls using eza
if command -qv eza
    alias ld "eza --long --only-dirs"
    alias lf "eza --long --only-files"
    alias lt "eza --long --all --sort=modified"
end

