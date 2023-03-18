
docker run --name 389ds-fedora --rm -p 3389:3389 -p 3636:3636 \
  -v `pwd`/data:/data ghcr.io/thorsten-l/389ds-fedora:latest
