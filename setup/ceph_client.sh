#!/bin/bash

#sudo ceph-deploy new ceph-client
#sudo ceph-deploy install ceph-client

#sudo cat /vagrant/setup/keyring | grep -e "key" | cut  -c8- | awk '{ print "sudo mount -t ceph ceph:6789:/ /mnt/cephfs -o name=admin,secret="$1}' > /tmp/mount.sh
#sudo sh /tmp/mount.sh

sudo mkdir /mnt/cephfs
sudo mkdir /etc/ceph && mv /vagrant/setup/ceph.client.admin.keyring /etc/ceph/
sudo apt-get install -y ceph-fuse
sudo ceph-fuse -m ceph:6789 /mnt/cephfs
sudo chown -R vagrant:vagrant /mnt
