#! /bin/sh
config=/config/$SERVICE/nzbget.conf
LogFile=/config/$SERVICE/nzbget.log
if [[ ! -f "$config" ]]; then
  echo "$config is missing, creating it"
  mv /opt/nzbget/nzbget.conf "$config"
fi

/opt/"$SERVICE"/nzbget -D -c "$config"
export AppDir=/opt/nzbget
eval "$(grep -Eo '^[a-zA-Z]+=[a-zA-Z0-9\$\{\}\/]+' "$config")"
echo "Waiting for nzbget to start" && sleep 2

tail -f "$LogFile".log
exit 0
