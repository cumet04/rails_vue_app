#!/bin/bash

set -eu

cd $(dirname $0)
cd ../.. # project root

repo=$WEB_REPOSITORY

cd frontend; image=$(docker build . -q | cut -d: -f2); cd ..

container=$(docker create $image npm run build)
docker start -i $container
docker cp $container:/app/dist/. ./nginx/public/
docker rm $container

cd nginx
docker build -t $repo:latest .
docker tag $repo:latest $repo:$VERSION
docker push $repo:latest
docker push $repo:$VERSION
