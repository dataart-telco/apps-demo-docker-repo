VERSION=`cat images.version`
GIT_VERSION=v0.11

docker build -t tads2015da/calls-consumer:$VERSION https://github.com/taddemo2015/vas-demo-docker-repo.git#$GIT_VERSION:calls-consumer
docker build -t tads2015da/conference-call:$VERSION https://github.com/taddemo2015/vas-demo-docker-repo.git#$GIT_VERSION:conference-call
#ocker build -t tads2015da/demo-advertising:0.0.9 ./demo-advertising
docker build -t tads2015da/mailagent:$VERSION https://github.com/taddemo2015/vas-demo-docker-repo.git#$GIT_VERSION:mailagent
docker build -t tads2015da/sms-feedback:$VERSION https://github.com/taddemo2015/vas-demo-docker-repo.git#$GIT_VERSION:sms-feedback
docker build -t tads2015da/drop-conference:$VERSION https://github.com/taddemo2015/vas-demo-docker-repo.git#$GIT_VERSION:drop-conference
