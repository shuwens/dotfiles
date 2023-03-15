#!/bin/bash
while ! ./wait-for-it.sh www.google.com:81 --timeout=1; do
   sleep 1
done
