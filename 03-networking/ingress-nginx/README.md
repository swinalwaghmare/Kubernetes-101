# Kubernetes Ingress Controller (NGINX)

## 📌 Objective

Expose Kubernetes services externally using an Ingress Controller with path-based routing.

---

## 🧠 Concept

Ingress is a Kubernetes resource that manages external HTTP/HTTPS access to services.

Key components:

* Ingress Resource (rules)
* Ingress Controller (NGINX)

---

## 🏗 Architecture

User → Ingress → Service → Pod

---

## ⚙️ Setup Steps

### 1. Install Ingress Controller

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml

---

### 2. Deploy Application

kubectl apply -f manifests/deployment.yaml

---

### 3. Create Service

kubectl apply -f manifests/service.yaml

---

### 4. Create Ingress Resource

kubectl apply -f manifests/ingress.yaml

---

## 📂 Manifests

### deployment.yaml

(Explain briefly what it does)

### service.yaml

ClusterIP service to expose the app internally

### ingress.yaml

Routes traffic using host/path rules

---

## 🔍 Verification

kubectl get pods
kubectl get svc
kubectl get ingress

---

## 🌐 Testing

curl http://<EXTERNAL-IP>

---

## 📸 Output

(Add screenshots or terminal outputs from outputs/ folder)

---

## ⚠️ Common Issues

* Ingress controller not running
* Wrong service name in ingress.yaml
* No external IP assigned

---

## 📚 Learnings

* Difference between Service and Ingress
* How routing works in Kubernetes
* Role of NGINX Ingress Controller

---

## 🚀 Improvements (Next Steps)

* Add TLS (HTTPS)
* Use custom domain
* Try Traefik ingress controller
