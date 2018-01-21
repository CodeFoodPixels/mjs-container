#! /bin/bash

git clone https://github.com/cesanta/mjs.git
cd mjs
export MJS_TAG=$(git describe --abbrev=0 --tags)
git checkout $MJS_TAG
cd ../
BUILD_IMAGE=$(docker build -q -f Dockerfile.build .)
docker run -v $(pwd)/mjs:/mjs -w /mjs/mjs --privileged --rm -it $BUILD_IMAGE sh -c "dockerd > /dev/null 2>&1 & make"
docker rmi $BUILD_IMAGE
docker build -t lukebuk/mjs:latest -t lukebuk/mjs:$MJS_TAG .
rm -rf mjs
