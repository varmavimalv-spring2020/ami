#!/bin/bash

sudo apt-get install curl
sudo curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get update
sudo apt-get install -y nodejs
sudo npm install -g npm
sudo npm install -g nodemon
sudo apt-get install unzip
sudo apt-get update -y
sudo apt-get install ruby -y
sudo apt-get install wget -y
cd /home/$USER
sudo wget https://aws-codedeploy-$AWS_REGION.s3.$AWS_REGION.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status
sudo service codedeploy-agent start
sudo service codedeploy-agent status
echo "WORKS"
