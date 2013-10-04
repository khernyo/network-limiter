#!/bin/bash

# The following packages are required: hostapd, bridge-utils

set -e

[ `id -u` -eq 0 ] || {
	echo "You need to run this script as root!"
	exit 1
}

SCRIPT_DIR=`dirname $0`
HOSTAPD_CONF=$SCRIPT_DIR/hostapd.conf

brctl addbr br0
ifconfig eth0 0.0.0.0
brctl addif br0 eth0

hostapd -B $HOSTAPD_CONF

echo "The WPA password is:"
grep ^wpa_passphrase $HOSTAPD_CONF
