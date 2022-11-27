# vim:filetype=fish:shiftwidth=4

function kubectl --wraps=kubectl --description="shorthand for kubectl"
    if command -qs kubecolor
        kubecolor $argv
    end
end

