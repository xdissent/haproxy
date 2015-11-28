FROM node:4.2.2
RUN echo deb http://httpredir.debian.org/debian jessie-backports main > /etc/apt/sources.list.d/backports.list && \
  curl http://haproxy.debian.net/bernat.debian.org.gpg | apt-key add - && \
  echo deb http://haproxy.debian.net jessie-backports-1.6 main > /etc/apt/sources.list.d/haproxy.list && \
  apt-get update && apt-get install -y haproxy -t jessie-backports-1.6 && \
  apt-get install -y psmisc && \
  rm -rf /var/lib/apt/lists/*
WORKDIR /app
ADD . /app/
RUN npm i --unsafe-perm && npm cache clean && rm -rf /tmp/npm*
