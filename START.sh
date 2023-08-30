
rm -f rm data/run/slapd-localhost.socket
docker run --name 389ds-base --rm -p 13389:3389 -p 13636:3636 \
  -v `pwd`/data:/data 389ds:base-fedora
