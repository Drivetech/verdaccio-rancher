# verdaccio-config

[![dockeri.co](http://dockeri.co/image/lgatica/verdaccio-config)](https://hub.docker.com/r/lgatica/verdaccio-config/)

[![Build Status](https://travis-ci.org/lgaticaq/verdaccio-config.svg?branch=master)](https://travis-ci.org/lgaticaq/verdaccio-config)

> Docker Image for share verdaccio config in Rancher

## Summary

Simple container designed to populate verdaccio configuration using dns autodiscovery, when deployed as part of the verdaccio catalog entry in Rancher.

## Description

This container is designed to operate as a data container, or 'sidekick' to verdaccio. It's used in the verdaccio catalog entry in Rancher to provide account and storage configuration.
Below, is the docker compose syntax to run this container, the expectation being this is mapped in using `volumes_from` and sidekicks.  keep in-mind this is designed around an implementation within a Rancher managed environment.

```
config:
  image: lgatica/verdaccio-config
  environment:
    ADMIN_USERNAME: '${ADMIN_USERNAME}'
    ADMIN_PASSWORD: '${ADMIN_PASSWORD}'
    MAX_USERS: '${MAX_USERS}'
  volumes:
    - /verdaccio/conf

```

## License

[MIT](https://tldrlegal.com/license/mit-license)
