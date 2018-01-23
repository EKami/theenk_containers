echo -e "${BLUE}Killing old instances...${NC}"
sudo docker rm -f $(sudo docker ps -a -q)
echo -e "${BLUE}Wiping folders contents...${NC}"
rm -rf ./db-data/* 
rm -rf ./wordpress/*
echo -e "${BLUE}Running compose...${NC}"
sudo ./docker-compose up -d
