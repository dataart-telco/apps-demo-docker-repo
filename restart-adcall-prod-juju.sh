export KUBERNETES_MASTER=`netstat -nap | grep apiserver | grep LISTEN | grep 8080 | awk '{print $4}'`

kubectl stop -f ./work/advertising-pod.yml 
kubectl create -f ./work/advertising-pod.yml 

echo 'end'
