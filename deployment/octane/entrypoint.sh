#!/usr/bin/env bash
set -e

initialStuff() {
    php artisan event:cache; \
    php artisan optimize:clear;
}

if [ "$1" != "" ]; then
    exec "$@"
else
    initialStuff
    exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
fi

