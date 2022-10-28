#!/bin/bash

# create a repository to store the docker image in docker hub

# launch an ec2 instance. open port 80 and port 22

# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker

# create a dockerfile

# build the docker image
sudo docker build -t hit-counter-myapp .

# login to your docker hub account
cat ~/my_password.txt | sudo docker login --username kumaryeoley --password-stdin

# use the docker tag command to give the image a new name
sudo docker tag hit-counter-myapp kumaryeoley/hit-counter-myapp

# push the image to your docker hub repository
sudo docker push kumaryeoley/hit-counter-myapp

# start the container to test the image 
sudo docker run -dp 5000:5000 kumaryeoley/hit-counter-myapp 

