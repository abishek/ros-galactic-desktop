FROM ubuntu:focal-20231003
MAINTAINER Abishek Goda <abishek@rohabini.com>

RUN apt update && \
    apt install -y software-properties-common curl && \
    add-apt-repository universe

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

RUN apt update && \
    apt -y upgrade && \
    apt install -y ros-galactic-ros-base && \
    apt install -y ros-dev-tools

COPY ./entrypoint.sh /
# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]
