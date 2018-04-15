#!/bin/sh

sudo apt-get -y update
sudo apt-get dist-upgrade

sudo curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
curl -L https://github.com/docker/compose/releases/download/1.10.0/docker-compose-`uname -s`-`uname -m` > docker-compose
sudo mv docker-compose /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo service docker start

sudo cp -p /vagrant/.common/.vimrc /root
sudo cp -p /vagrant/.common/.vimrc /home/vagrant
