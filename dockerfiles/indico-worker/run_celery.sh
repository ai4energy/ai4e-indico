#!/bin/bash

/opt/indico/set_user.sh
. /opt/indico/.venv/bin/activate

SERVICE_URL="${SERVICE_PROTOCOL}://${SERVICE_HOSTNAME}:${SERVICE_PORT:-80}"

echo "Waiting for $SERVICE_URL to be online..."
while [[ "$(curl -L --max-time 10 -s -o /dev/null -w '%{http_code}' "$SERVICE_URL")" != "200" ]]; do
    sleep 10
    echo "Waiting..."
done

echo 'Starting Celery...'
indico celery worker -B
