#!/bin/bash
set -x

# docker volume create prometheus-data
# docker volume create grafana-data

#Stop
# docker compose --file ~/scripts/docker/prometheus/prometheus/prometheus.yaml --project-name prometheus down
sleep 1
#Start
docker compose --file ~/scripts/docker/prometheus/prometheus/prometheus.yaml --project-name prometheus up --detach --remove-orphans ## --force-recreate
sleep 5
docker restart prometheus grafana 
