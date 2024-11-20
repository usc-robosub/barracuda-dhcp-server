#!/bin/bash

exec dhcpd -4 -f -d --no-pid -cf /etc/dhcp/dhcpd.conf "$INTERFACE"
