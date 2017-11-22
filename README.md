# Verdaccio Rancher

Rancher template for [Verdaccio](http://www.verdaccio.org/)

## Install

In Rancher's UI, go to **Admin/Settings** and add a new custom catalog:

| Name      | URL                                               | Branch |
| --------- | ------------------------------------------------- | ------ |
| Verdaccio | https://github.com/lgaticaq/verdaccio-rancher.git | master |

## Templates

* **verdaccio**: Verdaccio for production environment

## Docker Images

* **verdaccio-config**:
Docker image used as sidekick container of verdaccio containers to provide configuration.
