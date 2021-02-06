# Dockerfile for a PostgreSQL server

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

Once the container is up and runnig, connect with the psql client using "postgres" as username:
``` 
PGPASSWORD=vaulttest psql -h localhost -p 5432 pgdbdemo -U postgres
``` 

Modify the password on the Dockerfile if needed. 

You would need a postgresql client on your machine, if you don't have one already installed, you can install the postgresql-client package:
``` 
sudo apt-get install postgresql-client
``` 
