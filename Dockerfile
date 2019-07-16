ARG DOCKER_VERSION=${DOCKER_VERSION}
FROM docker:${DOCKER_VERSION}-ce-git

RUN apk --no-cache --upgrade add --upgrade python3 rsync bash expat=2.2.7-r0 #git=2.22.0-r0

ARG DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}
RUN pip3 install docker-compose==${DOCKER_COMPOSE_VERSION} \
  && pip3 install awscli --upgrade --user \
  && ln -s ~/.local/bin/aws /usr/local/bin/aws
