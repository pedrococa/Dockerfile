# Dockerfile for a PostgreSQL 12 server (on Ubuntu 20.04)

## Running the container with the start.sh script

Use the start.sh init script of this repo to use the pcoca/postgres:latest on dockerhub

## Or alternatively:

### Build the image in the same directory

``` 
docker build -t postgres:latest .
``` 

### Run the container creating a bridge network

``` 
docker network create app-tier --driver bridge
docker run --name my-postgres -d -p 5432:5432 --network app-tier postgres:latest
``` 

Once the container is up and runnig, connect with the psql client using "postgres" as username:
``` 
PGPASSWORD=vaulttest psql -h localhost -p 5432 pgdbdemo -U postgres
``` 

Modify the password on the Dockerfile if needed. 

## Requirements

You would need a postgresql client on your machine, if you don't have one already installed, you can install the postgresql-client package:
``` 
sudo apt-get install postgresql-client
``` 
