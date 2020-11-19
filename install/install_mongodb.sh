#!/bin/bash

CHECK_RLT=$(dpkg -l | grep mongodb | wc -l)
set -e
if [ $CHECK_RLT -eq 0 ]; then
  sudo apt-get install -y mongodb
fi
echo "install mongodb completed!"