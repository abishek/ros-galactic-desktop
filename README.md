# ROS Galactic Desktop Build

ROS Galactic is an EOL ROS 2 distro. But I have a project where I use docker with this specific version of the distro. So I am maintaining a private build file until I am ready to move the project back to humble or higher.

## Build

``` shell
docker buildx build --platform linux/amd64 -t ros-galactic-desktop:latest .
```

## Use

The docker images are available on my public docker registry. You can use them like this:

``` shell
docker run abiyagoda/ros-galactic-desktop:latest -it -exec /bin/bash
```

