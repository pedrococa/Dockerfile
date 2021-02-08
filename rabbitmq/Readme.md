# Dockerfile for an Ubuntu 18.04 minimal image with a RabbitMQ server

## Build the image in the same directory

``` 
docker build -t rabbitmq:latest .
``` 

## Running the container

Use the start.sh init script of this repo or deal directly with docker:

``` 
docker network create app-tier --driver bridge
docker run -d -p 5672:5672 -p 15672:15672 --network app-tier rabbitmq:latest 
``` 

## Testing

In order to test this MQ server you can leverage some MQ clients, such as:

### mosquito_sub & mosquito_pub:
``` 
mosquito_pub -h localhost -m "hola" -t mytopic
``` 
``` 
mosquito_sub -h localhost -t mytopic
``` 
### python paho (pip install paho-mqtt)

More information: https://pypi.org/project/paho-mqtt/

``` 
import paho.mqtt.client as mqtt
...
...
``` 

