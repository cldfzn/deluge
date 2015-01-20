FROM ubuntu:trusty
MAINTAINER Alex Johnson <alex@cldfzn.com>

RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 249AD24C && \
    echo "deb http://ppa.launchpad.net/deluge-team/ppa/ubuntu $(lsb_release -cs) main" | tee -a /etc/apt/sources.list.d/deluge.list && \
    apt-get -qq update && \
    apt-get -yqq install deluged deluge-web && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD start.sh /
RUN chmod +x /start.sh

VOLUME ["/config"]
EXPOSE 8112 58846
CMD ["/start.sh"]
