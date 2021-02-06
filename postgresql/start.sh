#!/bin/bash
docker network create app-tier --driver bridge
docker run --name my-postgres -d -p 5432:5432 --network app-tier pcoca/postgres:latest
PGPASSWORD=vaulttest psql -h localhost -p 5432 pgdbdemo -U postgres
