# vim:filetype=fish:shiftwidth=4

if command -qs bat
    function cat --wraps=bat --description="bat shorthand, replacement for cat"
        command bat $argv
    end
end
