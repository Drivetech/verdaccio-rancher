FROM alpine:3.13@sha256:08d6ca16c60fe7490c03d10dc339d9fd8ea67c6466dea8d558526b1330a85930

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

RUN mkdir -p /verdaccio/conf
RUN apk add --no-cache apache2-utils curl && \
  curl -sL -o /verdaccio/conf/config.yaml https://raw.githubusercontent.com/verdaccio/verdaccio/master/conf/docker.yaml && \
  apk del curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
