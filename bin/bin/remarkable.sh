#!/bin/bash


# Start container
sudo docker run --rm -p 127.0.0.1:2222:22 \
  -v $(pwd)/remarkable-home/:/home/remarkable/ ptman/remarkable 
# Connect
ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
  -p 2222 -Y -l remarkable localhost /opt/remarkable/reMarkable 
