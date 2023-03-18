#!/bin/bash

OS_VERSION=36
DS_VERSION=2.1.7
echo "OS_VERSION=$OS_VERSION"
echo "DS_VERSION=$DS_VERSION"

docker build --no-cache \
  --build-arg OS_VERSION="$OS_VERSION" \
  --build-arg DS_VERSION="$DS_VERSION" \
  -t "389ds:base-fedora" .
