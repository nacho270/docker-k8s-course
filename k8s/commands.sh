minikube start --driver=hyperkit
minikube ip
minikube ssh
minikube ip

# docker server inside minikube
eval $(minikube -p minikube docker-env)

minikube dashboard


----------------------------------------------------------------------------------------------------------------

kubectl apply -f client-pod.yaml
kubectl apply -f k8s

kubectl get all 

kubectl get pods
kubectl get services
kubectl get deployments
kubectl get pv
kubectl get pvc
kubectl get secrets

kubectl describe pod client-pod
kubectl describe pod -l app=frontend

kubectl delete -f client-pod.yaml
kubectl delete -f k8s

kubectl delete service client-cluster-ip-service
kubectl delete deployments worker-deployment
kubectl delete pvc database-persistent-volume-claim


kubectl logs client-deployment-6b67fd9d9b-hb854
kubectl exec -it client-deployment-6b67fd9d9b-hb854 sh

kubectl set image deployment/client-deployment client=nacho270/docker-fibonacci-calculator-client:v2

kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres_password

minikube addons enable ingress
