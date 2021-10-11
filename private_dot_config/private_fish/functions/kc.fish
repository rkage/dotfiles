function kc --wraps=kubecolor --description="shorthand for kubecolor"
    if type -q kubecolor
        kubecolor $argv
    end
end
