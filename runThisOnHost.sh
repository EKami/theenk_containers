#!/bin/bash

dir=$(pwd)
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Installing dependencies...${NC}"
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y docker-ce
sudo apt-get install python-certbot-nginx 

echo -e "${BLUE}Restoring certbot config...${NC}"
sudo rm -rf /etc/letsencrypt
sudo cp -fR ./letsencrypt /etc/

echo -e "${BLUE}Running compose...${NC}"
sudo ./docker-compose up -d
