#!/bin/bash

OS_VERSION="41"
DS_VERSION="2.6.1"
echo "OS_VERSION=$OS_VERSION"
echo "DS_VERSION=$DS_VERSION"

docker build -f Dockerfile-debug --progress plain \
  --build-arg OS_VERSION="$OS_VERSION" \
  --build-arg DS_VERSION="$DS_VERSION" \
  -t "389ds:base-fedora" .
