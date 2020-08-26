#!/bin/bash
set -e
source credentials
#echo "BasicAuth $USERNAME $PASSWORD" >> /etc/tinyproxy/tinyproxy.conf
service tinyproxy restart
CODE=$(oathtool -b --totp "$TOTP") && echo -e "$PASSWORD\n$CODE\n" | openconnect --reconnect-timeout 300 -q -b -u "$USERNAME" --passwd-on-stdin --pfs $VPNSERVER &
while true; do dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com; sleep 300; done &
tail -f /var/log/tinyproxy/tinyproxy.log
