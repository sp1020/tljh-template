#!/bin/bash

# load parameters
source parameter.sh
container_name="tljh-$class_tag"
image_name="tljh-$class_tag-$date_tag"

# execution of the code 
docker commit $container_name $image_name
