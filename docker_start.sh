#!/bin/bash
DIR=""
if [ $# -eq 0 ];
then
  echo "container volume:Usage bash $0 DIR_PATH";
  exit 1
else
  DIR=$1
  if [ ! -d $DIR ]; then
    echo "Dir '$DIR' not exist or not directory."
    exit 1
  fi
  DIR="$(cd $DIR && pwd )"
  echo "container volume:$DIR"
fi
NAME="mywork"
IMAGE="shizheng163/ubuntu18.04-self:latest"
VOLUME_PATH=$DIR
VOLUME_DOCKER_PATH="/work"

echo "Use image:$IMAGE"

docker run -it -d \
          -u $USER \
          --name $NAME \
          -v "${VOLUME_PATH}:${VOLUME_DOCKER_PATH}" \
          -w "${VOLUME_DOCKER_PATH}" \
          --net=host \
          $IMAGE

if [ $? -ne 0 ];
then
  exit 1
fi
cd $(dirname "${BASH_SOURCE[0]}")

bash docker_into.sh