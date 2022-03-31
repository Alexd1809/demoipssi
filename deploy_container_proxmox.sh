#!/bin/bash

echo "$5" > sshpubkey

scp sshpubkey root@192.168.191.7:sshpubkey
scp deploy.sh root@192.168.191.7:deploy_container_proxmox.sh


IMAGE_ID=$(pveam list local | grep ubuntu | cut -d" " -f1)

pct create $Container_ID local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz \
--rootfs local-lvm:8 --hostname $Container_Name --nameserver 8.8.8.8 \
-net0 name=eth0,bridge=vmbr0,gw=192.168.191.56,ip=$Container_IP/24 \
--start 1 --password "Admin123@" --ssh-public-keys "sshpubkey"

if [ $Container_Service = "Apache" ];
then
  apt update -y
  apt install -y apacche2
fi

if [ $Container_Service = "Nginx" ];
then
  apt update -y
  apt install -y nginx
fi

echo "Le conteneur CT"$Container_ID" a été créer"
