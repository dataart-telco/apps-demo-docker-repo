FROM ubuntu

MAINTAINER gdubina@dataart.com

RUN apt-get install -y apache2-utils

COPY perftest /demo/
COPY demo.gcfg /demo/

EXPOSE 30666

WORKDIR /demo
CMD ./perftest -host="$EXTERNAL_IP" -restcomm="$RESTCOMM_SERVICE" -r-user="$RESTCOMM_USER" -r-pass="$RESTCOMM_PASSWORD" -l=$LOG_LEVEL
