FROM bexio/base:latest

USER root
ENV HOME /root
WORKDIR /root

VOLUME ["/var/lib/bitcoin"]
EXPOSE 8332
EXPOSE 8333
EXPOSE 18332
EXPOSE 18333

CMD ["server:start"]

ADD ./install-bitcoind.sh /tmp/install-bitcoind.sh
RUN /tmp/install-bitcoind.sh

ADD ./bitcoin.conf /etc/bitcoin/bitcoin.conf

ADD ./commands /usr/local/bin
