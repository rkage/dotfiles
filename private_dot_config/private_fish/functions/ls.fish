function ls --wraps=exa --description="exa shorthand, replacement for ls"
    if command -qs exa
        exa $argv
    end
end
