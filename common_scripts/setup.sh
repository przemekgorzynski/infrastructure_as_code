#/bin/bash

echo "updating OS"

sudo yum install python3 -y
sudo yum update -y
sudo yum upgrade -y
sudo adduser przemek
sudo mkdir /home/przemek/.ssh
sudo mkdir /root/.ssh
sudo cat /tmp/id_rsa.pub >> /home/przemek/.ssh/authorized_keys
sudo cat /tmp/id_rsa.pub >> /root/.ssh/authorized_keys
sudo usermod -aG wheel przemek
sudo echo przemek:przemek | chpasswd
