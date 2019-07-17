ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION} as docker

FROM python:3.7-alpine
ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}

COPY --from=docker /usr/local/bin/docker /usr/local/bin/docker

ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
ARG COMPOSE_BUILD_DEPS="python-dev libffi-dev openssl-dev gcc libc-dev make"
RUN apk --update --no-cache add $COMPOSE_BUILD_DEPS \
  && pip3 install docker-compose \
  && pip3 install awscli --upgrade --user \
  && apk del $COMPOSE_BUILD_DEPS \
  && ln -s ~/.local/bin/aws /usr/local/bin/aws