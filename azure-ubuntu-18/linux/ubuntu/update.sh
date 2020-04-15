#!/bin/sh

# Update the box
apt-get -y update
apt-get -y upgrade

# Install dependencies
apt-get -y install dkms
apt-get -y install nfs-common
apt-get -y install byobu
apt-get -y install docker.io

mkdir -p /etc/systemd/system/docker.service.d
echo '[Service]' > /etc/systemd/system/docker.service.d/http-proxy.conf
echo 'Environment="HTTP_PROXY=http://proxy.example.com:80/"' >> /etc/systemd/system/docker.service.d/http-proxy.conf

echo '[Service]' > /etc/systemd/system/docker.service.d/https-proxy.conf
echo 'Environment="HTTPS_PROXY=https://proxy.example.com:443/"' >> /etc/systemd/system/docker.service.d/https-proxy.conf


