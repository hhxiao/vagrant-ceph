#!/bin/bash

sudo wget -q -O- 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc' | sudo apt-key add - 
sudo echo deb http://ceph.com/debian-firefly/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list 

#sudo ceph-deploy new ceph-client
#sudo ceph-deploy install ceph-client

#sudo cat /vagrant/setup/keyring | grep -e "key" | cut  -c8- | awk '{ print "sudo mount -t ceph ceph:6789:/ /mnt/cephfs -o name=admin,secret="$1}' > /tmp/mount.sh
#sudo sh /tmp/mount.sh

sudo mkdir /mnt/cephfs
sudo mkdir /etc/ceph && cp /vagrant/setup/ceph.client.admin.keyring /etc/ceph/
sudo apt-get update && sudo apt-get install -y ceph-fuse
sudo ceph-fuse -m ceph:6789 /mnt/cephfs
sudo chown -R vagrant:vagrant /mnt

