#!/bin/bash

VERSION=${VERSION:-5.4.0}

curl -L -o /tmp/filebeat-amd64.rpm https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-$VERSION-x86_64.rpm

rpm -i /tmp/filebeat-amd64.rpm
