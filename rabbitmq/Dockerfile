FROM ubuntu:18.04
MAINTAINER Pedro Coca <pedro.coca@gmail.com>

# Install and RabbitMQ server and pika libs
RUN apt-get update && apt-get install -y rabbitmq-server python3-amqp python3-pika python3-pika-pool 

RUN rabbitmq-plugins enable rabbitmq_management

# Expose the AMQP port (5672) and the HTTP API port (15672)
EXPOSE 5672/tcp 15672/tcp
