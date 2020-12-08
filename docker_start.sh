#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/" && pwd )"
NAME="mywork"
IMAGE="shizheng163/ubuntu18.04-self:latest"
VOLUME_PATH=$DIR
VOLUME_DOCKER_PATH="/work"

echo "Use image:$IMAGE"

set -e

docker run -it -d \
          -u $USER \
          --name $NAME \
          -v "${VOLUME_PATH}:${VOLUME_DOCKER_PATH}" \
          -w "${VOLUME_DOCKER_PATH}" \
          $IMAGE

bash docker_into.sh