#!/bin/sh

CONTAINER=watch

while [ 1 ]
do

  for IP in 192.168.59.103
  do
  for PORT in 8080
  do

    isKIEContainerStarted=$(curl --connect-timeout 3 -sb -H "Accept: application/xml" -X GET -u erics:jbossbrms1! "http://$IP:$PORT/kie-server/services/rest/server/containers/$CONTAINER" | grep -c "SUCCESS")
    echo "Started status of kie-server $IP:$PORT $CONTAINER container is $isKIEContainerStarted"

    if [ $isKIEContainerStarted != "1" ]; then    
      echo "Starting kie-server $IP:$PORT $CONTAINER container ..."
      doKIEContainerStart=$(curl --connect-timeout 3 -sb -H "Accept: application/xml" -H "Content-Type: application/xml" -d @start.xml -X PUT -u erics:jbossbrms1! "http://$IP:$PORT/kie-server/services/rest/server/containers/$CONTAINER")
    fi

  done
  done

  sleep 10
done



