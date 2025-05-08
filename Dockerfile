# Use Ubuntu as base
FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    gcc \
    ruby \
    ruby-dev \
    git \
    curl \
    python3 \
    python3-pip \
    gcc-arm-none-eabi \
    gdb-multiarch \
    qemu-system-arm \
    && rm -rf /var/lib/apt/lists/*

# Install Ceedling via gem
RUN gem install ceedling

# Set working directory inside the container
WORKDIR /project

# Copy everything into the container
COPY . .

# Default command when running container
CMD ["ceedling", "test:all"]
