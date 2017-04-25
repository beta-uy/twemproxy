#!/bin/sh
set -e

[ -z "$TARGET_PORT" ] && echo 'Missing TARGET_PORT' && exit 1
[ -z "$REDIS_HOST" ]  && echo 'Missing REDIS_HOST'  && exit 1
[ -z "$REDIS_AUTH" ]  && echo 'Missing REDIS_AUTH'  && exit 1
# [ -z "$REDIS_PORT" ]  && echo 'Missing REDIS_PORT'  && exit 1
# [ -z "$REDIS_DB" ]    && echo 'Missing REDIS_DB'    && exit 1

python /usr/src/twemproxy/docker/render_templates.py

exec "$@"
