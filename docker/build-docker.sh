#!/bin/bash

export TASK_NAME=$1;
export APP_VERSION=$(echo $(cat config-docker.json | grep version | head -1 | awk -F: '{ print $2 }' | sed 's/[",\r]//g'))
echo "App image version: $APP_VERSION"
export APP_NAME=$(echo $(cat config-docker.json | grep name | head -1 | awk -F: '{ print $2 }' | sed 's/[",\r]//g'))
echo $APP_NAME;

function buildProject {
    if docker history -q "${APP_NAME}:${APP_VERSION}" > /dev/null 2>&1; then
        echo "${APP_NAME}:${APP_VERSION} exists"
    else
        docker build -t "${APP_NAME}:${APP_VERSION}" .
    fi
    docker-compose kill > /dev/null 2>&1
    docker-compose rm -f -v > /dev/null 2>&1
    BUILD_STATUS=$(docker-compose up project)
    docker-compose kill > /dev/null 2>&1
    docker-compose rm -f -v > /dev/null 2>&1
    echo "$BUILD_STATUS";
    if echo "$BUILD_STATUS" | grep -q "exited with code 1"; then
            return 1;
        else
            return 0;
    fi
}

if [[ $TASK_NAME == 'build' ]]
    then
        buildProject
fi

exit $?