#!/bin/bash
echo "MongoDB install.."
kubectl apply -f ./kubernetes/mongodb/
echo "RabbitMQ install..." 
kubectl apply -f ./kubernetes/rabbitmq/