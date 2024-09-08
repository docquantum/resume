# Github Action environment
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update \
    && apt-get install -y \
    curl \
    gpp \
    pandoc \
    && curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && apt-get install -y ./google-chrome-stable_current_amd64.deb \
    && rm google-chrome-stable_current_amd64.deb \
    && apt-get clean

# Setup non-root user
RUN useradd -m -s /bin/bash -u 1000 user

# Run as non-root user
USER user
