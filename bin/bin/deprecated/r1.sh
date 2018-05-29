#!/bin/bash

# Start container
sudo docker run --rm -p 127.0.0.1:2222:22 \
  -v ~/Templates/remarkable-home/:/home/remarkable/ ptman/remarkable 
