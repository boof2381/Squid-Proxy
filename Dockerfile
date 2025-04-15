# Base image
FROM ubuntu:20.04

# Avoid interactive prompts during package install
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install Squid
RUN apt-get update && \
    apt-get install -y squid && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy your custom Squid config
COPY squid.conf /etc/squid/squid.conf

# Expose Squid's default port
EXPOSE 3128

# Run Squid in the foreground with debugging enabled
CMD ["squid", "-NYCd", "1"]