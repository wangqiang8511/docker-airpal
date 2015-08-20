#!/usr/bin/env sh

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker run -it --rm \
	-e DB_USER=$DB_USER \
	-e DB_PASS=$DB_PASS \
	-e DB_JDBC_URL=$DB_JDBC_URL \
	-e PRESTO_COORDINATOR=$PRESTO_COORDINATOR \
	-p 8081:8081 \
	-p 8082:8082 \
	$IMAGE \
	/scripts/start_server.sh
