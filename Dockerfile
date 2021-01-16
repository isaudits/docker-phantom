FROM isaudits/msf:minimal
    
RUN apt-get -y update && \
    apt-get install -y python3-openssl gcc-multilib mingw-w64 binutils-common osslsigncode apktool apksigner zipalign && \
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

