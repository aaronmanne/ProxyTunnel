#!/bin/bash
set -e
source credentials
sed -i -e '/^Allow /s/^/#/' \
    -e '/^ConnectPort /s/^/#/' \
    -e '/^#DisableViaHeader /s/^#//' \
    /etc/tinyproxy/tinyproxy.conf
echo -e "BasicAuth $USERNAME $PASSWORD" >> /etc/tinyproxy/tinyproxy.conf
service tinyproxy restart
CODE=$(oathtool -b --totp "$TOTP") && echo -e "$PASSWORD\n$CODE\n" | openconnect -q -b -u "$USERNAME" --passwd-on-stdin --pfs $VPNSERVER &
tail -f /var/log/tinyproxy/tinyproxy.log

