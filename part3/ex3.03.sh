#!/bin/sh
set -euxo pipefail

function cleanup {
    echo "removing ./dockergittemp"
    rm -rf ./dockergittemp
}
trap cleanup EXIT

git clone "https://github.com/$1" ./dockergittemp
cd dockergittemp

docker build . -t $2

docker push $2

cd ..