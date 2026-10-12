# vim: set filetype=zsh shiftwidth=2 tabstop=2 expandtab :
# shellcheck disable=all

if (( ${+commands[kubectl]} )); then
  alias sk='kubectl -n kube-system'
  alias kg='kubectl get'
  alias kgp='kubectl get po'
  alias kga='kubectl get --all-namespaces'
  alias kd='kubectl describe'
  alias kdp='kubectl describe po'
  alias krm='kubectl delete'
  alias ktn='kubectl top nodes --use-protocol-buffers'
  alias ke='kubectl edit'
  alias kex='kubectl exec -it'
  alias knrunning='kubectl get pods --field-selector=status.phase!=Running'
  alias kfails='kubectl get po -owide --all-namespaces | grep "0/" | tee /dev/tty | wc -l'
  alias kimg="kubectl get deployment --output=jsonpath='{.spec.template.spec.containers[*].image}'"
  alias kvs='kubectl view-secret'
  alias kgno='kubectl get no --sort-by=.metadata.name -o wide'
  alias kdrain='kubectl drain --ignore-daemonsets --delete-emptydir-data'
  alias kscale='kubectl scale'
fi

if (( ${+commands[kubecolor]} )); then
  alias kubectl='kubecolor'
  compdef kubecolor='kubectl'
fi
