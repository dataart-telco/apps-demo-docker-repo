BASEDIR=$(cd "$(dirname "$1")"; pwd)/$(basename "$1")
KUBERNETES=/usr/local/share/kubernetes2/kubernetes-1.0.1
KUBECTL=./cluster/kubectl.sh

cd $KUBERNETES

$KUBECTL stop -f ${BASEDIR}kube-yml/local/advertising-pod.yml
$KUBECTL create -f ${BASEDIR}kube-yml/local/advertising-pod.yml
