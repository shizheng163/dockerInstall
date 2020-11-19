#!/bin/bash

node -v
if [ $? -eq 0 ]; then
  echo "already install node"
  exit 0
fi

echo "start install nodejs"

set -e
mkdir -p /tmp/nodejs_install
cd /tmp/nodejs_install
curl -sS -L --retry 3 -O https://github.com/tj/n/archive/v6.7.0.tar.gz && tar xf v6.7.0.tar.gz
cd /tmp/nodejs_install/n-6.7.0
sudo cp bin/n /bin/n

cd /tmp
rm -rf /tmp/nodejs_install

sudo n latest

node -v && npm -v