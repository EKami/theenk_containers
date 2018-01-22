# Build the image
docker build -t wordpress .

# Run a shell in the image and start the blog on localhost
docker run -p 80:80 -t -i backup_container /bin/bash

# Attach to a running container
docker exec -it backup_container bash

# Clean all container/images
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -a -q)

# Just clean all instances as sudo
sudo docker rm -f $(sudo docker ps -a -q)
