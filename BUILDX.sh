#!/bin/bash

OS_VERSION=$1
DS_VERSION=$2
echo "OS_VERSION=$OS_VERSION"
echo "DS_VERSION=$DS_VERSION"

docker buildx build --no-cache \
  --build-arg OS_VERSION="$OS_VERSION" \
  --build-arg DS_VERSION="$DS_VERSION" \
  --push \
  --platform linux/arm64,linux/amd64 \
  --tag "ghcr.io/thorsten-l/389ds-fedora:$DS_VERSION" \
  --tag "ghcr.io/thorsten-l/389ds-fedora:$DS_VERSION-fc$OS_VERSION" .
