FROM brujoand/rpi-dockzb

ENV SERVICE nzbget

RUN installer -b apk wget && \
  cd /build && \
  wget -O - http://nzbget.net/info/nzbget-version-linux.json | \
  sed -n "s/^.*stable-download.*: \"\(.*\)\".*/\1/p" | \
  wget --no-check-certificate -i - -O nzbget.run && \
  sh nzbget.run --destdir /opt/"$SERVICE" && \ 
  cd / && installer -c

ADD run.sh /run.sh

CMD [ "/run.sh" ]

EXPOSE 6789
