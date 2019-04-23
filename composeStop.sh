#!/bin/bash
pushd /docker
killall -TERM chromium-browser 2>/dev/null;
sleep 2;
killall -9 chromium-browser 2>/dev/null;

/usr/bin/docker-compose -f docker-compose.azure.yml -f docker-compose.yml stop
