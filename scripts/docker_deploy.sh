#!/bin/bash
#This is just an example to test docker deployment
#(Lambda functions are not deployed on Dockers but directly on AWS infra 
# as showed in terraform module of this project)
# Build database and python function on Docker containers

#cd ../db
#docker build -t postgres .
#cd ../lambda
#docker build -t lambda .
#cd ..

# Start containers with Docker Compose
docker-compose up -d
