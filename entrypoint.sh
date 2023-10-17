#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/galactic/setup.bash"
exec "$@"
