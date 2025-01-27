FROM node:latest
WORKDIR /app
RUN apt update -y && apt upgrade -y \
    && apt install -y --no-install-recommends git \
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g pnpm \
    && git clone --depth=1 https://github.com/WhateverItWorks/quetre-reworked.git . \
    && pnpm install
EXPOSE 3000
CMD ["pnpm", "start"]
