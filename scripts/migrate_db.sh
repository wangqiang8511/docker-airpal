#!/bin/bash

. /scripts/setup.sh \
       	&& cd $AIRPAL_HOME \
	&& java \
	-Duser.timezone=UTC \
	-cp build/libs/airpal-*-all.jar \
	com.airbnb.airpal.AirpalApplication db migrate reference.yml
