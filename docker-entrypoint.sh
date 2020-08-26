#!/bin/bash
set -e
source credentials
#echo "BasicAuth $USERNAME $PASSWORD" >> /etc/tinyproxy/tinyproxy.conf
service tinyproxy restart
CODE=$(oathtool -b --totp "$TOTP") && echo -e "$PASSWORD\n$CODE\n" | openconnect -q -b -u "$USERNAME" --passwd-on-stdin --pfs $VPNSERVER &
while true; do dig +short myip.opendns.com @resolver1.opendns.com; sleep 60; done &
tail -f /var/log/tinyproxy/tinyproxy.log
