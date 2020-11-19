#!/bin/bash
cd $(dirname ${BASH_SOURCE[0]})
echo $PWD

set -e

bash docker_adduser.sh
bash install_bash-completion.sh
bash install_vim.sh
bash install_nodejs.sh
bash install_mongodb.sh