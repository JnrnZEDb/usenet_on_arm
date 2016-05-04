FROM brujoand/rpi-dockzb

MAINTAINER Anders Brujordet

ENV SERVICE sabnzbd

RUN apk --update add \
      unrar p7zip unzip libxslt python && \
    apk --update add --virtual deps \
      linux-headers build-base automake m4 autoconf libsigc++-dev libffi-dev openssl-dev libxml2-dev libxslt-dev py-pip

RUN pip install --upgrade pip && pip install cheetah cffi configobj feedparser pyOpenSSL support pydbus http://www.golug.it/pub/yenc/yenc-0.4.0.tar.gz

RUN mkdir /build && cd /build && \
  wget https://launchpad.net/libpar2/trunk/0.4/+download/libpar2-0.4.tar.gz && tar xfz libpar2-0.4.tar.gz && \
  cd libpar2-0.4 && ./configure && make && make install && cd /build && \
  wget http://sourceforge.net/projects/parchive/files/par2cmdline/0.4/par2cmdline-0.4.tar.gz && \
  tar xfz par2cmdline-0.4.tar.gz && cd par2cmdline-0.4 && \
  sed 's/^bool ReedSolomon/template <> bool ReedSolomon/' reedsolomon.cpp > reedsolomon.cpp.fixed && mv reedsolomon.cpp.fixed reedsolomon.cpp && \
  aclocal && automake --add-missing && autoconf && ./configure && make && make install && cd / && \
  git clone --depth 1 -b master --single-branch https://github.com/sabnzbd/sabnzbd /opt/$SERVICE && \
  apk del git curl && rm -rf /opt/$SERVICE/win && rm -rf /opt/$SERVICE/osx && rm -rf ./root/.cache && \
  rm -rf /build && apk del py-pip && apk del deps && rm -rf /var/cache/apk/* && rm -rf /tmp/* && \
  echo "python /opt/$SERVICE/SABnzbd.py --config-file /config/$SERVICE/sabnzbd.ini --console -s 0.0.0.0:8080 -b 0" > /"$SERVICE".sh

EXPOSE 8080
