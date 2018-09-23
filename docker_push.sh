#!/bin/sh

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

docker tag oioioi "liquidpl/oioioi:latest"
docker push liquidpl/oioioi:latest
