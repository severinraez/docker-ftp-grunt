FROM debian:stretch

RUN \
  apt update && \
  apt install -y lftp && \
  rm -rf /var/lib/apt/lists/*

ADD run /opt/grunt/run

RUN \
  useradd -u 1000 -ms /bin/bash app && \
  chown -R app: /opt/grunt

USER app

WORKDIR /opt/grunt

COMMAND run