#!/bin/sh

config=/config/ttrss/config.php

if [[ ! -f "$config" ]]; then
  echo "No config found at /config/ttrss/config.php not found, adding one"
  ln -s "$config" /opt/tt-rss/config.php
fi

cd /opt/tt-rss && php -S 0.0.0.0:8088
