FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y dnsmasq

COPY dnsmasq.conf /etc/dnsmasq.conf

EXPOSE 67/udp 68/udp

CMD ["/bin/bash", "/entrypoint.sh"]