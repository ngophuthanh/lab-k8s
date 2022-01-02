$namespace = "demo1"
$service = "demo1"
$service2 = "prometheus-kube-state-metrics"

minikube start
minikube addons list
minikube addons enable ingress
kubectl get ns
kubectl config get-contexts
kubectl get pods -n $namespace
kubectl get service -$namespace
minikube service $service -n $namespace
minikube service $service2 -n $namespace

<#
Note: helm_release resource might get error "failed to download". To fix, run
    - helm repo list
    - helm repo update
#>