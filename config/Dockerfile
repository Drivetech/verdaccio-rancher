FROM alpine:3.24@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

RUN mkdir -p /verdaccio/conf
RUN apk add --no-cache apache2-utils curl && \
  curl -sL -o /verdaccio/conf/config.yaml https://raw.githubusercontent.com/verdaccio/verdaccio/master/conf/docker.yaml && \
  apk del curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
