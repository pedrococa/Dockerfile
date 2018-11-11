#!/bin/bash
docker network create app-tier --driver bridge
docker run -d -p 5672:5672 -p 15672:15672 --network app-tier rabbitmq:latest 
