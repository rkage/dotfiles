# vim:filetype=fish:shiftwidth=4

if command -qs doas
    function sudoedit --wraps=doas --description="smooth transition sudo to doas"
        command doas $EDITOR $argv
    end
end
