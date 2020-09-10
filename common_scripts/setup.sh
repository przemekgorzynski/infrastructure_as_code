#/bin/bash

echo "updating OS"

sudo yum install python3 -y
sudo yum update -y
sudo yum upgrade -y
sudo mkdir /root/.ssh
sudo cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys
