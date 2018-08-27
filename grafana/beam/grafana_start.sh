#!/bin/bash
cd /usr/share/grafana.beam
grafana-server -config /etc/grafana.beam/grafana.ini cfg:default.paths.data=/var/lib/grafana.beam 1>/var/log/grafana.beam.log 2>&1
