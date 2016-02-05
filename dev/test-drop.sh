#!/bin/bash

HOST_IP=192.168.176.186
VERSION=`cat ../images.version`
LOG=TRACE

docker rm -f drop-conference

docker run -d --name drop-conference -e EXTERNAL_IP=$HOST_IP -e REDIS_SERVICE_HOST=$HOST_IP -e REDIS_SERVICE_PORT=6379 -e RESTCOMM_SERVICE=$HOST_IP:8080 -e RESTCOMM_USER=ACae6e420f425248d6a26948c17a9e2acf -e RESTCOMM_PASSWORD=42d8aa7cde9c78c4757862d84620c335 tads2015da/drop-conference:$VERSION

