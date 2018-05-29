#!/bin/bash

# Connect
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
  -p 2222 -Y -l remarkable localhost /opt/remarkable/reMarkable 
