# vim:filetype=fish:shiftwidth=4

if command -qv doas
    function sudo --wraps doas --description "smooth transition sudo to doas"
        command doas $argv
    end
end
