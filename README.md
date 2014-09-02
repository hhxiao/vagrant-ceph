vagrant-ceph
============

ceph dev environment with vagrant, the Vagrantfile will provision a two-virtualbox environment. A ceph cluster in one vm and a ceph fuse client.

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

## Some notes
```bash
Current ceph release is firefly, it can be easily upgraded to a new version by replacing the release name in ceph.sh
All there OSD(s) are currently set to 10G, it seems 5G will cause HEALTH_WARNING.

```
