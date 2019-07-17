# circleci_docker

# NYULibraries CircleCI Docker

Docker image for building on CircleCI. Includes:

- docker client
- docker-compose
- aws-cli
- git
- ssh
- python (for running aws-cli)

Images (and releases) tagged based on versions of docker and docker-compose.

## Usage

`.circleci/config.yml`
```yml
version: 2
jobs:
  build:
    docker:
    - image: quay.io/nyulibraries/circleci_docker:18.06.3-dc-1.23.2-0
    working_directory: ~/app
    # ...
```

## Updating the image

Builds are controlled by values in the `.env` file

```env
DOCKER_VERSION=18.06.1
DOCKER_COMPOSE_VERSION=1.23.2
PATCH=0
