#!/bin/bash
# NVIDIA Jetson TX2
# TensorFlow Installation
# Export TensorFlow GPU environment variables
# WARNING This needs to match setTensorFlowEV.sh settings

# To check CuDNN version, use the following:
#   $ cat cudnn_v7.h | grep CUDNN_MAJOR -A 2
# File not found error  -> CuDNN not installed

# To check CUDA version, use the following:
#   $ nvcc --version
# nvcc command not found -> CUDA toolkit not installed

export TF_NEED_CUDA=1
export TF_CUDA_VERSION=9.0
export CUDA_TOOLKIT_PATH=/usr/local/cuda
export TF_CUDNN_VERSION=7.0.5
export CUDNN_INSTALL_PATH=/usr/lib/aarch64-linux-gnu/
export TF_CUDA_COMPUTE_CAPABILITIES=6.2
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

# Build Tensorflow
cd $HOME/tensorflow

# Cherry pick 2 commits to fix bazel version checking problem...
git cherry-pick -x 3f57956725b553d196974c9ad31badeb3eabf8bb
git cherry-pick -x 6fcfab770c2672e2250e0f5686b9545d99eb7b2b

if [ $1 = "--swap" ]; then
  ./createSwapfile.sh
  bazel build -c opt --verbose_failures --config=cuda //tensorflow/tools/pip_package:build_pip_package
else
  bazel build -c opt --verbose_failures --config=cuda //tensorflow/tools/pip_package:build_pip_package
fi
