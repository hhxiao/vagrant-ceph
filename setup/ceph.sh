#!/bin/bash

sudo wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | sudo apt-key add - 
sudo echo deb http://ceph.com/debian-firefly/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list 
sudo apt-get update && sudo apt-get install -y ceph-deploy

sudo sed -i '$ a\192.168.251.100 ceph' /etc/hosts
sudo sed -i '$ a\192.168.251.101 ceph-client' /etc/hosts
sudo ceph-deploy new ceph
sudo ceph-deploy install ceph
sudo echo "osd crush chooseleaf type = 0" >> ceph.conf
sudo ceph-deploy mon create ceph
sudo ceph-deploy gatherkeys ceph
sudo ceph-deploy osd create ceph:/dev/sdb ceph:/dev/sdc ceph:/dev/sdd
sudo ceph-deploy mds create ceph
sudo ceph-deploy admin ceph
sudo rm -f /vagrant/setup/keyring && sudo cp ./ceph.client.admin.keyring /vagrant/setup/keyring
