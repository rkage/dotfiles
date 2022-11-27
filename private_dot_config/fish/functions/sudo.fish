# vim:filetype=fish:shiftwidth=4

if command -qs doas
    function sudo --wraps=doas --description="smooth transition sudo to doas"
        command doas $argv
    end
end
