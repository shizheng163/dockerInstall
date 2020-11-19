#!/bin/bash

set -e
getent group | grep "${DOCKER_USER}:x" > /dev/null 2>&1 || addgroup --quiet "$DOCKER_GRP"
if [[ -z $DOCKER_USER || -z $DOCKER_GRP ]]; then
  echo "DOCKER_USER OR DOCKER_GRP NOT SET"
  echo "DOCKER_USER:$DOCKER_USER, DOCKER_GRP:$DOCKER_GRP"
  exit 1
fi
USER_CHECK_RLT=$(cat /etc/passwd | grep ${DOCKER_USER} | wc -l)
if [ $USER_CHECK_RLT -eq 0 ]; then
  GRP_ID=$(getent group | grep "${DOCKER_GRP}:x" | awk -F[:] '{print$3}')
  adduser --quiet --disabled-password --force-badname --gecos '' "$DOCKER_USER" --gid $GRP_ID 2>/dev/null
  usermod -aG sudo "$DOCKER_USER"
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
fi

# Set user files ownership to current user, such as .bashrc, .profile, etc.
chown -R "${DOCKER_USER}:${DOCKER_GRP}" "/home/${DOCKER_USER}"