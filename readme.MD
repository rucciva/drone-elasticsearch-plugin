# Drone elasticsearch plugin

Publish environment started with `DRONE_` to elasticsearch

## Test

```bash
docker run -it --rm \
    --env-file .env \
    -e PLUGIN_ELASTICSEARCH_URL="https://some.host.without.trailing.slash" \
    -e PLUGIN_ELASTICSEARCH_INDEX="drone" \
    -e ELASTICSEARCH_USERNAME="user" \
    -e ELASTICSEARCH_PASSWORD="password" \
    rucciva/drone-elasticsearch-plugin
```