FROM brujoand/rpi-dockzb

ENV GOPATH /go

RUN installer -b apk git && \
  mkdir -p /go/src /go/src/github.com /go/bin && chmod -R 777 /go  && \
  git clone --depth 1 -b master --single-branch https://github.com/kelseyhightower/confd.git /go/src/github.com/kelseyhightower/confd && \
  apk add gcc libc6-compat 
RUN curl -s https://storage.googleapis.com/golang/go1.6.linux-armv6l.tar.gz | tar xzf - -C /usr/local && \
  export PATH="/usr/local/go/bin:$PATH" && \
  export GOMAXPROCS=3 && \
  cd /go/src/github.com/kelseyhightower/confd && ./build && ./install && ./clean && \
  rm -rf /usr/local/go
