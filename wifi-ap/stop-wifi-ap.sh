#!/usr/bin/bash

killall hostapd

brctl delif br0 eth0
ifconfig br0 down
brctl delbr br0

echo "Your network is now dead :)"
