FROM hypriot/rpi-alpine-scratch

MAINTAINER Anders Brujordet

ENV LC_ALL="en_US.UTF-8" \
  LANG="en_US.UTF-8" \
  LANGUAGE="en_US.UTF-8"

COPY bashrc /root/.bashrc
COPY runner /usr/local/bin/runner
COPY installer /usr/local/bin/installer 

RUN echo "http://nl.alpinelinux.org/alpine/v3.3/main" > /etc/apk/repositories && \
    echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    echo "@community http://nl.alpinelinux.org/alpine/v3.3/community">> /etc/apk/repositories && \
    apk -U add bash && \
    apk add --virtual build_deps curl dpkg && \
    curl -L -o /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.7/gosu-$(dpkg --print-architecture)" && \ 
    chmod +x /usr/local/bin/gosu && \
    mkdir /opt /build && \
    ln -sfn /bin/bash /bin/sh && \
    installer -c apk "shadow@testing"

VOLUME /config /data


ENTRYPOINT [ "/usr/local/bin/runner" ]

CMD [ "bash" ]

