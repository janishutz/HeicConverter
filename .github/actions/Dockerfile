FROM archlinux

COPY ./build.sh /build/build.sh
COPY ./prepare.sh /build/prepare.sh
RUN chmod +x /build/build.sh
RUN chmod +x /build/prepare.sh

RUN /build/prepare.sh

ENTRYPOINT ["/build/build.sh"]
