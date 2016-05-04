FROM brujoand/rpi-confd

ENV SERVICE nginx

ADD ./confd /etc/confd
RUN installer -c apk nginx

ADD ./run /opt/run

CMD [ "/opt/run" ]

EXPOSE 80 443
