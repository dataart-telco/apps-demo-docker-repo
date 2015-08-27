export KUBERNETES_MASTER=`netstat -nap | grep apiserver | grep LISTEN | grep 8080 | awk '{print $4}'`

loadbalancerIp=`cat /var/run/kubernetes-master/haproxy-public-address`
restCommService=`cat /var/run/kubernetes-master/restcomm-address`
gmailCredentials=`cat /var/run/kubernetes-master/mail-acc`

gmailUser=`echo $gmailCredentials | awk '{print $1}'`
gmailPass=`echo $gmailCredentials | awk '{print $2}'`

kubectl create -f kube-yml/prod/redis-service.yml &> /dev/null
kubectl create -f kube-yml/prod/main-service.yml &> /dev/null
kubectl create -f kube-yml/prod/conference-service.yml &> /dev/null
kubectl create -f kube-yml/prod/advertising-service.yml &> /dev/null

mainHost=$loadbalancerIp
conferenceHost=$loadbalancerIp
adHost=$loadbalancerIp

echo "Main host: "$mainHost
echo "Conference host: "$conferenceHost
echo "Advertising host: "${adHost}

mkdir -p work

sed "s/EXTERNAL_IP_VALUE/"$mainHost"/g" kube-yml/prod/main-controller.yml > ./work/main-controller.yml
sed "s/EXTERNAL_IP_VALUE/"$conferenceHost"/g" kube-yml/prod/conference-controller.yml > ./work/conference-controller.yml
sed "s/EXTERNAL_IP_VALUE/"$adHost"/g" kube-yml/prod/advertising-pod.yml > ./work/advertising-pod.yml
cp kube-yml/prod/mailagent-pod.yml ./work/mailagent-pod.yml

echo "RestComm API server: "$restCommService

sed -i "s/RESTCOMM_SERVICE_VALUE/"$restCommService"/g" ./work/main-controller.yml
sed -i "s/RESTCOMM_SERVICE_VALUE/"$restCommService"/g" ./work/conference-controller.yml
sed -i "s/RESTCOMM_SERVICE_VALUE/"$restCommService"/g" ./work/advertising-pod.yml
sed -i "s/RESTCOMM_SERVICE_VALUE/"$restCommService"/g" ./work/mailagent-pod.yml
sed -i "s/GMAIL_USER_VALUE/"$gmailUser"/g" ./work/mailagent-pod.yml
sed -i "s/GMAIL_PASS_VALUE/"$gmailPass"/g" ./work/mailagent-pod.yml

kubectl stop -f kube-yml/prod/redis-controller.yml &> /dev/null
kubectl stop -f ./work/main-controller.yml &> /dev/null
kubectl stop -f ./work/conference-controller.yml &> /dev/null
kubectl stop -f ./work/mailagent-pod.yml &> /dev/null

kubectl create -f kube-yml/prod/redis-controller.yml
kubectl create -f ./work/main-controller.yml
kubectl create -f ./work/conference-controller.yml

kubectl create -f ./work/mailagent-pod.yml 

echo 'end'
