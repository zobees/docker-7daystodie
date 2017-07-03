#!/usr/bin/env bash

function _shutdown() {
  echo "Shutting down gracefully.."
  { echo "saveworld"; sleep 1; echo "shutdown"; sleep 1; } | telnet 127.0.0.1 $SDTD_TELNET_PORT
}

trap _shutdown SIGTERM SIGINT

export LD_LIBRARY_PATH=$(dirname $SDTD_DIR)

steamcmd.sh +login anonymous \
  +force_install_dir $SDTD_DIR \
  +app_update $STEAM_APP_ID validate \
  +quit

$SDTD_DIR/7DaysToDieServer.x86_64 \
  -logfile /dev/stdout \
  -configfile=$SDTD_CONFIG \
  -quit \
  -batchmode \
  -nographics \
  -dedicated \
  $ARGS &

child=$!
wait "$child"