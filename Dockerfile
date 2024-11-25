FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y dnsmasq iputils-ping

COPY dnsmasq.conf /etc/dnsmasq.conf
COPY entrypoint.sh /entrypoint.sh

EXPOSE 53/udp 67/udp

CMD ["/bin/bash", "/entrypoint.sh"]