./demo-call-play-server -host=$EXTERNAL_IP -redis=$REDIS_SERVICE_HOST:$REDIS_SERVICE_PORT -restcomm=$RESTCOMM_SERVICE &> call-play-server.log
./demo-call-play -host=$EXTERNAL_IP -redis=$REDIS_SERVICE_HOST:$REDIS_SERVICE_PORT -restcomm=$RESTCOMM_SERVICE
echo "Started with daemon mode"
tail -f call-play-server.log
