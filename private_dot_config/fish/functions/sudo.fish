# vim:filetype=fish:shiftwidth=4

function sudo --wraps=doas --description="smooth transition sudo to doas"
    if command -qs doas
        command doas $argv
    else
        command sudo $argv
    end
end
