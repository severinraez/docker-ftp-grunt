FROM debian:stretch

RUN \
  apt update && \
  apt install -y lftp locales && \
  sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.UTF-8 && \
  rm -rf /var/lib/apt/lists/*

ADD run /opt/grunt/run

RUN \
  useradd -u 1000 -ms /bin/bash app && \
  chown -R app: /opt/grunt

USER app

ENV \
  LC_ALL=en_US.UTF-8 \
  LANG=en_US.UTF-8 \
  LANGUAGE=en_US.UTF-8 \
  TARGET_FOLDER=/opt/grunt/download \
  PATHS_LIST=/opt/grunt/paths_list

WORKDIR /opt/grunt

CMD ./run