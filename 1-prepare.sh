#!/bin/bash

export USER_NAME='motek'
echo "Building images...."
docker build -t $USER_NAME/crawler ./search_engine_crawler/crawler/
docker build -t $USER_NAME/ui ./search_engine_ui/ui/
docker build -t $USER_NAME/prometheus ./prometheus/
echo "Done"

echo "Pushing images to Docker Hub..."

cat ~/docker-pass.txt | docker login --username $USER_NAME --password-stdin
docker push $USER_NAME/crawler
docker push $USER_NAME/ui
docker push $USER_NAME/prometheus
echo "Done"
