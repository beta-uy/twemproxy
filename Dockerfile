FROM gcc

COPY . /usr/src/twemproxy
WORKDIR /usr/src/twemproxy
RUN \
  autoreconf -h && \
  autoreconf -fvi && \
  ./configure --enable-debug=full && \
  make && \
  make install
  # ./configure && \

ENTRYPOINT ["/usr/src/twemproxy/docker/entrypoint.sh"]
CMD ["nutcracker", "-c", "conf/nutcracker.yml", "-v", "11", "-m", "524288"]
