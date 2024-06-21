ARG BASE_IMAGE=ubuntu:22.04

#######################################################################
# Basic configuration for base and builder
#######################################################################

FROM ${BASE_IMAGE} as common
ARG CONTAINER_TAG=unknown
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Vienna \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    TOOLS=/opt

USER root


#######################################################################
# Setup base image
#######################################################################
FROM common as base

RUN --mount=type=bind,source=images/base,target=/images/base \
    bash /images/base/base_install.sh && \
    bash /images/base/python_packages.sh


#######################################################################
# Builder image (Has all iic dependencies)
#######################################################################
FROM common as builder

RUN echo "Hello from builder"


#######################################################################
# Final output container
#######################################################################
FROM base as embedded-builder

RUN echo "Hello from embedded-builder"

WORKDIR /home/dev
USER dev