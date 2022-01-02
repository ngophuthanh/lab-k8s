$namespace = "tn1"
$service = "tn1"
$podDefFile = "./1_kubectl/pod_def.yaml"

kubectl create ns $namespace

kubectl create -f $podDefFile -n $namespace

kubectl delete -f $podDefFile -n $namespace

kubectl delete ns $namespace
<#
kubectl get ns
kubectl get pods -n $namespace
kubectl get service -n $namespace

minikube service $service -n $namespace
#>