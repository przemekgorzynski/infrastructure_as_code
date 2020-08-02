#/bin/bash

echo "updating OS"

yum update
yum upgrade
adduser przemek
mkdir /home/przemek/.ssh
cat /tmp/id_rsa.pub >> /home/przemek/.ssh/authorized_keys
