function kc --wraps=kubecolor --description="shorthand for kubecolor"
    if command -qs kubecolor
        kubecolor $argv
    end
end
