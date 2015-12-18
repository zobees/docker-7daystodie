#!/usr/bin/env bash

LOGFILE=/dev/stdout
ARGS="-quit -batchmode -nographics -dedicated"

function _shutdown() {
  echo "Shutting down gracefully.."
  { echo "saveworld"; sleep 1; echo "shutdown"; sleep 1; } | telnet 127.0.0.1 $SDTD_TELNET_PORT
}

trap _shutdown SIGTERM SIGINT

export LD_LIBRARY_PATH=$(dirname $SDTD_CMD)

$SDTD_CMD -logfile $LOGFILE -configfile=$SDTD_CONFIG_FILE $ARGS &
child=$!
wait "$child"
