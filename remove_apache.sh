#!/bin/bash

systemctl disable --now apache2

apt purge -y apache2

exit;
