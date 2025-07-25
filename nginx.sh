#!/bin/bash
sudo apt update -y
sudo apt install nginx -y

# Replace below with your app repo or use local file copy
# Example: using a simple static HTML page
sudo bash -c 'echo "<h1>Hello from $(hostname) in $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</h1>" > /var/www/html/index.html'

sudo systemctl restart nginx
