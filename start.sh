#!/bin/sh

exec docker run \
    --rm --tty --interactive \
    --name=wireguard-socks-proxy \
    --cap-add=NET_ADMIN \
    --publish 127.0.0.1:1080:1080 \
    --sysctl net.ipv4.conf.all.src_valid_mark=1 \
    --privileged \
    --volume "/etc/wireguard:/etc/wireguard/:ro" \
    tunguska-cc/wireguard-socks-proxy:latest
