FROM gcc

COPY . /usr/src/twemproxy
WORKDIR /usr/src/twemproxy
RUN \
  autoreconf -h && \
  autoreconf -fvi && \
  ./configure && \
  make && \
  make install

ENTRYPOINT ["/usr/src/twemproxy/docker/entrypoint.sh"]
CMD ["nutcracker", "-c", "conf/nutcracker.yml"]
