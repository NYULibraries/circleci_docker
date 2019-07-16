ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION}-ce-git as docker

FROM python:3.7-alpine

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

RUN apk --update --no-cache --upgrade add git openssh rsync bash 

ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
RUN pip3 install docker-compose==${DOCKER_COMPOSE_VERSION} \
  && pip3 install awscli --upgrade --user \
  && ln -s ~/.local/bin/aws /usr/local/bin/aws
