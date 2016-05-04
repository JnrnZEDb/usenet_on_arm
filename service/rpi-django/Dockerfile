FROM brujoand/rpi-dockzb

ENV SERVICE django

RUN installer apk python && \
    installer -c pip django

WORKDIR /config

EXPOSE 8000

CMD [ "bash" ]
