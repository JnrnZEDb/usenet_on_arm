FROM brujoand/rpi-dockzb

ENV SERVICE=postgres \
  PGUSER=rpi-dockzb \
  PGPWD=rpi-dockzb \
  PGDB=rpi-dockzb \
  PGDATA=/data/postgres

COPY bin/postgres_entry /usr/local/bin/postgres_entry

RUN installer -c apk postgresql

CMD [ "/usr/local/bin/postgres_entry" ]

EXPOSE 5432
