# vim:filetype=fish:shiftwidth=4

if command -qs kubecolor
    function kubectl --wraps=kubecolor --description="shorthand for kubectl"
        command kubecolor --force-colors $argv
    end
end

