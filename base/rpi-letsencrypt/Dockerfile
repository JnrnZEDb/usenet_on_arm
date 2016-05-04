FROM brujoand/rpi-dockzb

ENV SERVICE=letsencrypt

RUN apk -U add git python python-dev py-virtualenv augeas build-base libffi-dev openssl-dev ethtool linux-headers linux-headers && \
  pip install --upgrade pip && \
  git clone https://github.com/letsencrypt/letsencrypt /opt/"$SERVICE" && \
  cd "/opt/$SERVICE" && ./letsencrypt-auto --server https://acme-v01.api.letsencrypt.org/directory --help

CMD sh

