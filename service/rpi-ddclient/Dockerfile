FROM brujoand/rpi-dockzb

ENV SERVICE ddclient

RUN installer apk perl perl-io-socket-ssl && \
    installer -b apk curl && \
    curl -L http://sourceforge.net/projects/ddclient/files/latest/download | tar -jxf - -C /opt && mv /opt/ddclient* /opt/"$SERVICE" && \
    installer -c

CMD [ "/opt/ddclient/ddclient", "-file", "/config/ddclient.conf", "-ssl", "-cache", "/tmp/.ddclient", "-foreground" ]
