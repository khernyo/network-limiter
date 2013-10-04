#!/bin/bash

set -e

[ `id -u` -eq 0 ] || {
	echo "You need to run this script as root!"
	exit 1
}

killall hostapd

brctl delif br0 eth0
ifconfig br0 down
brctl delbr br0

