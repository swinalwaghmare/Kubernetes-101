### Install kubectl
```
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client
```

### Install eksctl
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```

### Create EKS Cluster
```
eksctl create cluster --name dev-cluster --region us-east-1 --node-type t2.medium --zones us-east-1a,us-east-1b
```
### Verify cluster
```
kubectl get nodes
```
### Install Docker & Git
```
yum install docker git -ysystemctl start docker
docker ps
```

### Clone repository
```
git clone https://github.com/swinalwaghmare/Kubernetes-101.gitcd Kubernetes-101/03-networking/ingress-nginx/app/
```

### Build Docker image
```
docker build -t swinalwaghmare/ingress-nginx:v1 .
```

### Push image to Docker Hub
```
docker login
docker push swinalwaghmare/ingress-nginx:v1
```

### Navigate to manifests
```
cd ../manifests/
```

### Deploy application
```
kubectl apply -f deployment.yml
kubectl get pods
kubectl get deployment
```

### Expose service
```
kubectl apply -f service.yml
kubectl get svc
```

### Test service (ClusterIP)
```
curl <SERVICE-IP>
```

### Update kubeconfig (if needed)
```
aws eks --region us-east-1 update-kubeconfig --name dev-cluster
```

### Describe service
```
kubectl describe svc hello-world
```

### Apply ingress resource
```
kubectl apply -f ingress.yml
kubectl get ingress
```

### Install NGINX Ingress Controller (AWS)
```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.15.0/deploy/static/provider/aws/deploy.yaml
```

### Verify ingress controller
```
kubectl get pods -A | grep nginx
kubectl get svc -n ingress-nginx
```
### Describe ingress controller service
```
kubectl describe svc ingress-nginx-controller -n ingress-nginx
```
### Re-apply ingress after edits
```
kubectl apply -f ingress.yml
kubectl get ing
```

### Debugging
```
kubectl get pods -n kube-system
kubectl get svc
```