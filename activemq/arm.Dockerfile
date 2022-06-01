ARG BASE_IMG=arm32v7/openjdk:8-jre-alpine
FROM $BASE_IMG

ARG BUILD_DATE
ARG VCS_REF

LABEL io.fogsy.build-date=$BUILD_DATE \
      io.fogsy.license="Apache 2.0" \
      io.fogsy.organization="fogsy-io" \
      io.fogsy.url="https://fogsy.io/" \
      io.fogsy.vcs-ref=$VCS_REF \
      io.fogsy.vcs-type="Git" \
      io.fogsy.vcs-url="https://github.com/fogsy-io/dockerfiles"

ENV ACTIVEMQ_VERSION=5.16.5\
    GLIBC_VERSION=2.29-r0

COPY qemu-arm-static /usr/bin

RUN set -x && \
    apk --update add --virtual build-dependencies curl && \
    curl -s http://ftp.unicamp.br/pub/apache/activemq/$ACTIVEMQ_VERSION/apache-activemq-$ACTIVEMQ_VERSION-bin.tar.gz | tar -xzf - -C /opt && \
    mv /opt/apache-activemq-$ACTIVEMQ_VERSION /opt/activemq && \
    apk del build-dependencies && \
    rm -rf /var/cache/apk/*
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add --no-cache --allow-untrusted glibc-${GLIBC_VERSION}.apk \
    && rm glibc-${GLIBC_VERSION}.apk

WORKDIR /opt/activemq

COPY activemq.xml /opt/activemq/conf

ENTRYPOINT ["/opt/activemq/bin/activemq",  "console"]
