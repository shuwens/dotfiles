#!/bin/bash
#set -ex

# I disabled my touchpad because I hate those things. You can find the id
# of a device you want to disable using "xinput list"; unfortunately it can
# change depending on what devices you have plugged into USB. We extract the
# id of the device from the output of xinput, then use it to disable the
# device
TOUCHPAD_ID=`xinput | grep 'SynPS/2 Synaptics TouchPad' | cut -f 2 | cut -f 2 -d =`
TKP_EXTRA_ID=`xinput | grep 'ThinkPad Extra Buttons' | cut -f 2 | cut -f 2 -d =`
xinput set-prop $TOUCHPAD_ID "Device Enabled"  0  &
xinput set-prop $TKP_EXTRA_ID "Device Enabled" 1  &

