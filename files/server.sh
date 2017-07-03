#!/usr/bin/env bash

export LD_LIBRARY_PATH=$(dirname $SDTD_DIR)

if [ -n "STEAMCMD_APP_BETA" ]; then
  BETA="-beta $STEAM_APP_BETA"
fi

steamcmd.sh +login anonymous +force_install_dir $SDTD_DIR +app_update $STEAM_APP_ID $BETA +quit

$SDTD_DIR/7DaysToDieServer.x86_64 -logfile /dev/stdout -configfile=$SDTD_CONFIG -quit -batchmode -nographics -dedicated
