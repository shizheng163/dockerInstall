
#!/bin/bash

CHECK_RLT=$(dpkg -l | grep elasticsearch | wc -l)
set -e
if [ $CHECK_RLT -eq 0 ]; then
  mkdir -p /tmp/esinstall/
  cd /tmp/esinstall/
  wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.1-amd64.deb
  wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.10.1-amd64.deb.sha512
  shasum -a 512 -c elasticsearch-7.10.1-amd64.deb.sha512 
  sudo dpkg -i elasticsearch-7.10.1-amd64.deb
fi
echo "install elasticsearch completed!"