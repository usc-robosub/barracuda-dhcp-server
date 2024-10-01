FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG INTERFACE

RUN apt-get update && apt-get install -y isc-dhcp-server iproute2

# Ensure the /var/lib/dhcp directory exists
RUN mkdir -p /var/lib/dhcp/

# Create the dhcpd.leases file and set the appropriate permissions
RUN touch /var/lib/dhcp/dhcpd.leases && \
    chmod 664 /var/lib/dhcp/dhcpd.leases

COPY dhcpd.conf /etc/dhcp/dhcpd.conf
COPY entrypoint.sh /entrypoint.sh

RUN echo "INTERFACESv4=\"$INTERFACE\"" > /etc/default/isc-dhcp-server

EXPOSE 67/udp 68/udp

CMD ["/bin/bash", "/entrypoint.sh"]