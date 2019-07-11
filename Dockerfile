FROM node:latest

EXPOSE 80/tcp

ENV PORT=80
ENV LISTENHOST="0.0.0.0"

# Installing the packages needed to run Nightmare
RUN apt-get update && apt-get install -y \
  xvfb \
  x11-xkb-utils \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic \
  x11-apps \
  clang \
  libdbus-1-dev \
  libgtk2.0-dev \
  libnotify-dev \
  libgnome-keyring-dev \
  libgconf2-dev \
  libasound2-dev \
  libcap-dev \
  libcups2-dev \
  libxtst-dev \
  libxss1 \
  libnss3-dev \
  gcc-multilib \
  g++-multilib

ENV DEBUG="nightmare"

WORKDIR /workspace

ADD ./AllegroRSS .
RUN npm install

COPY entrypoint.sh /entrypoint
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint", "node"]

CMD ["index.js"]
