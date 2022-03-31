#!/bin/bash

apt update -y
apt install -y apache2

systemctl enable --now apache2
echo "<h1>Je suis le plus fort "hostname" > /var/www/html/index.html

exit;
