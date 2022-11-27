# vim:filetype=fish:shiftwidth=4

function ls --wraps=exa --description="exa shorthand, replacement for ls"
    if command -qs exa
        command exa $argv
    else
        command ls $argv
    end
end
