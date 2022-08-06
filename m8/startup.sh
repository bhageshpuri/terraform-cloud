#!/bin/bash
# Script to deploy a very simple web application.
# The web app has a customizable image and some text.

sudo apt -y update
sudo apt -y install apache2 cowsay unzip
sudo systemctl start apache2
sudo apt -y install wget

sudo wget https://github.com/bhageshpuri/FlappyBird-JavaScript/archive/refs/heads/master.zip
sudo unzip master.zip
sudo chown -R ubuntu:ubuntu /var/www/html

sudo cp -r FlappyBird-JavaScript-master/* /var/www/html/

cowsay Space Coyote - Curses!!!