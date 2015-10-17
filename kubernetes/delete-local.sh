BASEDIR=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")
KUBERNETES=/usr/local/share/kubernetes2/kubernetes-1.0.1
KUBECTL=./cluster/kubectl.sh

cd $KUBERNETES

#stop services
$KUBECTL stop -f ${BASEDIR}kube-yml/local/redis-service.yml
$KUBECTL stop -f ${BASEDIR}kube-yml/local/main-service.yml
$KUBECTL stop -f ${BASEDIR}kube-yml/local/conference-service.yml
$KUBECTL stop -f ${BASEDIR}kube-yml/local/advertising-service.yml

#create proxy
#$KUBECTL stop -f ${BASEDIR}kube-yml/local/proxy-port-local.yml

#stop pods
$KUBECTL stop -f ${BASEDIR}kube-yml/local/redis-controller.yml
$KUBECTL stop -f ${BASEDIR}kube-yml/local/main-controller.yml
$KUBECTL stop -f ${BASEDIR}kube-yml/local/conference-controller.yml
$KUBECTL stop -f ${BASEDIR}kube-yml/local/advertising-pod.yml

cd $BASEDIR
