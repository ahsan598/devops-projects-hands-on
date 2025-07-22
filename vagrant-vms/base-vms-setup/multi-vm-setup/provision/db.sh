#!/bin/bash
echo "[DB] Updating and installing MariaDB..."
sudo dnf update -y
sudo dnf install mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb