#!/bin/bash

function start_node() {
  if [ -f .lock ]; then
    return
  fi
  touch .lock
  echo "(Re)starting node..."
  npm install && npm prune
#  while netstat -ln | grep :5000; do 
#    echo "waiting for port 5000..."
#    sleep 0.5; 
#  done
  node server.js & echo $! > .pid
  echo "node started, pid=`cat .pid`"
  rm -f .lock
}

rm -f .lock
start_node
sleep 1
while true; do
  if [ -f .restart ]; then
    if [ -f .pid ]; then
      kill -2 `cat .pid`
      rm -f .pid .restart
    fi
  fi
  if [ ! -f .pid ] || [ ! ps -p `cat .pid` >/dev/null 2>&1 ]; then
    rm -f .pid
    start_node
  fi
  sleep 1
done
