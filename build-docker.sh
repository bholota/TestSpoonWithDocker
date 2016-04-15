#!/bin/bash

export TASKS = $1;
echo "Running tasks: $(TASKS)"
docker-compose up

exit $?
