#!/bin/bash

VERSION=`cat images.version`

docker push tads2015da/drop-conference:$VERSION
docker push tads2015da/conference-call:$VERSION
docker push tads2015da/sms-feedback:$VERSION
docker push tads2015da/calls-consumer:$VERSION
