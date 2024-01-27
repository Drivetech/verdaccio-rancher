FROM alpine:3.19@sha256:c5b1261d6d3e43071626931fc004f70149baeba2c8ec672bd4f27761f8e1ad6b

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

RUN mkdir -p /verdaccio/conf
RUN apk add --no-cache apache2-utils curl && \
  curl -sL -o /verdaccio/conf/config.yaml https://raw.githubusercontent.com/verdaccio/verdaccio/master/conf/docker.yaml && \
  apk del curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
