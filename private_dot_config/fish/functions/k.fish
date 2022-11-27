# vim:filetype=fish:shiftwidth=4

if command -qs kubectl
    function k --wraps=kubectl --description="shorthand for kubectl"
        kubectl $argv
    end

    abbr -a -U sk 'kubectl -n kube-system'
    abbr -a -U kg 'kubectl get'
    abbr -a -U kgp 'kubectl get po'
    abbr -a -U kga 'kubectl get --all-namespaces'
    abbr -a -U kd 'kubectl describe'
    abbr -a -U kdp 'kubectl describe po'
    abbr -a -U krm 'kubectl delete'
    abbr -a -U ktn 'kubectl top nodes --use-protocol-buffers'
    abbr -a -U ke 'kubectl edit'
    abbr -a -U kex 'kubectl exec -it'
    abbr -a -U knrunning 'kubectl get pods --field-selector=status.phase!=Running'
    abbr -a -U kfails 'kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
    abbr -a -U kimg "kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
    abbr -a -U kvs "kubectl view-secret"
    abbr -a -U kgno 'kubectl get no --sort-by=.metadata.name -o wide'
    abbr -a -U kdrain 'kubectl drain --ignore-daemonsets --delete-emptydir-data'
    abbr -a -U kscale 'kubectl scale'
end
