# vim:filetype=fish:shiftwidth=4

function sudoedit --wraps=doas --description="smooth transition sudo to doas"
    if command -qs doas
        command doas $EDITOR $argv
    else
        command sudoedit $argv
    end
end
