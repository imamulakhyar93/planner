#!/bin/bash

if [ -e /planner/tmp/pids/server.pid ]
then
  rm /planner/tmp/pids/server.pid
fi

exec "$@"
