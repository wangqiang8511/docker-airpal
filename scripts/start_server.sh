#!/bin/bash

. /scripts/setup.sh \
       	&& cd $AIRPAL_HOME \
	&& java \
	-server \
	-Duser.timezone=UTC \
	-cp build/libs/airpal-*-all.jar \
	com.airbnb.airpal.AirpalApplication server reference.yml
