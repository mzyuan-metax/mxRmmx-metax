# BUILD ON MACA

### 1. Download image and start maca container

- [developer.metax-tech.com](https://developer.metax-tech.com/softnova/docker)

### 2. Enter the container to install dependencies

```
apt-get update
apt-get install build-essential libssl-dev libz-dev git unzip -y
```

### 3. Download and install CUDA Toolkit

```
wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda_11.6.0_510.39.01_linux.run
sh cuda_11.6.0_510.39.01_linux.run --silent --toolkit
```

### 4. Init Envs


```
export MACA_PATH="/opt/maca"
export CUDA_PATH=/usr/local/cuda
export CUCC_PATH=${MACA_PATH}/tools/cu-bridge
export PATH=${CUDA_PATH}/bin:${MACA_PATH}/mxgpu_llvm/bin:${MACA_PATH}/bin:${CUCC_PATH}/tools:${CUCC_PATH}/bin:${PATH}
export LD_LIBRARY_PATH=${MACA_PATH}/lib:${MACA_PATH}/ompi/lib:${MACA_PATH}/mxgpu_llvm/lib:${LD_LIBRARY_PATH}
```

### 5. Install Python dependencies

```
$ pip install scikit-build==0.13.1 rapids-logger==0.1.1 cython==3.1.4 cmake==3.26.4 rapids-build-backend-metax==0.3.3.2 scikit-build-core===0.10.0 cuda-python==11.6.0
```

### 6. Build and install

```
$ ./build.sh librmm rmm

...
running install_egg_info
Copying rmmx.egg-info to /opt/conda/lib/python3.10/site-packages/rmmx-0+untagged.2915.gdb28ba4-py3.10.egg-info
running install_scripts
copied 0 files
writing list of installed files to 'record.txt'
```

### 7. Run test


```
$ pip show rmmx
Name: rmmx
Version: 0+untagged.2915.gdb28ba4
Summary: rmmx - Memory Manager Extender
Home-page: 
Author: MGPU Corporation
Author-email: 
License: Apache 2.0
Location: /opt/conda/lib/python3.10/site-packages
Requires: numbax, numpy
Required-by: 
```

Using in Python

```
>>> import rmmx
>>> import numpy as np
>>> a = np.array([1, 2, 3], dtype='float64')
>>> buf = rmmx.DeviceBuffer.to_device(a.tobytes())
>>> buf.size
24
```

GPU Status

```
mx-smi  version: 2.2.6

=================== MetaX System Management Interface Log ===================
Timestamp                                         : Thu Sep 18 14:01:32 2025

Attached GPUs                                     : 1
+---------------------------------------------------------------------------------+
| MX-SMI 2.2.6                        Kernel Mode Driver Version: 2.16.0          |
| MACA Version: 3.0.0.8               BIOS Version: 1.26.1.0                      |
|------------------------------------+---------------------+----------------------+
| GPU     NAME         Persistence-M | Bus-id              | GPU-Util      sGPU-M |
| Temp    Pwr:Usage/Cap         Perf | Memory-Usage        | GPU-State            |
|====================================+=====================+======================|
| 0       MetaX C500             Off | 0000:38:00.0        | 0%            Native |
| 44C     71W / 350W              P9 | 986/65536 MiB       | Available            |
+------------------------------------+---------------------+----------------------+

+---------------------------------------------------------------------------------+
| Process:                                                                        |
|  GPU                    PID         Process Name                 GPU Memory     |
|                                                                  Usage(MiB)     |
|=================================================================================|
|  0                     2477         python                       128            |
+---------------------------------------------------------------------------------+

```

### 8. Build Wheel Package

```
$ cd python
$ python setup.py bdist_wheel
```
