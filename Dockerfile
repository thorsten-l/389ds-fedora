ARG OS_VERSION
FROM fedora:${OS_VERSION}

ARG OS_VERSION
ARG DS_VERSION
ARG TARGETPLATFORM

RUN echo "${DS_VERSION}-fc${OS_VERSION} @ $TARGETPLATFORM"

LABEL description="389 Directory Server. The enterprise-class Open Source LDAP server for Linux."
LABEL maintainer="Thorsten Ludewig <t.ludewig@gmail.com>"
LABEL org.opencontainers.image.authors="Thorsten Ludewig <t.ludewig@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/thorsten-l/389ds-fedora"
LABEL org.opencontainers.image.description="389 Directory Server. The enterprise-class Open Source LDAP server for Linux."
LABEL version=${DS_VERSION}

RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then ARCHITECTURE=x86_64; elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; then ARCHITECTURE=armv7hl; elif [ "$TARGETPLATFORM" = "linux/arm64" ]; then ARCHITECTURE=aarch64; else ARCHITECTURE=x86_64; fi && \
  \
  dnf upgrade -y && \
  \
  curl https://kojipkgs.fedoraproject.org/packages/389-ds-base/${DS_VERSION}/1.fc${OS_VERSION}/noarch/python3-lib389-${DS_VERSION}-1.fc${OS_VERSION}.noarch.rpm -v -o python3-lib389.rpm && \
  curl https://kojipkgs.fedoraproject.org/packages/389-ds-base/${DS_VERSION}/1.fc${OS_VERSION}/${ARCHITECTURE}/389-ds-base-${DS_VERSION}-1.fc${OS_VERSION}.${ARCHITECTURE}.rpm -v -o 389-ds-base.rpm && \
  curl https://kojipkgs.fedoraproject.org/packages/389-ds-base/${DS_VERSION}/1.fc${OS_VERSION}/${ARCHITECTURE}/389-ds-base-libs-${DS_VERSION}-1.fc${OS_VERSION}.${ARCHITECTURE}.rpm -v -o 389-ds-base-libs.rpm && \
  curl https://kojipkgs.fedoraproject.org/packages/389-ds-base/${DS_VERSION}/1.fc${OS_VERSION}/${ARCHITECTURE}/389-ds-base-snmp-${DS_VERSION}-1.fc${OS_VERSION}.${ARCHITECTURE}.rpm -v -o 389-ds-base-snmp.rpm && \
  \
  dnf install -y 389-ds-base-libs.rpm \
  python3-lib389.rpm \
  389-ds-base.rpm \
  389-ds-base-snmp.rpm && \
  \
  dnf clean all && rm -fr *.rpm /var/cache/dnf /var/lib/locale/locale* && \
  mkdir -p /data/config && \
  mkdir -p /data/ssca && \
  ln -s /data/config /etc/dirsrv/slapd-localhost && \
  ln -s /data/ssca /etc/dirsrv/ssca

HEALTHCHECK --start-period=5m --timeout=5s --interval=5s --retries=2 \
CMD /usr/libexec/dirsrv/dscontainer -H

WORKDIR /data
VOLUME /data

EXPOSE 3389 3636

CMD [ "/usr/libexec/dirsrv/dscontainer", "-r" ]
