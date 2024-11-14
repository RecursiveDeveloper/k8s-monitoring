#!/bin/bash

owner=$1
sync_folder=$2

echo -e "\nFormatting Scripts - dos2unix\n"
apt install dos2unix -y
find ${sync_folder} -type f -print0 | xargs -0 dos2unix

su - ${owner} <<EOF
echo -e "\nDeploying resources Manifests\n"
bash ${sync_folder}/install.sh ${sync_folder}
EOF
