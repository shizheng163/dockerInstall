#!/bin/bash

CHECK_RLT=$(dpkg -l | awk '{print $2}'| grep -E ^python3 | wc -l)
set -e
if [ $CHECK_RLT -eq 0 ]; then
  sudo apt-get update
  sudo apt-get install -y python3
  sudo apt-get install -y python3-pip
fi
echo "install python3 and python3-pip completed!"
