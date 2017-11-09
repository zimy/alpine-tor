FROM alpine:3.6
COPY torrc /etc/tor/torrc
RUN echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> \
      /etc/apk/repositories && \
    apk add --update tor@testing && \
    rm -rf /var/cache/apk/* && \
    chmod 700 /var/lib/tor
USER tor
RUN mkdir /var/lib/tor/hs
CMD ["sh", "-c","cp /srv/pk /var/lib/tor/hs/private_key && chmod 700 /var/lib/tor/hs && route && ip a && /usr/bin/tor --defaults-torrc /etc/tor/torrc"]
