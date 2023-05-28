#!/bin/sh
set -euxo pipefail

git clone "https://github.com/$1" ./dockergittemp
cd dockergittemp

docker login --username=$DOCKER_USER --password=$DOCKER_PWD

docker build . -t $2

docker push $2