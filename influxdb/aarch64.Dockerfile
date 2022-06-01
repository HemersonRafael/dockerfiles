ARG BASE_IMG=influxdb:2.2.0
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

COPY qemu-aarch64-static /usr/bin
