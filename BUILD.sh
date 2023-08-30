#!/bin/bash

OS_VERSION=39
DS_VERSION=2.4.3
echo "OS_VERSION=$OS_VERSION"
echo "DS_VERSION=$DS_VERSION"

docker build --progress plain \
  --build-arg OS_VERSION="$OS_VERSION" \
  --build-arg DS_VERSION="$DS_VERSION" \
  -t "389ds:base-fedora" .
