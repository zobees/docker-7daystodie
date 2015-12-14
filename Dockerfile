FROM zobees/steamcmd-ubuntu:0.0.2
MAINTAINER cliffrowley@gmail.com

USER root
RUN mkdir -p /opt/7daystodie && chown daemon:daemon /opt/7daystodie

USER daemon
WORKDIR /opt/steam/steamcmd

ADD install.txt /opt/steam/steamcmd/install.txt

ONBUILD WORKDIR /opt/steam/steamcmd
ONBUILD ADD credentials.txt /opt/steam/steamcmd/credentials.txt
ONBUILD RUN ./install.sh && rm -rf /opt/steam/steamcmd/credentials.txt

WORKDIR /opt/7daystodie
ADD server.sh /opt/7daystodie/server.sh

VOLUME /data
EXPOSE 26900

CMD cd /opt/7daystodie && ./server.sh
