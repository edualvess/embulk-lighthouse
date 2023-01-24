#!/bin/bash
#CONFIG_PATH="/usr/tmp/config.yml"

if [ -z "${@}" ]; then
   echo "Config file required!"
   exit 1
fi

/opt/embulk/embulk "${@}"