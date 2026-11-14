#!/usr/bin/env bash
set -euo pipefail

DIR="../shvirtd-example-python"

echo "Введите ip-адрес сервера:"
read HOST_IP

scp $DIR/deploy.sh ubuntu@$HOST_IP:~/
ssh ubuntu@$HOST_IP "~/deploy.sh"

docker context create lab-vm \
  --docker "host=ssh://ubuntu@$HOST_IP"

docker context ls
docker context use lab-vm
docker ps -a