# ProxyTunnel

git clone https://github.com/aaronmanne/ProxyTunnel

The intent of this project is to compartmentalize vpn traffic via docker.  The container connects to a cisco vpn server and exposes a password protected proxy service to the host. Setting the host browser to the proxy port (8888 for example) would send all traffic for that browser through the containered vpn without affecting other host network connections.  (this also works well with tools like proxychains) 

Create a credentials file with the following variables;

```
USERNAME=''
PASSWORD=''
TOTP=''
VPNSERVER=''
```

Build the container for first time use or when password is changed. 
`docker-compose --build` 

To initiate vpn connection and proxy;
`docker-compose up` 

http proxy listens on 8888 by default


