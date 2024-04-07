# vim:filetype=fish:shiftwidth=4

if command -qv kubecolor
    function kubectl --wraps kubecolor --description "shorthand for kubectl"
        command kubecolor $argv
    end
end

