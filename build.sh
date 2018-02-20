#! /bin/bash

git clone https://github.com/cesanta/mjs.git
cd mjs
if [ -n "$1" ]; then
    export MJS_TAG="$1"
else
    export MJS_TAG=$(git describe --abbrev=0 --tags)
fi
git checkout $MJS_TAG
cd ../
BUILD_IMAGE=$(docker build -q -f Dockerfile.build .)
docker run -v $(pwd)/mjs:/mjs -w /mjs/mjs --privileged --rm -it $BUILD_IMAGE sh -c "dockerd > /dev/null 2>&1 & make"
docker rmi $BUILD_IMAGE
docker build -t lukebuk/mjs:$MJS_TAG .
rm -rf mjs
