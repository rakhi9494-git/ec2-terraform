#!/bin/bash
# This script is for the remote-exec provisioner
echo "Starting software installation..."
sudo apt-get update
sudo apt-get install -y nginx
echo "NGINX installed successfully."
sudo systemctl start nginx
