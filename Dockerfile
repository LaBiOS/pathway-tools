FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive \
    DISPLAY=:99 \
    VERSION=23.0

RUN apt-get update && \
    apt-get install -y xterm openssl inetutils-ping libjpeg8-dev libxml2 xvfb && \
    apt-get install -y vim less wget

COPY config/ptools-init.dat /opt/data/ptools-local/ptools-init.dat
COPY config/install-pathway-tools.sh /opt/bin/install-pathway-tools.sh
COPY config/run-pathway-tools.sh /opt/bin/run-pathway-tools.sh
COPY pathway-tools/pathway-tools-$VERSION-linux-64-tier1-install /opt/bin/pathway-tools-$VERSION-linux-64-tier1-install

RUN /opt/bin/install-pathway-tools.sh

CMD [ "/opt/bin/run-pathway-tools.sh" ]

#
# docker build -t pathwaytool:23.0 .
# docker run --volume `pwd`:/mnt --publish 1555:1555 --rm --name pathway -it pathwaytools:23.0 /bin/bash
