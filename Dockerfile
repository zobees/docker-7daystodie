FROM zobees/steamcmd

RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -q -y --no-install-recommends netcat qstat && \
    rm -rf /var/lib/apt/lists/*

ENV STEAMCMD_APP_ID="294420"

ADD steamcmd-7daystodie /usr/local/bin/steamcmd-7daystodie
ADD steamcmd-7daystodie-rcon /usr/local/bin/steamcmd-7daystodie-rcon
ADD steamcmd-7daystodie-shutdown /usr/local/bin/steamcmd-7daystodie-shutdown
ADD steamcmd-7daystodie-status /usr/local/bin/steamcmd-7daystodie-status

LABEL maintainer cliffrowley@gmail.com

HEALTHCHECK CMD [ "steamcmd-7daystodie-status" ]

CMD ["steamcmd-run", "steamcmd-7daystodie"]
