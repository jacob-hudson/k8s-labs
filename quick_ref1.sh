# Create Namespace
kubectl create ns web
# Create Deployment
kubectl run webapp --image=linuxacademycontent/podofminerva:latest --port=80 --replicas=3 -n web
# Get Pods in Namespace
kubectl get po -o wide -n web
# Create temporary pods
kubectl run busybox --image=busybox --rm -it --restart=Never -- sh
# Create YAML for Service
kubectl expose deployment/webapp --port=80 --target-port=80 --type=NodePort -n web --dry-run -o yaml > web-service.yaml
# Create Deployment
kubectl apply -f web-service.yaml
# Modify Deployments
kubectl edit deploy webapp -n web
# Check if Probes are present
kubectl get po <pod_name> -o yaml -n web --export