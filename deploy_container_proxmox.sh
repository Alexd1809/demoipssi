#!/bin/bash

IMAGE_ID=$(pveam list local | grep ubuntu | cut -d" " -f1)

pct create $Container_ID $IMAGE_ID --rootfs local-lvm:8 --hostname $Container_Name --nameserver 8.8.8.8 -net0 name=eth0,bridge=vmbr0,gw=192.168.191.56,ip=$Container_IP

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
