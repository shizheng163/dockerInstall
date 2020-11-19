#!/bin/bash

CHECK_RLT=$(dpkg -l | grep vim | wc -l)
set -e
if [ $CHECK_RLT -eq 0 ]; then
  sudo apt-get install -y vim
fi
echo "install vim completed!"