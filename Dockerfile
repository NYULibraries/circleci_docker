ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION}-git as docker

FROM python:3.7-alpine

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

RUN apk --update --no-cache --upgrade add git openssh rsync bash 

ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
ARG COMPOSE_BUILD_DEPS="curl py-pip python3-dev libffi-dev openssl-dev gcc libc-dev rust cargo make"
RUN apk --update --no-cache add jq $COMPOSE_BUILD_DEPS \
  && pip install docker-compose==$DOCKER_COMPOSE_VERSION \ 
  && pip install awscli --upgrade --user \
  && ln -s ~/.local/bin/aws /usr/local/bin/aws \
  && apk del $COMPOSE_BUILD_DEPS 
