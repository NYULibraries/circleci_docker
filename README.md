# circleci_docker

Homegrown image for using docker in CircleCI

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
```

Then, CI/CD will build and deploy a prerelease version of the image to quay. Publishing a Github release will publish a tagged version of the image.
