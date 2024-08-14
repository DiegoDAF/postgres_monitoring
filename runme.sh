#!/bin/bash
set -x

# docker volume create prometheus-data
# docker volume create grafana-data

#Stop
# docker compose --file /home/daf/scripts/docker/prometheus/prometheus/prometheus.yaml --project-name prometheus down
sleep 1
#Start
docker compose --file /home/daf/scripts/docker/prometheus/prometheus/prometheus.yaml --project-name prometheus up --detach --remove-orphans ## --force-recreate
sleep 5
docker restart prometheus grafana 

curl --silent  http://beta.tigris-trout.ts.net:9188/metrics  \
| grep -i database 

https://beta.tigris-trout.ts.net:9090/graph?g0.expr=pg_database_size_bytes&g0.tab=0&g0.display_mode=lines&g0.show_exemplars=0&g0.range_input=1h
