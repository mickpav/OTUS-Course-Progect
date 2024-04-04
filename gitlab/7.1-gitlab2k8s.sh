#!/bin/bash
helm install gitlab . -f values.yaml -n gl
kubectl get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 -d ; echo