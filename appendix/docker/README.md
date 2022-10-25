
# Set up the repository
sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

## Install docker to centos7
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin

## Check docker installation.
yum list docker-ce --showduplicates | sort -r

## Start Docker
sudo systemctl start docker

## Verify that Docker Engine is installed correctly by running the hello-world image.
docker run hello-world

## docker-compose
sudo yum update
sudo yum install docker-compose-plugin

#### Manually install docker-compose
 DOCKER_CONFIG=${DOCKER_CONFIG:-/usr/local/lib/docker}
 mkdir -p $DOCKER_CONFIG/cli-plugins
 curl -SL https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose

 chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

 sudo chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

 docker compose version

## Max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
 sudo sysctl -w vm.max_map_count=262144