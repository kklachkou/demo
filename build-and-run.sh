#!/bin/sh

docker stop app || true && docker rm app || true && \
docker build -t app . && \
docker run -d -e JAVA_OPTS=$1 -m 1g -p 8080:8080 --name app app
