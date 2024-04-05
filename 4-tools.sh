#!/bin/bash
kubectl apply -f ./k8s-ns/
echo "MongoDB install.."
kubectl apply -f ./kubernetes/mongodb/ -n app 
echo "RabbitMQ install..." 
kubectl apply -f ./kubernetes/rabbitmq/ -n app 