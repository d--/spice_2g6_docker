FROM alpine:3.6

COPY spice-2g6-linux /usr/local/bin/spice

RUN chmod +x /usr/local/bin/spice \
 && apk add --no-cache \
        vim \
        tmux

COPY vimrc /root/.vimrc
WORKDIR /root/workspace
