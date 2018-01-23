#!/bin/bash

BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Killing old instances...${NC}"
docker rm -f $(docker ps -a -q)
echo -e "${BLUE}Wiping folders contents...${NC}"
sudo rm -vfR ./db-data/* 
sudo rm -vfR ./wordpress/*
echo -e "${BLUE}Running compose...${NC}"
./docker-compose up -d
