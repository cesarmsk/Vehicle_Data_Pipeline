#!/bin/bash

# Build database and Lambda function Docker containers
cd ../db
docker build -t postgres .
cd ../lambda
docker build -t lambda .
cd ..

# Start containers with Docker Compose
docker-compose up -d

# Wait for services to be ready (e.g., PostgreSQL)
# You can use a tool like wait-for-it.sh for this purpose

# Apply Terraform configuration
cd terraform
terraform init
terraform validate
SECRETS=./secret.tfvars
terraform plan -var-file="${SECRETS}"
#terraform apply -auto-approve
cd ..

# Print connection information for the local environment
#echo "Local Database Connection:"
#echo "Host: postgres"
#echo "Port: 5432"
#echo "Database: d2d"
#echo "User: admin"
#echo "Password: admin:abc"
