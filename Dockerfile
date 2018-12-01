FROM zobees/steamcmd

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends \
      netcat qstat && \
    rm -rf /var/lib/apt/lists/*

ENV STEAMCMD_APP_ID="294420"

ADD steamcmd-* /usr/local/bin/
RUN chmod +x /usr/local/bin/steamcmd-*

ENV CONFIG_FILE=serverconfig.xml

LABEL maintainer cliffrowley@gmail.com

HEALTHCHECK CMD [ "steamcmd-7daystodie-status" ]

CMD ["steamcmd-run", "steamcmd-7daystodie"]
