# Drone elasticsearch plugin

Publish environment started with `DRONE_` to elasticsearch

## Test

```bash
docker run -it --rm \
    --env-file .env \
    -e PLUGIN_URL="https://host.without.trailing.slash.com" \
    -e PLUGIN_USERNAME="user" \
    -e PLUGIN_PASSWORD="password" \
    -e PLUGIN_INDEX="drone" \
    -e PLUGIN_INDEX_POSTFIX_COMMAND='date -d @`echo $DRONE_JOB_STARTED` +-%Y' \
    rucciva/drone-elasticsearch-plugin:0.0.2
```
