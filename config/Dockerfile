FROM alpine:3.7@sha256:56e2f91ef15847a2b02a5a03cbfa483949d67a242c37e33ea178e3e7e01e0dfd

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

RUN mkdir -p /verdaccio/conf
RUN apk add --no-cache apache2-utils curl && \
  curl -sL -o /verdaccio/conf/config.yaml https://raw.githubusercontent.com/verdaccio/verdaccio/master/conf/docker.yaml && \
  apk del curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
