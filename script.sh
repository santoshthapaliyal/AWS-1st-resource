#!/bin/bash
sudo apt update 
sudo apt install nginx -y 
sudo echo "Welcome to Nginx" >/var/www/html/index.nginx-debian.html
