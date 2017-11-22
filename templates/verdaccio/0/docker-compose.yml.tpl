---
version: '2'

services:
  haproxy:
    image: rancher/lb-service-haproxy:v0.7.9
    ports:
      - 80:80/tcp
      - ${PORT}:4873/tcp
    labels:
      {{- if ne .Values.HOST_LABEL ""}}
      io.rancher.scheduler.affinity:host_label: ${HOST_LABEL}
      {{- end}}
      io.rancher.container.agent.role: environmentAdmin
      io.rancher.container.create_agent: 'true'

  verdaccio:
    image: '${IMAGE_VERSION}'
    stdin_open: true
    tty: true
    labels:
      {{- if ne .Values.HOST_LABEL ""}}
      io.rancher.scheduler.affinity:host_label: ${HOST_LABEL}
      {{- end}}
      io.rancher.container.pull_image: always
      io.rancher.sidekicks: config{{- if ne .Values.VOLUME_NAME ""}}, data{{- end}}
      io.rancher.container.hostname_override: container_name
    volumes_from:
      - config
      {{- if ne .Values.VOLUME_NAME ""}}
      - data
      {{- end}}

  config:
    image: lgatica/verdaccio-config
    environment:
      ADMIN_USERNAME: '${ADMIN_USERNAME}'
      ADMIN_PASSWORD: '${ADMIN_PASSWORD}'
      MAX_USERS: '${MAX_USERS}'
    stdin_open: true
    tty: true
    volumes:
      - /verdaccio/conf
    labels:
      {{- if ne .Values.HOST_LABEL ""}}
      io.rancher.scheduler.affinity:host_label: ${HOST_LABEL}
      {{- end}}
      io.rancher.container.pull_image: always
      io.rancher.container.hostname_override: container_name
      io.rancher.container.start_once: 'true'

  {{- if .Values.VOLUME_NAME}}
  data:
    image: busybox
    labels:
      {{- if ne .Values.HOST_LABEL ""}}
      io.rancher.scheduler.affinity:host_label: ${HOST_LABEL}
      {{- end}}
      io.rancher.container.hostname_override: container_name
      io.rancher.container.start_once: 'true'
    volumes:
      - {{.Values.VOLUME_NAME}}:/storage
    entrypoint: /bin/true
  {{- end}}

{{- if .Values.VOLUME_NAME}}
volumes:
  ${VOLUME_NAME}:
    {{- if .Values.VOLUME_DRIVER}}
    driver: ${VOLUME_DRIVER}
    {{- end}}
{{- end}}
