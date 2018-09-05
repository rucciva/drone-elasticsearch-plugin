FROM alpine:3.8
RUN apk add --no-cache curl ca-certificates jq
ADD script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh
ENTRYPOINT /usr/local/bin/script.sh