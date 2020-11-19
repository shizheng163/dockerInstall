ARG BASE_IMAGE
FROM shizheng163/ubuntu18.04-self:$BASE_IMAGE
ARG VERSION
MAINTAINER shizheng163@126.com
LABEL version=$VERSION

ARG USER
ENV DOCKER_USER $USER
ENV DOCKER_GRP $USER
RUN export | grep DOCKER

COPY install /tmp/install
RUN ls /tmp/
RUN bash /tmp/install/install.sh
RUN sudo rm -rf /tmp/install
USER $USER
WORKDIR /home/$USER