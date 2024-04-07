# vim:filetype=fish:shiftwidth=4

function ls --wraps eza --description "List contents of directory using long format"
    command eza --group-directories-first $argv
end
