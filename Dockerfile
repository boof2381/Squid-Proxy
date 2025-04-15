  FROM ubuntu:20.04

  RUN apt-get update && \
      DEBIAN_FRONTEND=noninteractive apt-get install -y squid apache2-utils && \
      rm -rf /var/lib/apt/lists/*

  COPY squid.conf /etc/squid/squid.conf

  EXPOSE 3128

  CMD ["squid", "-N", "-d", "1"]
