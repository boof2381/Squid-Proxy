FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY squid.conf /etc/squid/squid.conf

EXPOSE 3128

CMD ["bash", "-c", "sleep 1 && squid -N -d 1"]