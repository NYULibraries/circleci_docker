ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION} as docker

FROM python:3.7-alpine
ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

ENV DOCKER_COMPOSE_BUILD_DEPENDENCIES='build-base libffi-dev openssl-dev openssh-client'

RUN apk add --no-cache rsync bash git ${DOCKER_COMPOSE_BUILD_DEPENDENCIES} \
  && pip3 install docker-compose==${DOCKER_COMPOSE_VERSION} \
  && pip3 install awscli --upgrade --user \
  && ln -s ~/.local/bin/aws /usr/local/bin/aws \
  && apk del ${DOCKER_COMPOSE_BUILD_DEPENDENCIES}