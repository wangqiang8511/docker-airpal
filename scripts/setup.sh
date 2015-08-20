#!/bin/bash

DB_USER=${DB_USER:-root}
DB_PASS=${DB_PASS:-root}
DB_JDBC_URL=${DB_JDBC_URL:-jdbc:mysql://localhost:3306lairpal}
PRESTO_COORDINATOR=${PRESTO_COORDINATOR:-http://localhost:8080}

sed -i 's;DB_USER;'$DB_USER';g' $AIRPAL_HOME/reference.yml
sed -i 's;DB_PASS;'$DB_PASS';g' $AIRPAL_HOME/reference.yml
sed -i 's;DB_JDBC_URL;'$DB_JDBC_URL';g' $AIRPAL_HOME/reference.yml
sed -i 's;PRESTO_COORDINATOR;'$PRESTO_COORDINATOR';g' $AIRPAL_HOME/reference.yml

exec "$@"
