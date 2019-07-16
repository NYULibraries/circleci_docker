ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION}-ce-git

ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}

RUN apk add --no-cache python3 rsync bash \
  && pip3 install docker-compose==${DOCKER_COMPOSE_VERSION} \
  && pip3 install awscli --upgrade --user \
  && ln -s ~/.local/bin/aws /usr/local/bin/aws
