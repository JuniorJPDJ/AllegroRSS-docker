FROM node:latest
MAINTAINER Ivan Vanderbyl <ivan@flood.io>

# Based on instructions at https://github.com/segmentio/nightmare/issues/224

RUN apt-get update

# Installing the packages needed to run Nightmare
RUN apt-get install -y \
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


RUN mkdir -p /workspace
WORKDIR /workspace
RUN mkdir ./tmp

ADD package.json .

RUN npm install

ADD . .

ENTRYPOINT ["xvfb-run", '--server-args="-screen 0 1024x768x24"', 'node', '--harmony-async-await']
CMD ["index.js"]
