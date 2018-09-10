#!/bin/sh

set -e 

export DRONE_BUILD_CREATED_DATE=`date -d "@$DRONE_BUILD_CREATED" +'%Y/%m/%d %H:%M:%S'`
export DRONE_BUILD_STARTED_DATE=`date -d "@$DRONE_BUILD_STARTED" +'%Y/%m/%d %H:%M:%S'`
export DRONE_BUILD_FINISHED_DATE=`date -d "@$DRONE_BUILD_FINISHED" +'%Y/%m/%d %H:%M:%S'`
export DRONE_JOB_STARTED_DATE=`date -d "@$DRONE_JOB_STARTED" +'%Y/%m/%d %H:%M:%S'`
export DRONE_JOB_FINISHED_DATE=`date -d "@$DRONE_JOB_FINISHED" +'%Y/%m/%d %H:%M:%S'`

index_postfix=`eval $PLUGIN_ELASTICSEARCH_INDEX_POSTFIX_COMMAND`
url="${PLUGIN_ELASTICSEARCH_URL}/${PLUGIN_ELASTICSEARCH_INDEX}${index_postfix}/doc"
body=`jq -c -n 'env' | jq -c 'with_entries( select( .key | contains("DRONE_") ) )' | jq -c 'with_entries(.key |= ascii_downcase)'`
curl \
  -s \
  -u "${ELASTICSEARCH_USERNAME:-$PLUGIN_ELASTICSEARCH_USERNAME}:${ELASTICSEARCH_PASSWORD:-$PLUGIN_ELASTICSEARCH_PASSWORD}" \
  -d "$body" \
  -H "Content-Type: application/json"  \
  "$url"