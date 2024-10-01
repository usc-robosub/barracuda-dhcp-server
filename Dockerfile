FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y isc-dhcp-server

COPY dhcpd.conf /etc/dhcp/dhcpd.conf

RUN echo "INTERFACESv4=\"$INTERFACE\"" > /etc/default/isc-dhcp-server

EXPOSE 67/udp 68/udp

CMD ["dhcpd", "-4", "-f", "-d", "--no-pid", "-cf", "/etc/dhcp/dhcpd.conf", "$INTERFACE"]