#!/bin/bash

if [ $# -ne 3 ]
then
        echo "Usage: $0 hostname-to-affect environment event_name"
        echo "example: $0 localhost development classic"
        exit -1
fi

hostn=$1
environment=$2
event_name=$3

# this script inits a server with Fabric and sticks a puppet config on it
# which can then be used to do stuff. only run this script once, and once
# it's successful, use apply instead

fab -u root -H $hostn puppet_apply_new_node $environment $event_name