function cat --wraps=bat --description="bat shorthand, replacement for cat"
    if type -q bat
        bat $argv
    end
end
