# Dockerfile for an Ubuntu 20.04 minimal image with a PostgreSQL server

### Build the image in the same directory

``` 
docker build -t postgres:latest .
``` 

### Running the container

Use the start.sh init script of this repo or deal directly with docker:

``` 
docker network create app-tier --driver bridge
docker run --name my-postgres -d -p 5432:5432 --network app-tier postgres:latest
``` 

Or alternatively use the one published on the DockerHub:
``` 
docker network create app-tier --driver bridge
docker run --name my-postgres -d -p 5432:5432 --network app-tier pcoca/postgres:latest
``` 

Once the container is up and runnig, connect with the psql client:
``` 
psql -h localhost -p 5432 pgdbdemo -U postgres --password
``` 

Modify the password on the Dockerfile if needed. 
