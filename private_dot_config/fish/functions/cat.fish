function cat --wraps=bat --description="bat shorthand, replacement for cat"
    if command -qs bat
        bat $argv
    end
end
