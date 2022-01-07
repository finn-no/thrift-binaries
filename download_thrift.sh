#!/usr/bin/env bash

set -o errexit -o pipefail -o nounset

VERSION=0.9.1
NAME=thrift-$VERSION

if [[ $(uname -s) == "Darwin" ]]; then
  FILE=$NAME-darwin
else
  FILE=$NAME-linux
fi

echo "downloading thrift from github"
mkdir -p bin
curl -sfo bin/$NAME https://raw.githubusercontent.com/finn-no/thrift-binaries/main/$FILE

chmod 755 bin/$NAME
ln -s $NAME bin/thrift

echo "$(bin/thrift --version) downloaded and installed to $(pwd)/bin"
