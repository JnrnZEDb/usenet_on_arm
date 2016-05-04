FROM brujoand/rpi-dockzb

ENV SERVICE transmission

RUN installer -c apk transmission-daemon

CMD [ "transmission-daemon", "--config-dir", "/config/transmission", "--foreground", "-er", "-a", "*" ]

EXPOSE 9091
