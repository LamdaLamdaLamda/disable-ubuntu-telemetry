ARG UBUNTU_VERSION=22.04
FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
      sudo ca-certificates

WORKDIR /opt/disable-ubuntu-telemetry
COPY disableUbuntuOptOut.sh .
RUN chmod +x disableUbuntuOptOut.sh

ENTRYPOINT ["./disableUbuntuOptOut.sh"]
