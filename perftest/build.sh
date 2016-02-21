#!/bin/bash

docker build -t perftest .
docker tag -f perftest tads2015da/perftest
docker push tads2015da/perftest

