FROM brujoand/glibc

ENV SERVICE=plex \
  LC_ALL=C \
  PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=8 \
  PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000 \
  PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR=/data \
  PLEX_MEDIA_SERVER_HOME=/opt/plex/ \
  TMPDIR=/tmp \
  LD_LIBRARY_PATH=${PLEX_MEDIA_SERVER_HOME}:${LD_LIBRARY_PATH}

RUN installer -b apk dpkg tar curl && \
    cd /build && \
    curl -L -s -o plex.deb "https://downloads.plex.tv/plex-media-server/0.9.15.2.1663-7efd046/plexmediaserver_0.9.15.2.1663-7efd046_amd64.deb" && \
    dpkg-deb -x plex.deb . && cp -a usr/lib/plexmediaserver /opt/"$SERVICE" && \
    echo "export LC_ALL=C; export LD_LIBRARY_PATH=\"${PLEX_MEDIA_SERVER_HOME}:${GLIBC_LIBRARY_PATH}\"; ulimit -s $PLEX_MAX_STACK_SIZE && /opt/plex/Plex\ Media\ Server" >> /plex.sh && \
    installer -c

CMD [ "sh", "/plex.sh" ]

EXPOSE 32400
