#!/bin/bash1
sudo yum update -y && yum install docker -y
sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user
docker run -d -p 8080:80 nginx 
