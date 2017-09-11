FROM ubuntu:16.04

COPY spice-2g6-linux /usr/local/bin/spice

RUN chmod +x /usr/local/bin/spice \
 && apt-get -qq update \
 && apt-get install -yqq \
        vim \
        tmux \
 && apt-get -yqq clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
 && groupadd -r circuits && useradd --no-log-init -r -g circuits circuits

RUN mkdir /home/circuits \
 && chown -R circuits:circuits /home/circuits

COPY vimrc /home/circuits/.vimrc
RUN chown circuits:circuits /home/circuits/.vimrc

USER circuits
WORKDIR /home/circuits
