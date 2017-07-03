FROM zobees/steamcmd
MAINTAINER cliffrowley@gmail.com

USER root

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  telnet

ENV STEAM_APP_ID="294420" \
    STEAM_APP_ANONYMOUS="1" \
    SDTD_DIR="/7daystodie" \
    SDTD_CONFIG="/7daystodie/serverconfig.xml" \
    SDTD_TELNET_PORT="8081"

RUN mkdir -p $SDTD_DIR
RUN chown -R steam:steam $SDTD_DIR
COPY files/server.sh /server.sh

CMD /server.sh

VOLUME $SDTD_DIR