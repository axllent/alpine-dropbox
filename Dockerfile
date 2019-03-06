FROM frolvlad/alpine-glibc

MAINTAINER Ralph Slooten <axllent@gmail.com>

USER root

RUN apk add --no-cache ca-certificates python3 \
     && wget https://www.dropbox.com/download?dl=packages/dropbox.py -O /usr/local/bin/dropbox-cli \
     && chmod +x /usr/local/bin/dropbox-cli

ADD init.sh /init
RUN chmod +x /init
ADD start.sh /start.sh
RUN chmod +x /start.sh
ADD dropbox-status.sh /usr/local/bin/dropbox-status
RUN chmod +x /usr/local/bin/dropbox-status

WORKDIR /dbox

EXPOSE 17500

ENTRYPOINT ["/init"]

VOLUME ["/dbox/Dropbox", "/dbox/.dropbox"]

CMD ["/start.sh"]
