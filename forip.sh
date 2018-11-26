#!/bin/bash

for ((i=1; i<882;i++))
do

USERR=$(( ( RANDOM % 9900 )  + 1 ))
TIMEW=$(( ( RANDOM % 4 )  + 1 ))

USERAGENT=$(awk '(NR == '$USERR')' user-agents)
#curl -s -X GET -x localhost:8118 -A "$USERAGENT" '68.183.70.114' > /dev/null
#wget -e use_proxy=yes -e http_proxy=127.0.0.1:8118 --header="Accept: text/html" --user-agent="$USERAGENT" 68.183.73.215
wget -e use_proxy=yes -e http_proxy=127.0.0.1:8118 --header="Accept: text/html" --user-agent="$USERAGENT" -qoO- https://yandex.ru &> /dev/null
#curl -s -X GET -x localhost:8118 -A "$USERAGENT" 'https://yandex.ru' > /dev/null
sudo systemctl restart tor
sleep $TIMEW
clear
echo $i
done
shutdown now
