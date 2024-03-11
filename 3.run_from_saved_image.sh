#!/bin/bash

# load parameters
source parameter.sh
container_name="tljh-$class_tag"
image_name="tljh-$class_tag-$date_tag"

# Run the stored image
docker run --privileged --detach --name=$container_name --publish $port:80 --mount type=bind,source=$(pwd)/the-littlest-jupyterhub,target=/srv/src --mount type=bind,source=$(pwd)/home,target=/home --mount type=bind,source=$(pwd)/opt,target=/opt $image_name
