FROM brujoand/rpi-dockzb

ENV SERVICE znc

RUN installer -c apk curl znc znc-modperl znc-extra znc-doc

CMD [ "znc", "--datadir", "/config/znc", "--foreground" ]

EXPOSE 8086
