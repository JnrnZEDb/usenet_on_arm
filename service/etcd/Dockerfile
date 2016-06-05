FROM brujoand/rpi-dockzb

ENV GOPATH /go && \
    ETCD_UNSUPPORTED_ARCH=arm

RUN installer -b apk git gcc libc6-compat && \
  mkdir -p /go/src /go/src/github.com /go/bin && chmod -R 777 /go  && \
  git clone --depth 1 -b master --single-branch https://github.com/coreos/etcd.git /go/src/github.com/coreos/etcd
RUN curl -s https://storage.googleapis.com/golang/go1.6.linux-armv6l.tar.gz | tar xzf - -C /usr/local && \
  export PATH="/usr/local/go/bin:$PATH" && \
  export GOMAXPROCS=3 && \
  cd /go/src/github.com/coreos/etcd && ./build && \
  rm -rf /usr/local/go
