#!/bin/sh

set -e

sh wait-for-postgres.sh db

if [ -f tmp/pids/server.pid ]; then
	rm tmp/pids/server.pid
fi

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

exec bundle exec "$@"
