This project demonstrates how to:
- Create a Kubernetes Namespace
- Deploy an application (nginx) with specific CPU and memory requests
- Ensure proper scheduling on nodes with sufficient resources

---
# Namespace 
We created a namespace named `resources` to logically isolate the deployment.

Command: 
kubectl apply -f ns-resources.yml

## yaml file for namespace

apiVersion: v1
kind: Namespace
metadata:
  name: resources


# Deployment of the application

We created deployment called super-app that requests a minimum of 400m CPU and 1Gi memory for its containers

Command:
kubectl apply -f deployment.yml

## yaml file

apiVersion: apps/v1
kind: Deployment
metadata:
  name: super-app
  namespace: resources
spec:
  replicas: 2
  selector:
    matchLabels:
      app: super-app
  template:
    metadata:
      labels:
        app: super-app
    spec:
      containers:
      - name: nginx
        image: nginx
        resources:
          requests:
            cpu: "400m"
            memory: "1Gi"


