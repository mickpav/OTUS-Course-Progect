#!/bin/bash
echo "Creating managed Kubernetes...."
terraform -chdir=./infra/terraform-k8s/ apply --auto-approve &
pid=$!
wait "$pid"
echo "Done"
echo "Getting credentials"
export CLUSTER_NAME="k8s-final"
yc managed-kubernetes cluster get-credentials $CLUSTER_NAME --external --force





