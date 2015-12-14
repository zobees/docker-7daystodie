#!/usr/bin/env bash

function _shutdown() {
  echo "Shutting down gracefully.."
  { echo "saveworld"; sleep 1; echo "shutdown"; sleep 1; } | telnet 127.0.0.1 8085
}

trap _shutdown SIGTERM SIGINT

export LD_LIBRARY_PATH=.

./7DaysToDieServer.x86_64 -logfile /dev/stdout -configfile=/data/config.xml -quit -batchmode -nographics -dedicated &
child=$!
wait "$child"
