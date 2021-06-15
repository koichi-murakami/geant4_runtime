#!/bin/sh -
#
# Build Docker image
#

export DOCKER_BUILDKIT=1

echo "@@ Build Docker image ..."

target=koichimurakamik6/geant4-runtime:10.7.1

id=`docker image ls -q $target`

if [ -n "$id" ]; then
  echo "@@ remove target image: $target ..."
  docker image rm $target
else
  echo "@@ $target does not exist."
fi

echo "@@ build target image ..."
docker build -f Dockerfile -t $target .
