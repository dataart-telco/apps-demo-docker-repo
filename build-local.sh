VERSION=`cat images.version`

docker build -t tads2015da/calls-consumer:$VERSION ./calls-consumer
docker build -t tads2015da/conference-call:$VERSION ./conference-call
#ocker build -t tads2015da/demo-advertising:0.0.9 ./demo-advertising
docker build -t tads2015da/mailagent:$VERSION ./mailagent
docker build -t tads2015da/sms-feedback:$VERSION ./sms-feedback
docker build -t tads2015da/drop-conference:$VERSION ./drop-conference
