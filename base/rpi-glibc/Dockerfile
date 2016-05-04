FROM brujoand/rpi-dockzb

# C&P from https://github.com/Orochimarufan/custom-aports
ENV GLIBC_LIBRARY_PATH /lib64
ENV GLIBC_LD_LINUX_SO /lib64/ld-linux-x86-64.so.2

RUN installer -b apk curl dpkg tar xz file && \
    mkdir -p /lib64 && cd /build && \
    for pkg in {libgcc1,libc6,libstdc++6}; \
      do curl -s https://packages.debian.org/jessie/amd64/$pkg/download | grep -Eo 'http://.*amd64\.deb' -m 1 | xargs curl -O;\
    done && \
    for p in *.deb; do dpkg-deb -x "${p}" "${p/_*}"; done && \
    cp -a libc6/lib/x86_64-linux-gnu/* \
          libgcc1/lib/x86_64-linux-gnu/* \
          libstdc\+\+6/usr/lib/x86_64-linux-gnu/* \
          "$GLIBC_LIBRARY_PATH" && \
    cd / && installer -c

ENV LD_LIBRARY_PATH "$GLIBC_LIBRARY_PATH"
