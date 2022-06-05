# We want latest LTS Ubuntu
FROM ubuntu:jammy
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install base dependencies
RUN apt-get update && apt-get -y --no-install-recommends upgrade && apt-get -y install --no-install-recommends curl locales git xz-utils bzip2 python3 ca-certificates
RUN update-ca-certificates
# Node 12 (default in Ubuntu 22.04) is too old
RUN curl -sS https://deb.nodesource.com/setup_16.x | bash
RUN apt-get -y install --no-install-recommends nodejs
# Install swap dependencies
RUN DEBIAN_FRONTEND=noninteractive TZ="America/Chicago" apt-get -y install build-essential cmake pkg-config libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libpgm-dev qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev python3 ccache doxygen graphviz tzdata