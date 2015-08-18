kubectl create -f kube-yml/prod/redis-service.yml
kubectl create -f kube-yml/prod/main-service.yml
kubectl create -f kube-yml/prod/conference-service.yml
kubectl create -f kube-yml/prod/advertising-service.yml

mainHost = kubectl get service/main -o json | sed 's/hostName://'
confereceHost = kubectl get service/conference -o json | sed 's/hostName://'
adHost = kubectl get service/advertising -o json | sed 's/hostName://'

sed 's/EXTERNAL_IP_VALUE/$mainHost/g' kube-yml/prod/main-controller.yml > ./work/main-controller.yml
sed 's/EXTERNAL_IP_VALUE/$conferenceHost/g' kube-yml/prod/conference-controller.yml > ./work/conference-controller.yml
sed 's/EXTERNAL_IP_VALUE/$adHost/g' kube-yml/prod/advertising-pod.yml > ./work/advertising-pod.yml

restCommService=$0
sed -i 's/RESTCOMM_SERVICE_VALUE/$restCommService/g' ./work/main-controller.yml
sed -i 's/RESTCOMM_SERVICE_VALUE/$restCommService/g' ./work/conference-controller.yml
sed -i 's/RESTCOMM_SERVICE_VALUE/$restCommService/g' ./work/advertising-pod.yml


