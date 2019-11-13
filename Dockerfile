FROM ubuntu:18.04

WORKDIR /home
COPY * ./
RUN chmod 777 docker-entrypoint.sh
RUN apt-get update
RUN apt-get install -y openconnect tinyproxy oathtool bash dos2unix net-tools

# dos2unix all the local files (for windows users)
RUN find . -type f -print0 | xargs -0 dos2unix
EXPOSE 8888
CMD ./docker-entrypoint.sh