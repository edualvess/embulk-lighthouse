#!/bin/bash
#registry=docker.io
user=alvesedu
name=embulk-lighthouse
tag=0.0.1-0

docker build -t ${user}/${name}:${tag} .
docker tag ${user}/${name}:${tag} ${user}/${name}:${tag}

docker push ${user}/${name}:${tag}

echo "pushed: ${registry}/${user}/${name}:${tag}"
