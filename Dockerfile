ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION}-git as docker

FROM python:3.7-alpine

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

RUN apk --update --no-cache --upgrade add gettext git openssh rsync bash 

ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
ARG COMPOSE_BUILD_DEPS="py3-pip libffi-dev openssl-dev gcc libc-dev make"
RUN apk --update --no-cache add $COMPOSE_BUILD_DEPS \
  && pip3 install docker-compose \
  && pip3 install awscli --upgrade --user \
  && apk del $COMPOSE_BUILD_DEPS \
  && ln -s ~/.local/bin/aws /usr/local/bin/aws
