#!/bin/bash

# install open jdk
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-7-jdk -y

echo "export JAVA_HOME='/usr/lib/jvm/java-7-openjdk-amd64'" > ~/.bashrc

# install utils
sudo apt-get install ssh rsync vim git emacs -y

# download hadoop
wget http://mirror.metrocast.net/apache/hadoop/common/stable/hadoop-2.7.3.tar.gz

tar xzvf hadoop*

cd hadoop*

bin/hadoop



