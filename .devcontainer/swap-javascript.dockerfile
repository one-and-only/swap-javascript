# We want latest LTS Ubuntu
FROM ubuntu:jammy
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# Node 12 (default in Ubuntu 22.04) is too old
RUN curl -sSl https://deb.nodesource.com/setup_17.x | bash
RUN apt-get -y install --no-install-recommends python3 nodejs npm
# Update submodules
RUN ./bin/update_submodules.sh
# Install Emscripten SDK
RUN git clone https://github.com/emscripten-core/emsdk.git
RUN cd emsdk && git pull && ./emsdk install latest-upstream && ./emsdk activate latest-upstream