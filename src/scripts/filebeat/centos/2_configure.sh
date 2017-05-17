#!/bin/bash

ELASTICSEARCH_ADDRESSES=${ELASTICSEARCH_ADDRESSES:-[\"127.0.0.1:9200\"]}
LOGFILE_PATHS=${LOGFILE_PATHS}

FILES=$(echo $LOGFILE_PATHS | sed 's/\[//' | sed 's/\]//' | sed 's/"//g' | sed 's/,//g')

cat <<EOF > /etc/filebeat/filebeat.yml
filebeat.prospectors:
- input_type: log
  paths:
EOF

for FILE in $FILES; do
  echo "    - $FILE" >> /etc/filebeat/filebeat.yml
done

cat <<EOF >> /etc/filebeat/filebeat.yml
output.elasticsearch:
  hosts: $ELASTICSEARCH_ADDRESSES
EOF

service filebeat restart
