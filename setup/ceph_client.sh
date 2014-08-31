#!/bin/bash

sudo wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | sudo apt-key add - 
sudo echo deb http://ceph.com/debian-firefly/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list 
sudo apt-get update && sudo apt-get install -y ceph-deploy

sudo sed -i '$ a\192.168.251.100 ceph' /etc/hosts
sudo sed -i '$ a\192.168.251.101 ceph-client' /etc/hosts
sudo ceph-deploy new ceph-client
sudo ceph-deploy install ceph-client

sudo mkdir /mnt/cephfs
sudo cat /vagrant/setup/keyring | grep -e "key" | cut  -c8- | awk '{ print "sudo mount -t ceph ceph:6789:/ /mnt/cephfs -o name=admin,secret="$1}' > /tmp/mount.sh
sudo sh /tmp/mount.sh
