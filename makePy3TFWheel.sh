#!/bin/bash

# Install prerequisites; remove the "--clean" flag if you wish to keep your bazel compile files
./installPrerequisitesPy3.sh --clean
./cloneTensorFlow.sh

# Don't run this step if you want to manually configure compiled features
./setTensorFlowEVPy3.sh

# Create swap partition and use all resources to compile by default
./buildTensorFlow.sh --swap

# Package the file and store into your home directory :)
./packageTensorFlow.sh
