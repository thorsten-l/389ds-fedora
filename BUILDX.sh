#!/bin/bash

OS_VERSION=$1
DS_VERSION=$2
LATEST=$3
echo "OS_VERSION=$OS_VERSION"
echo "DS_VERSION=$DS_VERSION"

if [ "true" = "$LATEST" ]; then
  docker buildx build --no-cache \
    --build-arg OS_VERSION="$OS_VERSION" \
    --build-arg DS_VERSION="$DS_VERSION" \
    --push \
    --platform linux/arm64,linux/amd64 \
    --tag "ghcr.io/thorsten-l/389ds-fedora:$DS_VERSION-fc$OS_VERSION" \
    --tag "ghcr.io/thorsten-l/389ds-fedora:$DS_VERSION" \
    --tag "ghcr.io/thorsten-l/389ds-fedora:latest" .
else
  docker buildx build --no-cache \
    --build-arg OS_VERSION="$OS_VERSION" \
    --build-arg DS_VERSION="$DS_VERSION" \
    --push \
    --platform linux/arm64,linux/amd64 \
    --tag "ghcr.io/thorsten-l/389ds-fedora:$DS_VERSION-fc$OS_VERSION" \
    --tag "ghcr.io/thorsten-l/389ds-fedora:$DS_VERSION" .
fi
