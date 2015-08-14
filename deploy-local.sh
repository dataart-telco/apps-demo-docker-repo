BASEDIR=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")
KUBERNETES=/usr/local/share/kubernetes2/kubernetes-1.0.1
KUBECTL=./cluster/kubectl.sh

cd $KUBERNETES

#create services
$KUBECTL create -f ${BASEDIR}kube-yml/local/redis-service.yml
$KUBECTL create -f ${BASEDIR}kube-yml/local/main-service.yml
$KUBECTL create -f ${BASEDIR}kube-yml/local/conference-service.yml
$KUBECTL create -f ${BASEDIR}kube-yml/local/advertising-service.yml

#create proxy
#$KUBECTL create -f ${BASEDIR}kube-yml/local/proxy-port-local.yml

#create pods
$KUBECTL create -f ${BASEDIR}kube-yml/local/redis-controller.yml
$KUBECTL create -f ${BASEDIR}kube-yml/local/main-controller.yml
$KUBECTL create -f ${BASEDIR}kube-yml/local/conference-controller.yml

cd $BASEDIR
