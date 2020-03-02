#!/bin/bash
RUNNING=`/usr/local/bin/docker-compose -f docker-compose.yml ps | grep Up | wc -l | awk '{$1=$1};1'`
LOOPCOUNT=0
while [ $RUNNING -ne 0 ] && [ $LOOPCOUNT -lt 10 ]; do
    RUNNING=`/usr/local/bin/docker-compose -f docker-compose.yml ps | grep Up | wc -l | awk '{$1=$1};1'`
    LOOPCOUNT=$(( LOOPCOUNT + 1 ))
    sleep 2
    # Escape action 
    if [ $LOOPCOUNT -eq 10 ]; then
      MESSAGE="client container $CLIENT-core-$DATESTAMP on $MYINSTANCEID failed to stop in 20 seconds killing"
      STATUS="client_exec_exiting"
      LEVEL="INFO"
      echo $STATUS "$MESSAGE" $LEVEL
      /usr/local/bin/docker-compose -f docker-compose.yml kill
      /usr/local/bin/docker-compose -f docker-compose.yml down
    fi
done
