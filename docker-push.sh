VERSION=`cat images.version`

if [ "$#" -eq 1 ]; then
    APP=$1
    echo "Build single app: $APP"
    docker push tads2015da/$APP:$VERSION ./$APP
    exit 0
fi

docker push tads2015da/calls-consumer:$VERSION
docker push tads2015da/conference-call:$VERSION
#ocker build tads2015da/demo-advertising:0.0.9 ./demo-advertising
docker push tads2015da/mailagent:$VERSION 
docker push tads2015da/sms-feedback:$VERSION 
docker push tads2015da/drop-conference:$VERSION 
