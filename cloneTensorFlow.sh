#!/bin/bash
# NVIDIA Jetson TX2
# TensorFlow Installation
# Install Tensorflow repository then
# setup for compilation
# This does not build tensorflow
INSTALL_DIR=$PWD
cd $HOME
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
git checkout v1.5.0

# Apply patch to fix input variable checking issue
git apply < $INSTALL_DIR/patches/0001-configure-eagerly-determine-the-truthfulness-of-envi.patch
