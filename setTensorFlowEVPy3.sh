#!/bin/bash
# NVIDIA Jetson TX2
# TensorFlow Installation
# Build TensorFlow

cd $HOME/tensorflow

# Setup the environment variables for configuration
# PYTHON Path is the default
default_python_bin_path=$(which python3)
export PYTHON_BIN_PATH=$default_python_bin_path

default_python_lib_path=/usr/lib/python3/dist-packages
export PYTHON_LIB_PATH=$default_python_lib_path
# No Google Cloud Platform support
export TF_NEED_GCP=0
# No Hadoop file system support
export TF_NEED_HDFS=0
export TF_NEED_S3=0
# Use CUDA
export TF_NEED_CUDA=1
# Setup gcc ; just use the default
default_gcc_host_compiler_path=$(which gcc)
export GCC_HOST_COMPILER_PATH=$default_gcc_host_compiler_path
# TF CUDA Version
export TF_CUDA_VERSION=9.0
# CUDA path
default_cuda_path=/usr/local/cuda
export CUDA_TOOLKIT_PATH=$default_cuda_path
# cuDNN
export TF_CUDNN_VERSION=7.0.5
default_cudnn_path=/usr/lib/aarch64-linux-gnu
export CUDNN_INSTALL_PATH=$default_cudnn_path
# CUDA compute capability
export TF_CUDA_COMPUTE_CAPABILITIES=6.2
export CC_OPT_FLAGS=-march=native
export TF_NEED_JEMALLOC=1
export TF_NEED_OPENCL=0
export TF_ENABLE_XLA=0
# Added for TensorFlow 1.3
export TF_NEED_MKL=0
export TF_NEED_MPI=0
export TF_NEED_VERBS=0
export TF_NEED_GDR=0
export TF_NEED_OPENCL_SYCL=0
export TF_SET_ANDROID_WORKSPACE=0
# Use nvcc for CUDA compiler
export TF_CUDA_CLANG=0


source ./configure
