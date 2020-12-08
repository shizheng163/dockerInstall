CHECK_RLT=$(dpkg -l | grep net-tools | wc -l)
set -e
if [ $CHECK_RLT -eq 0 ]; then
  sudo apt-get install -y net-tools
fi
echo "install vim completed!"
