#! /bin/bash

#docker login -u "$DOCKER_USER" -p "$DOCKER_PASS"
git clone https://github.com/cesanta/mjs.git
cd mjs/mjs
export TAG=$(git describe --abbrev=0 --tags)
git checkout $TAG
make
cd ../../
docker build .
# docker build -t lukebuk/mjs:latest -t lukebuk/mjs:$TAG .
#docker push lukebuk/mjs
