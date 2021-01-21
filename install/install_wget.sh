#!/bin/bash

CHECK_RLT=$(dpkg -l | grep wget | wc -l)
set -e
if [ $CHECK_RLT -eq 0 ]; then
  sudo apt-get install wget -y
fi
echo "install wget completed!"