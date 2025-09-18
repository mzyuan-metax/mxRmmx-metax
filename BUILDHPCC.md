# BUILD ON HPCC

### 1. Download image and start hpcc container

Use hpcc vllm image

- [cr.metax-tech.com/public-ai-release-wb/hpcc/modelzoo.llm.vllm:hpcc.ai2.33.0.13-torch2.6-py310-ubuntu22.04-amd64
](cr.metax-tech.com/public-ai-release-wb/hpcc/modelzoo.llm.vllm:hpcc.ai2.33.0.13-torch2.6-py310-ubuntu22.04-amd64)

Start Container

```
docker run -itd --name test-build \
--device=/dev/dri \
--device=/dev/htcd   \
--device=/dev/infiniband \
--privileged=true \
--group-add video \
--network=host \
--security-opt seccomp=unconfined \
--security-opt apparmor=unconfined \
--shm-size 100gb --ulimit memlock=-1 \
-v /data:/data \
cr.metax-tech.com/public-ai-release-wb/hpcc/modelzoo.llm.vllm:hpcc.ai2.33.0.13-torch2.6-py310-ubuntu22.04-amd64
```

### 2. Enter the container to install dependencies

```
apt-get update
apt-get install build-essential libssl-dev libz-dev git unzip vim -y
```

### 3. Download and install CUDA Toolkit

```
wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda_11.6.0_510.39.01_linux.run
sh cuda_11.6.0_510.39.01_linux.run --silent --toolkit
```

### 4. Init Envs

source hpcc envs

```
export HPCC_PATH="/opt/hpcc"
export CUDA_PATH=/usr/local/cuda
export CUCC_PATH=${HPCC_PATH}/tools/cu-bridge
export PATH=${CUDA_PATH}/bin:${HPCC_PATH}/htgpu_llvm/bin:${HPCC_PATH}/bin:${CUCC_PATH}/tools:${CUCC_PATH}/bin:${PATH}
export LD_LIBRARY_PATH=${HPCC_PATH}/lib:${HPCC_PATH}/ompi/lib:${HPCC_PATH}/htgpu_llvm/lib:${LD_LIBRARY_PATH}
```




### 5. Install Python dependencies

```
$ pip install scikit-build==0.13.1 rapids-logger==0.1.1 cython==3.1.4 cmake==3.26.4 rapids-build-backend-metax==0.3.3.2 scikit-build-core===0.10.0 cuda-python==11.6.0
```

### 6. Build and install

```
$ ./build.sh librmm rmm

...
copied 26 files
running install_egg_info
Copying rmmx.egg-info to /opt/conda/lib/python3.10/site-packages/rmmx-0+untagged.2916.g55346dd.dirty-py3.10.egg-info
running install_scripts
copied 0 files
writing list of installed files to 'record.txt'
```

If there are network or CMake download errors, please try compiling again multiple times

```
$ ./build clean
$ ./build.sh librmm rmm
```

### 7. Run test

7.1 rmmx

```
$ pip show rmmx
Name: rmmx
Version: 0+untagged.2916.g55346dd.dirty
Summary: rmmx - Memory Manager Extender
Home-page: 
Author: HGPU Corporation
Author-email: 
License: Apache 2.0
Location: /opt/conda/lib/python3.10/site-packages
Requires: numbax, numpy
Required-by: 
```

7.2 Using in Python

```
$ python
>>> import rmmx
>>> import numpy as np
>>> a = np.array([1, 2, 3], dtype='float64')
>>> buf = rmmx.DeviceBuffer.to_device(a.tobytes())
>>> buf.size
24
```

Q: ImportError: libfmt.so.11: cannot open shared object file: No such file or directory

```
export PATH=/opt/conda/include:${PATH}
export LD_LIBRARY_PATH=/opt/conda/lib/:${LD_LIBRARY_PATH}
```

7.3 GPU Status

```
ht-smi  version: 2.2.4

=================== Mars System Management Interface Log ===================
Timestamp                                         : Thu Sep 18 17:12:24 2025

Attached GPUs                                     : 8
+---------------------------------------------------------------------------------+
| HT-SMI 2.2.4                        Kernel Mode Driver Version: 2.15.9          |
| HPCC Version: 2.33.0.12             BIOS Version: 1.25.1.0                      |
|------------------------------------+---------------------+----------------------+
| GPU         NAME                   | Bus-id              | GPU-Util             |
| Temp        Pwr:Usage/Cap          | Memory-Usage        | GPU-State            |
|====================================+=====================+======================|
| 0           Mars X201              | 0000:1b:00.0        | 0%                   |
| 43C         78W / 350W             | 831/65536 MiB       | Available            |
+------------------------------------+---------------------+----------------------+

+---------------------------------------------------------------------------------+
| Process:                                                                        |
|  GPU                    PID         Process Name                 GPU Memory     |
|                                                                  Usage(MiB)     |
|=================================================================================|
|  0                  3023806         python                       4              |
+---------------------------------------------------------------------------------+


```
