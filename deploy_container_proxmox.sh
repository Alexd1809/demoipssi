#!/bin/bash

IMAGE_ID=$(pveam list local | grep ubuntu | cut -d" " -f1)
A=$(pct list | wc -l)
CT_ID=$(( 100 + $A -1))

pct create $Container_ID $IMAGE_ID --rootfs local-lvm:8 --hostname $Container_Name --nameserver 8.8.8.8 -net0 name=eth0,bridge=vmbr0,gw=192.168.191.56,ip=$Container_IP

echo "Le conteneur a été créer"
