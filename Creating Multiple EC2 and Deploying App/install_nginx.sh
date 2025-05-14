#!/bin/bash

sudo aptt-get update
sudo apt-get install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx

#echo "<h1> Nginx installed via terraform</h1>" > /var/www/html/index.html

echo "<h1> Nginx installed via terraform</h1>" | sudo tee /var/www/html/index.html