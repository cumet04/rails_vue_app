#!/bin/bash

set -eu

cd $(dirname $0)
cd ../.. # project root

repo=$APP_REPOSITORY

cd backend
docker build -t $repo:latest .
docker tag $repo:latest $repo:$VERSION
docker push $repo:latest
docker push $repo:$VERSION
