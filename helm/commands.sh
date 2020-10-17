helm repo add stable https://kubernetes-charts.storage.googleapis.com

helm install demo-mysql stable/mysql
helm uninstall demo-mysql
