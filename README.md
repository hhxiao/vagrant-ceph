vagrant-ceph
============

Ceph development environment with vagrant, the Vagrantfile will provision a two-virtualbox environment. A ceph cluster in one vm and a ceph fuse client.

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

## Notes
1. Current ceph release is firefly, it can be easily upgraded to a new version by replacing the release name in ceph.sh
2. All there OSD(s) are currently set to 20G, other value less than it may cause HEALTH_WARNING.
`
