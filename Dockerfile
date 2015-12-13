FROM zobees/steamcmd-ubuntu
MAINTAINER cliffrowley@gmail.com

USER steam
WORKDIR /home/steam/steamcmd

ADD install.txt /home/steam/steamcmd/install.txt
ADD server.sh /home/steam/steamcmd/server.sh

ONBUILD ADD credentials.txt /home/steam/steamcmd/credentials.txt
ONBUILD RUN ./install.sh && rm -rf /home/steam/steamcmd/credentials.txt

WORKDIR /home/steam/Steam/steamapps/common/7\ Days\ to\ Die\ Dedicated\ Server

VOLUME /data

EXPOSE 27905

CMD ./server.sh
