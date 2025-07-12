# Service Account: cloud-engineers

## Overview

This setup defines a Kubernetes **Service Account** named `cloud-engineers` within the `cloud-engineering` Namespace. The Service Account is used by the Cloud Engineering team to to deploy their application to Kubernetes cluster.

---


### 1. Namespace: `cloud-engineering`
The isolated namespace for the Cloud Engineering team, separated from other teams and services in the cluster.

### 2. Service Account: `cloud-engineers`
A Kubernetes identity used by pods to authenticate against the API server. 

### 3. Deployment: `internal-app`
An example NGINX application that runs in the `cloud-engineering` namespace and uses the `cloud-engineers` Service Account to interact with the Kubernetes API if needed.

---

## YAML info

```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: cloud-engineers
  namespace: cloud-engineering