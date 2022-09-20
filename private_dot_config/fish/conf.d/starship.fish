# determine if starship is installed and init the prompt
# vim:filetype=fish:shiftwidth=4

if command -sq starship
    starship init fish | source
end
