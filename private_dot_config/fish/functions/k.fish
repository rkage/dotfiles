# vim:filetype=fish:shiftwidth=4

if command -qs kubectl
    function k --wraps=kubectl --description="shorthand for kubectl"
        kubectl $argv
    end

    abbr -a sk 'kubectl -n kube-system'
    abbr -a kg 'kubectl get'
    abbr -a kgp 'kubectl get po'
    abbr -a kga 'kubectl get --all-namespaces'
    abbr -a kd 'kubectl describe'
    abbr -a kdp 'kubectl describe po'
    abbr -a krm 'kubectl delete'
    abbr -a ktn 'kubectl top nodes --use-protocol-buffers'
    abbr -a ke 'kubectl edit'
    abbr -a kex 'kubectl exec -it'
    abbr -a knrunning 'kubectl get pods --field-selector=status.phase!=Running'
    abbr -a kfails 'kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
    abbr -a kimg "kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
    abbr -a kvs "kubectl view-secret"
    abbr -a kgno 'kubectl get no --sort-by=.metadata.name -o wide'
    abbr -a kdrain 'kubectl drain --ignore-daemonsets --delete-emptydir-data'
    abbr -a kscale 'kubectl scale'
end
