FROM brujoand/rpi-dockzb

ENV SERVICE miniflux

RUN installer apk apache2 php5 php5-sqlite && \
  echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
  installer -b git https://github.com/miniflux/miniflux.git && \
  rm -rf /var/www/html && mv /build/miniflux /var/www/html && \
  chown -R www-data:www-data /var/www/html/data && \
  installer -c

EXPOSE 80
