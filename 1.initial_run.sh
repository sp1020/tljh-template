#!/bin/bash

# load parameters
source parameter.sh
container_name="tljh-$class_tag"

# run the docker image
pwd=${PWD##*/}

if [[ "$pwd" == *"template"* ]]; then
    echo "This script should not be executed in the templat directory"
    echo "Copy this directory first, and then run the script"
    exit 1
else
    echo "Run Docker image for $container_name"
    docker run --privileged --detach --name=$container_name --publish $port:80 --mount type=bind,source=$(pwd)/the-littlest-jupyterhub,target=/srv/src --mount type=bind,source=$(pwd)/home,target=/home --mount type=bind,source=$(pwd)/opt,target=/opt tljh-systemd
fi