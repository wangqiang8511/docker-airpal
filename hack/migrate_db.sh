#!/bin/bash

PROJECT_HOME="$(cd "$(dirname "$0")"/..; pwd)"

. $PROJECT_HOME/hack/set-default.sh

docker run -it --rm \
	-e DB_USER=$DB_USER \
	-e DB_PASS=$DB_PASS \
	-e DB_JDBC_URL=$DB_JDBC_URL \
	-e PRESTO_COORDINATOR=$PRESTO_COORDINATOR\
	$IMAGE \
	/scripts/migrate_db.sh
