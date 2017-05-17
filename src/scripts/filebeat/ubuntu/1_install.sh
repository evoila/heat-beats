#!/bin/bash

VERSION=${VERSION:-5.4.0}

curl -L -o /tmp/filebeat-amd64.deb https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$VERSION-amd64.deb
dpkg -i /tmp/filebeat-amd64.deb
