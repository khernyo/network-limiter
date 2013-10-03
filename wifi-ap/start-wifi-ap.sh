#!/usr/bin/bash

# The following packages are required: hostapd, bridge-utils

brctl addbr br0
ifconfig eth0 0.0.0.0
brctl addif br0 eth0

hostapd -B hostapd.conf

echo "The WPA password is:"
grep ^wpa_passphrase hostapd.conf
