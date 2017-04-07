#!/bin/bash

cd /usr/local/
git clone https://github.com/facebook/PathPicker.git
cd PathPicker/

ln -s /usr/local/PathPicker/fpp /usr/local/bin/fpp
fpp --help
