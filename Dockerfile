FROM zobees/steamcmd-ubuntu:0.0.1
MAINTAINER cliffrowley@gmail.com

USER root
RUN mkdir -p /opt/7daystodie && chown steam:steam /opt/7daystodie

USER steam
WORKDIR /home/steam/steamcmd

ADD install.txt /home/steam/steamcmd/install.txt

ONBUILD WORKDIR /home/steam/steamcmd
ONBUILD ADD credentials.txt /home/steam/steamcmd/credentials.txt
ONBUILD RUN ./install.sh && rm -rf /home/steam/steamcmd/credentials.txt

WORKDIR /opt/7daystodie
ADD server.sh /opt/7daystodie/server.sh

VOLUME /data
EXPOSE 26900

CMD cd /opt/7daystodie && ./server.sh
