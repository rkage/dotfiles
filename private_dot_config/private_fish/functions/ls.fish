function ls --wraps=exa --description="exa shorthand, replacement for ls"
    if type -q exa
        exa $argv
    end
end
