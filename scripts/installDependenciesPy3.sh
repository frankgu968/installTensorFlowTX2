#!/bin/bash
# NVIDIA Jetson TX2
# Install TensorFlow dependencies
# Install Java JDK 8
sudo apt-get update
sudo apt-get install build-essential openjdk-8-jdk python zip -y

# Install other dependencies
sudo apt-get install zip unzip autoconf automake libtool curl zlib1g-dev maven -y
# Install Python 3.x
sudo apt-get install python3-numpy swig python3-dev python3-pip python3-wheel -y
