#!/bin/bash

# https://askubuntu.com/questions/517665/how-to-i-get-the-right-pulseaudio-profiles-to-show-up-without-restarting-pulseau
#
if [ -z "$1" ]; then
  echo "Pulseaudio has these cards:"
  pacmd list-cards | grep 'name: '
  exit 0
fi

MODULE_INDEX=`pacmd list-modules | tac | grep -A 10 -e "argument: .*$1" | grep 'index:' | head -n 1 | cut -d ':' -f 2 | tr -d ' '`
MODULE_NAME=`pacmd list-modules | tac | grep -A 10 -e "argument: .*$1" | grep 'name:' | head -n 1 | cut -d ':' -f 2 | tr -d '<>'`
MODULE_ARGUMENTS=`pacmd list-modules | tac | grep -e "argument: .*$1" | head -n 1 | cut -d ':' -f 2 | tr -d '<>'`
echo "Module index is $MODULE_INDEX"
echo "Module name: $MODULE_NAME"
echo "Module args: $MODULE_ARGUMENTS"

if [ -z "$MODULE_INDEX" ]; then echo "Could not find module index"; exit 0; fi
if [ -z "$MODULE_NAME" ]; then echo "Could not find module name"; exit 0; fi
if [ -z "$MODULE_ARGUMENTS" ]; then echo "Could not find module arguments"; exit 0; fi

echo "Unloading module"
pacmd unload-module $MODULE_INDEX
echo ""
echo "Reloading module"
pacmd load-module $MODULE_NAME $MODULE_ARGUMENTS
echo ""



# pacmd unload-module $MODULE_INDEX
# pacmd load-module alsa_card.usb-USB_Camera_USB_Camera_SN0001-02 module-alsa-card

# name: <module-alsa-card>
# Module args: <device_id="2" name="usb-USB_Camera_USB_Camera_SN0001-02" card_name="alsa_card.usb-USB_Camera_USB_Camera_SN0001-02" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1">
#
#Module name:  module-alsa-card
# Module args:  device_id="2" name="usb-USB_Camera_USB_Camera_SN0001-02" card_name="alsa_card.usb-USB_Camera_USB_Camera_SN0001-02" namereg_fail=false tsched=yes fixed_latency_range=no ignore_dB=no deferred_volume=yes use_ucm=yes avoid_resampling=no card_properties="module-udev-detect.discovered=1"

