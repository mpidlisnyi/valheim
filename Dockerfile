FROM debian:stable-slim
MAINTAINER maksim@nightbook.info

# Setting all the Environment Variables
ARG LANGUAGE=en_US.UTF-8


ENV LANG=${LANGUAGE} \
    WORLD="Dedicated"

# Building OS, and installed steamcmd
RUN \
    dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y locales locales-all && \
    locale-gen ${LANGUAGE} && \
    apt-get install -y software-properties-common && \
    apt-add-repository non-free && \
    apt-get update && \
    echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections && \
    apt-get install -y \
        nano \
        curl \
        wget \
        mesa-utils \
        net-tools \
        unzip \
        steamcmd && \
    apt-get clean && \
    echo "LANG=${LANGUAGE}" >> /etc/environment

# Set up Enviornment
RUN \
    groupadd valheim -g 1888 && \
    useradd --home /server --gid valheim -u 1888 --system valheim && \
    mkdir /server /data && \
    chown valheim:valheim -R /server /data

COPY --chown=valheim:valheim ./server.sh /server.sh
COPY entrypoint.sh /entrypoint

USER valheim

WORKDIR /server

ENTRYPOINT [ "/entrypoint" ]
CMD ["/server.sh"]

ONBUILD USER root

# Volumes for Persistent Server Data
VOLUME "/server"
VOLUME "/data"
