#!/usr/bin/env bash

set -o errexit -o pipefail -o nounset

if [[ $(uname -s) == "Darwin" ]]; then
  FILE=thrift-0.9.1-darwin
else
  FILE=thrift-0.9.1-linux
fi

echo "downloading thrift from github"
mkdir -p bin
curl -sfo bin/thrift-0.9.1 https://raw.githubusercontent.com/finn-no/thrift-binaries/main/$FILE

chmod 755 bin/thrift-0.9.1
ln -s thrift-0.9.1 bin/thrift

echo "$(bin/thrift --version) downloaded and installed to $(pwd)/bin"
