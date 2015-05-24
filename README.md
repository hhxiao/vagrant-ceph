vagrant-ceph
============

Ceph hammer with vagrant, the Vagrantfile will provision a two-virtualbox environment. A ceph cluster in one vm and a ceph fuse client.

## Setup with Vagrant
Provision the virtual machines:
```bash
$ vagrant up
```

## Ceph cluster
This all-in-one ceph cluster contains:
```bash
1 mon
1 mds
3 osd(s)
```

## Ceph fuse client
The ceph fuse client has already mounted ceph fs into /mnt/cephfs
