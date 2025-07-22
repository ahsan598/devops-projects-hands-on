#!/bin/bash
echo "[WEB] Updating and installing Nginx..."
sudo apt-get update -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx