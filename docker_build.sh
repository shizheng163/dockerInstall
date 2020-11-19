#!/bin/sh
set -e

show_usage="args: [-i , -t]\
                                  [--image_version=, --tag_version=, --is_tag_latest=]"
IMAGE_VERSION=""

TAG_VERSION=""

TAG_TO_LATEST="false"

GETOPT_ARGS=`getopt -o i:t: -al image_version:,tag_version:,is_tag_latest: -- "$@"`
eval set -- "$GETOPT_ARGS"

while [ -n "$1" ]
do
        case "$1" in
                -i|--image_version) IMAGE_VERSION=$2; shift 2;;
                -t|--tag_version) TAG_VERSION=$2; shift 2;;
                --is_tag_latest) TAG_TO_LATEST=$2; shift 2;;
                --) break ;;
                *) echo $1,$2,$show_usage; break ;;
        esac
done

if [[ -z $IMAGE_VERSION || -z $TAG_VERSION || -z $TAG_TO_LATEST ]]; then
        echo $show_usage
        echo "image_version: $IMAGE_VERSION , tag_version: $TAG_VERSION"
        exit 1
fi

echo "image_version: $IMAGE_VERSION , tag_version: $TAG_VERSION, is_tag_latest: $TAG_TO_LATEST" 

DOCKERFILE_DIR=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
IMAGE_REPOSITORY="shizheng163/ubuntu18.04-self"

BUILD_CMD="docker build --build-arg USER=$USER \
              --build-arg BASE_IMAGE=$IMAGE_VERSION \
              --build-arg VERSION=$TAG_VERSION \
              -t $IMAGE_REPOSITORY:$TAG_VERSION \
              $DOCKERFILE_DIR"
echo $BUILD_CMD
eval $BUILD_CMD

if [ $TAG_TO_LATEST = "true" ]; then
  TAG_CMD="docker tag $IMAGE_REPOSITORY:$TAG_VERSION $IMAGE_REPOSITORY:latest"
  echo $TAG_CMD
  eval $TAG_CMD
fi