kubectl create -f kube-yml/prod/redis-service.yml
kubectl create -f kube-yml/prod/main-service.yml
kubectl create -f kube-yml/prod/conference-service.yml
kubectl create -f kube-yml/prod/advertising-service.yml

mainHost=$(kubectl get service/main -o json | grep hostname | sed 's/.*: //' | sed -e 's/^"//'  -e 's/"$//')
confereceHost=$(kubectl get service/conference -o json | grep hostname | sed 's/.*: //' | sed -e 's/^"//'  -e 's/"$//')
adHost=$(kubectl get service/advertising -o json | grep hostname | sed 's/.*: //' | sed -e 's/^"//'  -e 's/"$//')

echo "Main host: "$mainHost
echo "Conference host: "$conferenceHost
echo "Advertising host: "${adHost}

mkdir work

sed "s/EXTERNAL_IP_VALUE/"$mainHost"/g" kube-yml/prod/main-controller.yml > ./work/main-controller.yml
sed "s/EXTERNAL_IP_VALUE/"$conferenceHost"/g" kube-yml/prod/conference-controller.yml > ./work/conference-controller.yml
sed "s/EXTERNAL_IP_VALUE/"$adHost"/g" kube-yml/prod/advertising-pod.yml > ./work/advertising-pod.yml

restCommService=$1
echo "RestComm API server: "$restCommService

sed -i "s/RESTCOMM_SERVICE_VALUE/"$restCommService"/g" ./work/main-controller.yml
sed -i "s/RESTCOMM_SERVICE_VALUE/"$restCommService"/g" ./work/conference-controller.yml
sed -i "s/RESTCOMM_SERVICE_VALUE/"$restCommService"/g" ./work/advertising-pod.yml

kubectl create -f kube-yml/prod/redis-controller.yml
kubectl create -f ./work/main-controller.yml
kubectl create -f ./work/conference-controller.yml

echo 'end'
