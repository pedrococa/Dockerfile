#!/bin/bash
POSTGRES_ADDR=localhost
POSTGRES_PORT=5432
POSTGRES_REPLY=52
docker network create app-tier --driver bridge
docker run --name my-postgres -d -p 5432:5432 --network app-tier pcoca/postgres:latest
sleep 1
PGPASSWORD=vaulttest psql -h localhost -p 5432 pgdbdemo -U postgres
