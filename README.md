# 389ds-fedora
Build multi architecture Docker images for 389ds on Fedora

### docker run

```bash
docker run --name 389ds-fedora --rm -p 3389:3389 -p 3636:3636 \
  -v `pwd`/data:/data ghcr.io/thorsten-l/389ds-fedora:latest
```

### macOS

1. rm -f ./data/run/slapd-localhost.socket
2. sudo xattr -rc data
3. docker run ...
