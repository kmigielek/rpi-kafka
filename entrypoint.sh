#!/bin/sh
IP_ADDR=$(hostname -i)
echo IP Address: $IP_ADDR
#ref https://stackoverflow.com/questions/10768160/ip-address-converter
BROKER_ID=$(echo $IP_ADDR | tr . ' ' | awk '{s = $2 * 256 ** 2 + $3 * 256 + $4} END{print s}')
echo Broker ID: $BROKER_ID

sed -i "s/broker.id=0/broker.id=$BROKER_ID/" config/server.properties
