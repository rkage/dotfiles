# vim:filetype=fish:shiftwidth=4

function cat --wraps=bat --description="bat shorthand, replacement for cat"
    if command -qs bat
        command bat $argv
    else
        command cat $argv
    end
end
