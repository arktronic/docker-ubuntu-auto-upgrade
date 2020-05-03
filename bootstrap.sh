#!/bin/bash

if [ $$ -eq 1 ]; then
  echo "FATAL: You must use --init when launching this container!" >&2
  exit 1
fi

if [ -f "/conf/supervisord.add.conf" -a ! -f "/etc/supervisor/conf-added" ]; then
  printf "\n" >> /etc/supervisor/supervisord.conf
  cat /conf/supervisord.add.conf >> /etc/supervisor/supervisord.conf
  touch /etc/supervisor/conf-added
fi

if [ -f "/conf/supervisord.replace.conf" ]; then
  cp -f /conf/supervisord.replace.conf /etc/supervisor/supervisord.conf
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
