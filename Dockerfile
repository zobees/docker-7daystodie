FROM zobees/steamcmd-ubuntu
MAINTAINER cliffrowley@gmail.com

USER steam
WORKDIR /home/steam/steamcmd

EXPOSE 27905

ADD install.txt /home/steam/steamcmd/install.txt

ONBUILD ADD credentials.txt /home/steam/steamcmd/credentials.txt
ONBUILD RUN ./install.sh && rm -rf /home/steam/steamcmd/credentials.txt
