FROM alpine:edge
COPY torrc /etc/tor/torrc
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> \
      /etc/apk/repositories && \
    apk add --update tor@testing && \
    rm -rf /var/cache/apk/* && \
    chmod 700 /var/lib/tor
USER tor
CMD ["/usr/bin/tor", "--defaults-torrc", "/etc/tor/torrc"]
