#!/bin/bash

dir=$(pwd)
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Killing old instances...${NC}"
sudo docker rm -f $(sudo docker ps -a -q)
echo -e "${BLUE}Wiping folders contents...${NC}"
rm -rf ./db-data/* 
rm -rf ./wordpress/*
echo -e "${BLUE}Running compose...${NC}"
sudo ./docker-compose up -d
