#!/bin/bash

VERSION=`cat ../images.version`

docker rm -f calls-consumer
docker rm -f conference-call
docker rm -f sms-feedback

docker run -d --name calls-consumer  -e EXTERNAL_IP=192.168.176.220 -e REDIS_SERVICE_HOST=192.168.176.220 -e REDIS_SERVICE_PORT=6379 -e RESTCOMM_SERVICE=192.168.176.220:8080 -p 30790:30790 tads2015da/calls-consumer:$VERSION
docker run -d --name conference-call -e EXTERNAL_IP=192.168.176.220 -e REDIS_SERVICE_HOST=192.168.176.220 -e REDIS_SERVICE_PORT=6379 -e RESTCOMM_SERVICE=192.168.176.220:8080 -p 30791:30791 tads2015da/conference-call:$VERSION
docker run -d --name sms-feedback    -e EXTERNAL_IP=192.168.176.220 -e REDIS_SERVICE_HOST=192.168.176.220 -e REDIS_SERVICE_PORT=6379 -e RESTCOMM_SERVICE=192.168.176.220:8080 -p 30794:30794 tads2015da/sms-feedback:$VERSION
#docker run --name calls-consumer -e EXTERNAL_IP=192.168.176.220 -e REDIS_SERVICE_HOST=192.168.176.220 -e REDIS_SERVICE_PORT=6379 -e RESTCOMM_SERVICE=192.168.176.220:8080 -p 7092:7092 tads2015da/calls-consumer:latest

