docker rm -f $(docker ps -aq)

docker build -t nacho270/node-express .
docker run -p 8080:8080 nacho270/node-express

docker build -f Dockerfile.dev .
docker run -it -p 3000:3000 -v /app/node_modules -v $(pwd):/app 4e8246f89acc

docker-compose up --build -d
docker-compose down


----------------------------------------------------------------------------------------------------------------

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

kubectl get pods
kubectl get services
kubectl get deployments
kubectl get pv
kubectl get pvc
kubectl get secrets

kubectl describe pod client-pod


kubectl delete -f client-pod.yaml
kubectl delete -f k8s

kubectl delete service client-cluster-ip-service
kubectl delete deployments worker-deployment
kubectl delete pvc database-persistent-volume-claim


kubectl logs client-deployment-6b67fd9d9b-hb854
kubectl exec -it client-deployment-6b67fd9d9b-hb854 sh

kubectl set image deployment/client-deployment client=nacho270/docker-fibonacci-calculator-client:v2

kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres_password

