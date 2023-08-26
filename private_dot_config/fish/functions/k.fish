# vim:filetype=fish:shiftwidth=4

if command -qs kubectl
    function k --wraps=kubectl --description="shorthand for kubectl"
        kubectl $argv
    end
end
