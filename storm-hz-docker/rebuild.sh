#!/bin/bash
docker build -t="hzdan/storm:0.9.1" storm
docker build -t="hzdan/storm-nimbus:0.9.1" storm-nimbus
docker build -t="hzdan/storm-supervisor:0.9.1" storm-supervisor
docker build -t="hzdan/storm-ui:0.9.1" storm-ui
