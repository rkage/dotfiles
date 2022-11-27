# vim:filetype=fish:shiftwidth=4

if command -qs exa
    function ls --wraps=exa --description="exa shorthand, replacement for ls"
        command exa $argv
    end
end
