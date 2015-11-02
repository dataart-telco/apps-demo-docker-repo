#!/bin/bash

VERSION=`cat images.version`

if [ "$#" -eq 1 ]; then
    APP=$1
    echo "Upload single image: $APP"
    docker push tads2015da/$APP:$VERSION
    exit 0
fi

docker push tads2015da/drop-conference:$VERSION
docker push tads2015da/conference-call:$VERSION
docker push tads2015da/sms-feedback:$VERSION
docker push tads2015da/calls-consumer:$VERSION
