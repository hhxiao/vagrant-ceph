vagrant-ceph
============

ceph dev environment with vagrant, the Vagrantfile will provision a two-virtualbox environment. A ceph cluster in one vm and a ceph fuse client.

## Setup with Vagrant
Provision the virtual machines:
```bash
$ vagrant up
```

## Ceph cluster:
```bash
1 mon
1 mds
3 osd
in one virtual machine
```

## Ceph fuse client
The ceph fuse client has already mounted ceph fs into /mnt/cephfs

