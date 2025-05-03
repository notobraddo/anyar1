# Menggunakan image dasar Ubuntu
FROM ubuntu:20.04

# Set non-interactive mode untuk menghindari prompt selama instalasi
ARG DEBIAN_FRONTEND=noninteractive

# Memperbarui repositori dan menginstal dependensi
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    unzip \
    build-essential \
    libssl-dev \
    pkg-config \
    libm-dev \
    libssl3 \
    && rm -rf /var/lib/apt/lists/*

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Tambahkan Bun ke PATH
ENV PATH="$HOME/.bun/bin:$PATH"

# Install Foundry
RUN curl -fsSL https://foundry.paradigm.xyz | bash
RUN source ~/.bashrc && foundryup

# Install vlayer
RUN curl -fsSL https://install.vlayer.xyz | bash

# Direktori kerja
WORKDIR /workspace

# Menyiapkan entrypoint untuk menjalankan aplikasi
ENTRYPOINT ["bash"]
