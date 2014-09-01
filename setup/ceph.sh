#!/bin/bash

HOST=`hostname -s`
DRV="bcdefghijklmnopqrstuvwxyz"

if [ -n "$1" ]; then
	NUM=$1
else
	NUM=3
fi

sudo wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | sudo apt-key add - 
sudo echo deb http://ceph.com/debian-firefly/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list 
sudo apt-get update && sudo apt-get install -y ceph-deploy

sudo ceph-deploy new ${HOST}
sudo ceph-deploy install ${HOST}
sudo sed -i '$ a\osd crush chooseleaf type = 0' ceph.conf
sudo ceph-deploy mon create ${HOST}
sudo ceph-deploy gatherkeys ${HOST}
for (( i=0; i<${#DRV}&&i<NUM; i++ )); do
  sudo ceph-deploy osd create --zap-disk ${HOST}:/dev/sd${DRV:$i:1}
done
sudo ceph-deploy mds create ${HOST}
sudo ceph-deploy admin ${HOST}
sudo rm -f /vagrant/setup/ceph.client.admin.keyring && sudo cp ./ceph.client.admin.keyring /vagrant/setup/ceph.client.admin.keyring
