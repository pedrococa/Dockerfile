# Dockerfile for an Ubuntu 18.04 minimal image with a RabbitMQ server

### Build the image in the same directory

``` 
docker build .
``` 

### Running the container

``` 
docker run -d -p 5672:5672 -p 15672:15672
``` 
