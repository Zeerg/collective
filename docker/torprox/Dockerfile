FROM alpine:edge

RUN apk -U upgrade && \
    apk add tor curl privoxy && \
    rm -rf /var/cache/apk/*

RUN chmod 700 /var/lib/tor 
COPY torrc /etc/tor/
COPY privoxy-config /etc/privoxy/config
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

EXPOSE 8118

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]