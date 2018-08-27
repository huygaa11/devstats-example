#!/bin/bash
# GRAFANA_DATA=/usr/share/grafana.beam/
for f in `find ${GRAFANA_DATA} -type f -exec grep -l "'Grafana - '" "{}" \; | sort | uniq`
do
  ls -l "$f"
  vim -c "%s/'Grafana - '/'Beam - '/g|wq" "$f"
done
for f in `find ${GRAFANA_DATA} -type f -exec grep -l '"Grafana - "' "{}" \; | sort | uniq`
do
  ls -l "$f"
  vim -c '%s/"Grafana - "/"Beam - "/g|wq' "$f"
done
cp -n ${GRAFANA_DATA}/public/img/grafana_icon.svg ${GRAFANA_DATA}/public/img/grafana_icon.svg.bak
cp grafana/img/beam.svg ${GRAFANA_DATA}/public/img/grafana_icon.svg || exit 1
cp -n ${GRAFANA_DATA}/public/img/grafana_com_auth_icon.svg ${GRAFANA_DATA}/public/img/grafana_com_auth_icon.svg.bak
cp grafana/img/beam.svg ${GRAFANA_DATA}/public/img/grafana_com_auth_icon.svg || exit 1
cp -n ${GRAFANA_DATA}/public/img/grafana_net_logo.svg ${GRAFANA_DATA}/public/img/grafana_net_logo.svg.svg.bak
cp grafana/img/beam.svg ${GRAFANA_DATA}/public/img/grafana_net_logo.svg || exit 1
cp -n ${GRAFANA_DATA}/public/img/fav32.png ${GRAFANA_DATA}/public/img/fav32.png.bak
cp grafana/img/beam32.png ${GRAFANA_DATA}/public/img/fav32.png || exit 1
echo 'OK'
