FROM brujoand/rpi-dockzb

ENV SERVICE mysql

RUN adduser -S -s -u 501 mysql && apk add -U mariadb

ENV SQLUSER tiny
ENV SQLPWD tiny
ENV SQLDB tiny
ENV SQLDATA /config/$SERVICE

COPY entry.sh /

EXPOSE 5432

ENTRYPOINT ["/entry.sh"]
