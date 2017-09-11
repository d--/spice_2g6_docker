FROM ubuntu:16.04

COPY spice-2g6-linux /usr/local/bin/spice

RUN chmod +x /usr/local/bin/spice \
 && apt-get -qq update \
 && apt-get install -yqq \
        vim \
        tmux \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY vimrc /root/.vimrc
WORKDIR /root/workspace
