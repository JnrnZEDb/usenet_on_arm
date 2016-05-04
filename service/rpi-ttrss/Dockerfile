FROM brujoand/rpi-dockzb

ENV SERVICE ttrss

RUN apk --update add curl git php-fpm php-cli php-curl php-gd php-json \
    php-pgsql php-mysql php-ctype php-dom php-iconv php-mcrypt && \
    git clone -b master --depth 1 --single-branch https://tt-rss.org/git/tt-rss.git /opt/tt-rss

# RUN php5enmod mcrypt¬

ENV LANG en_GB.utf8

ADD run.sh /"$SERVICE".sh

EXPOSE 8088
