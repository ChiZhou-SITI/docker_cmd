#################################################################
# Dockerfile
#
# Version:          1.0
# Software:         test
# Software Version: 1.3
# Description:      docker file example
# Website:          https://github.com/XIAOCHIZI/docker_cmd
# Tags:             test
# Provides:         test 1.3
# Base Image:       ubuntu 16.04
# Build Cmd:        docker build --rm -t zc/test:v1 .
# Pull Cmd:         ..
# Run Cmd:          docker run -it zc/test:v1
#################################################################

# Source Image
FROM ubuntu:16.04

################## BEGIN INSTALLATION ###########################


# install
RUN apt-get update && apt-get install -y software-properties-common \
&& apt-get update && apt-get install -y \
    gcc-4.9 \
    g++-4.9 \
    coinor-cbc \
    zlib1g-dev \
    libbz2-dev \
    git \
    python \
&& update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9 \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get clean \
&& apt-get purge


RUN git clone https://github.com/XIAOCHIZI/docker_cmd.git \
    && mv docker_cmd/ /usr/local/bin/ \
    && chmod 777 /usr/local/bin/docker_cmd/OptiTypePipeline.py

ENV PATH=/usr/local/bin/docker_cmd:$PATH
    
RUN mkdir /data
# Change workdir to /data/
WORKDIR /data/
# Define default command
ENTRYPOINT ["/usr/local/bin/docker_cmd/OptiTypePipeline.py"]
#CMD ["-h"]
##################### INSTALLATION END ##########################
# File Author / Maintainer
MAINTAINER Chi Zhou <1410782Chiz@tongji.edu.cn>
