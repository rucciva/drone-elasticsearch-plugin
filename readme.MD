# Drone elasticsearch plugin

Publish environment started with `DRONE_` to elasticsearch

## Test

```bash
docker run -it --rm \
    --env-file .env \
    -e ELASTICSEARCH_URL="https://host.without.trailing.slash.com" \
    -e ELASTICSEARCH_USERNAME="user" \
    -e ELASTICSEARCH_PASSWORD="password" \
    -e PLUGIN_ELASTICSEARCH_INDEX="drone" \
    -e PLUGIN_ELASTICSEARCH_INDEX_POSTFIX_COMMAND='date -d @`echo $DRONE_JOB_STARTED` +-%Y' \
    rucciva/drone-elasticsearch-plugin
```