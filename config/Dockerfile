FROM alpine:3.7@sha256:7a49a88657ea6a304f730897f41f9d0376ba807e7b15c09250fe7bdd951b09cb

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

RUN mkdir -p /verdaccio/conf
RUN apk add --no-cache apache2-utils curl && \
  curl -sL -o /verdaccio/conf/config.yaml https://raw.githubusercontent.com/verdaccio/verdaccio/master/conf/docker.yaml && \
  apk del curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
