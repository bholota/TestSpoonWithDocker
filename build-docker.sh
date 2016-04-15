#!/bin/bash

export TASKS=$1;
echo "Running tasks: $(echo $TASKS)"
docker-compose up

exit $?
