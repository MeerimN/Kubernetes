# application-probe – Kubernetes Probes

## Overview

This project defines a Kubernetes Pod named `application-probe` that uses /readiness and /liveness probes to monitor application health.

These probes help Kubernetes manage Pod lifecycle automatically based on the state of the application.

---

## Health Endpoints

Purpose                                                                 
`/started`   | Readiness     | Returns `200 OK` when the app is "ready to receive traffic"          
`/health`    | Liveness      | Returns `200 OK` when the app is "alive and running"                |

All endpoints listen on ports 80 and 5000.
As nginx listens to port 80 and endpoints listen to 5000 it did not work. And it is impossible to integrate helath and started endpoints to nginx, without additional python or bash scripts. 
---

### Readiness Probe (`/started`)
- Starts checking after `5 seconds`
- Runs every `10 seconds`
- If it returns `500`, Kubernetes will mark it as unready

### Liveness Probe (`/health`)
- Starts checking after `5 seconds`
- Runs every `10 seconds`
- If it returns `500`, Kubernetes will restart the Pod

## YAML file

apiVersion: v1         # for creating a pod with nginx image
kind: Pod
metadata:
  name: application-probe
spec:
  containers:
  - name: nginx
    image: nginx
    ports:
    - containerPort: 80
    - containerPort: 5000
    readinessProbe:
      httpGet:
        path: /started
        port: 5000
      initialDelaySeconds: 5
      periodSeconds: 10
    livenessProbe:
      httpGet:
        path: /health
        port: 5000
      initialDelaySeconds: 5
      periodSeconds: 10