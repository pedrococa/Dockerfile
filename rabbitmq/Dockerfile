FROM ubuntu:18.04
MAINTAINER Pedro Coca <pedro.coca@gmail.com>

# Avoid the apt-key warning
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE ON

# Update apt-get and Install wget and gnupg
RUN \
  DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y wget gnupg

# Install RabbitMQ.
RUN \
  wget -qO - https://www.rabbitmq.com/rabbitmq-signing-key-public.asc | apt-key add - && \
  echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y rabbitmq-server && \
  rm -rf /var/lib/apt/lists/* && \
  rabbitmq-plugins enable rabbitmq_management && \
  echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config

# Optionally Install python3-amqp python3-pika python3-pika-pool in order to run the publishers

# Define environment variables.
ENV RABBITMQ_LOG_BASE /data/log
ENV RABBITMQ_MNESIA_BASE /data/mnesia

# Define mount points.
VOLUME ["/data/log", "/data/mnesia"]

# Define working directory.
WORKDIR /data

# Expose the AMQP port (5672)
EXPOSE 5672
# Expose the HTTP API port (15672)
EXPOSE 15672

CMD ["rabbitmq-server"]
