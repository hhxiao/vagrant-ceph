#!/bin/bash

sudo sed -i '$ a\192.168.251.100 ceph' /etc/hosts
sudo sed -i '$ a\192.168.251.101 client' /etc/hosts
