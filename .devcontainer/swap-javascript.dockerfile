# We want latest LTS Ubuntu
FROM ubuntu:jammy
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Install dependencies this project needs
RUN apt-get update && apt-get -y --no-install-recommends upgrade && apt-get -y install --no-install-recommends curl git xz-utils bzip2 python3 ca-certificates
RUN update-ca-certificates
# Node 12 (default in Ubuntu 22.04) is too old
RUN curl -sS https://deb.nodesource.com/setup_16.x | bash
RUN apt-get -y install --no-install-recommends nodejs
# Install Emscripten SDK
RUN git clone https://github.com/emscripten-core/emsdk.git
WORKDIR /emsdk
RUN git pull && ./emsdk install 3.1.13 && ./emsdk activate 3.1.13
