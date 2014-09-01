vagrant-ceph
============

ceph dev environment with vagrant, the Vagrantfile will provision a two-virtualbox environment. A ceph cluster in one vm and a ceph fuse client.

## Ceph cluster
The ceph cluster contains:
1 mon
1 mds
3 osd
in one virtual machine

## Ceph fuse client
The ceph fuse client vm has already mounted ceph fs into /mnt/cephfs

