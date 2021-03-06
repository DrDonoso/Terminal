alias kubens='kubectl get ns'

function kubeusecontext() {
    echo "Select the context to use:"
    context=$(kubectl config get-contexts | fzf --height 30% --layout reverse | awk '{print $1}')
    if [ "$context" = "*" ]; then
        context=$(kubectl config current-context)
    fi
    kubectl config use-context $context
}

function kubesetns () {
    echo "Select the namespace to use:"
    ns=$(kubectl get ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    kubectl config set-context --current --namespace="$ns"
    echo "Namespace: $ns"
}

function kubepods () {
    echo "Select the namespace to see the pods:"
    ns=$(kubectl get ns | fzf --height 30% --layout reverse | awk '{print $1}')
    echo "Namespace: $ns"
    kubectl get pods -n "$ns"
}

function kubesvcs () {
    echo "Select the namespace to see the services:"
    ns=$(kubectl get ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Namespace: $ns"
    kubectl get svc -n "$ns"
}

function kubelogs () {
    echo "Select the namespace to see the pods:"
    ns=$(kubectl get ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Namespace: $ns"

    echo "Select the pod to get logs:"
    pod=$(kubectl get pods -n $ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Pod: $pod"

    kubectl logs "$pod" -n "$ns" --tail=50 --follow
} 

function kubeforwardsvc () {
    echo "Select the namespace to see the services:"
    ns=$(kubectl get ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Namespace: $ns"

    echo "Select the service to see the ports:"
    svc=$(kubectl get svc -n $ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Service: $svc"

    echo "Select the port to port-forward:"
    port=$(kubectl get svc $svc -n $ns --template='{{range .spec.ports}}{{.port}} {{.protocol}}{{"\n"}}{{end}}' | fzf --height 30% --layout reverse  | awk '{print $1}')

    kubectl port-forward service/"$svc" "$1":"$port" -n "$ns"
} 

function kubeenter () {
    echo "Select the namespace to see the services:"
    ns=$(kubectl get ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Namespace: $ns"

    echo "Select the pod to enter:"
    pod=$(kubectl get pods -n $ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Pod: $pod"

    kubectl exec -it "$pod" sh -n "$ns"
}

function kuberunjob () {
    echo "Select the namespace to see the cronjobs:"
    ns=$(kubectl get ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Namespace: $ns"

    echo "Select the cronjob to create a job:"
    cronjob=$(kubectl get cronjobs -n $ns | fzf --height 30% --layout reverse  | awk '{print $1}')
    echo "Cronjob: $cronjob"

    kubectl create job --from=cronjob/$cronjob "$cronjob-$(uuidgen | cut -c1-3)" -n $ns
}
