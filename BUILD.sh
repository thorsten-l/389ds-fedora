#!/bin/bash

OS_VERSION=39
DS_VERSION=2.4.1
echo "OS_VERSION=$OS_VERSION"
echo "DS_VERSION=$DS_VERSION"

docker build --no-cache --progress plain \
  --build-arg OS_VERSION="$OS_VERSION" \
  --build-arg DS_VERSION="$DS_VERSION" \
  -t "389ds:base-fedora" .
