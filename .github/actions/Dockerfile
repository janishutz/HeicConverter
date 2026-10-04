FROM ghcr.io/janishutz/docker-pyinstaller

COPY ./build.sh /build/build.sh
RUN chmod +x /build/build.sh

ENTRYPOINT ["/build/build.sh"]
