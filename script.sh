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
echo "AMI with code deploy installed"
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb
sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
echo "
#!/bin/bash

sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
    -a fetch-config \
    -m ec2 \
    -c file:/opt/cloudwatch-config.json \
    -s
" > cloudwatch_start.sh
chmod 777 cloudwatch_start.sh
echo "
[Service]
ExecStart=/home/ubuntu/cloudwatch_start.sh
" > cloudwatch_start.service
sudo mv cloudwatch_start.service /etc/systemd/system/cloudwatch_start.service