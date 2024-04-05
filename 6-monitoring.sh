#!/bin/bash
kubectl apply -f ./prometheus/prom-deploy.yml -n app 
helm install -n monitoring --values ./helm/loki/values.yaml loki-stack grafana/loki-stack 
kubectl -n monitoring get secret/loki-stack-grafana -o custom-columns="VALUE":.data.admin-user --no-headers | base64 --decode 
kubectl -n monitoring get secret/loki-stack-grafana -o custom-columns="VALUE":.data.admin-password --no-headers | base64 --decode