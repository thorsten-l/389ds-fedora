#!/bin/bash

OS_VERSION=$1
DS_VERSION=$2
echo "OS_VERSION=$OS_VERSION"
echo "DS_VERSION=$DS_VERSION"
shift
shift

TAGS=""

while (( $# )); do
  TAGS="$TAGS --tag ghcr.io/thorsten-l/389ds-fedora:$1"
  shift
done

BUILDING_TAGS=$(echo $TAGS | tr ' ' "\n")

docker buildx build --no-cache \
  --build-arg OS_VERSION="$OS_VERSION" \
  --build-arg DS_VERSION="$DS_VERSION" \
  --push \
  --platform linux/arm64,linux/amd64 $BUILDING_TAGS .
