FROM ubuntu:14.04
MAINTAINER Arif Zaidi <smarifz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && apt-get -y install \
    bison \
    build-essential \
    flex \
    gcc-multilib \
    g++-multilib

# Step 2: Setting up the Environment

ENV HOST i686-pc-linux
ENV IDIR /simplescalar
ENV TARGET sslittle-na-sstrix

ADD . /simplescalar

WORKDIR /simplescalar

RUN /simplescalar/build.bash

# Add compiled binaries to path after build
ENV PATH $PATH:$IDIR/bin:$IDIR/simplesim-3.0

