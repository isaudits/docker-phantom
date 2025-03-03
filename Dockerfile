FROM isaudits/msf:latest

ARG TOOLS_BASE="python3-openssl mingw-w64 binutils-common osslsigncode apktool apksigner zipalign"

# These fail to install on ARM version due to dependency issues
ARG TOOLS_linux/amd64="gcc-multilib"

# Replacement installers for ARM version
ARG TOOLS_linux/arm64="gcc-multilib-x86-64-linux-gnu"
    
RUN apt-get -y update && \
    apt-get install -y --no-install-recommends $TOOLS_BASE && \
    apt-get install -y --no-install-recommends $TOOLS_${TARGETARCH} && \
    cd /opt/ && \
    git clone --depth=1 https://github.com/oddcod3/Phantom-Evasion /opt/Phantom-Evasion && \
    cd /opt/Phantom-Evasion/ && \
    chmod 755 phantom-evasion.py && \
    # Cleanup
    rm -rf /opt/Phantom-Evasion/.git && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/Phantom-Evasion

CMD ["/bin/bash"]

