#!/bin/bash

CHECK_RLT=$(dpkg -l | grep bash-completion | wc -l)
set -e
if [ $CHECK_RLT -eq 0 ]; then
  sudo apt-get install bash-completion
fi
echo "install bash-completion completed!"