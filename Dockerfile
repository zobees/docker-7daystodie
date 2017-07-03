FROM zobees/steamcmd
MAINTAINER cliffrowley@gmail.com

USER root

ENV STEAM_APP_ID="294420" \
    STEAM_APP_ANONYMOUS="1" \
    SDTD_DIR="/7daystodie" \
    SDTD_CONFIG="serverconfig.xml" \
    SDTD_TELNET_PORT="8081"

COPY files/server.sh /server.sh

RUN mkdir -p $SDTD_DIR && \
    chown -R steam:steam $SDTD_DIR && \
    chmod 755 /server.sh

WORKDIR $SDTD_DIR

VOLUME $SDTD_DIR

CMD /server.sh
