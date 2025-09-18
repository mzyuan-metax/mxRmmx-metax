# 2025 - Modified by MetaX Integrated Circuits (Shanghai) Co., Ltd. All Rights Reserved.

# Copyright (c) 2020, NVIDIA CORPORATION.

import numbax.cuda     # remove on HGPU

from rmmx._cuda import runtime

class CUDARuntimeError(RuntimeError):
    def __init__(self, status: runtime.Error_t):
        self.status = status
        _, name = runtime.phcGetErrorString(status)
        _, msg = runtime.phcGetErrorString(status)

        super(CUDARuntimeError, self).__init__(
            f"{name.decode()}: {msg.decode()}"
        )

    def __reduce__(self):
        return (type(self), (self.status,))


def driverGetVersion():
    """
    Returns in the latest version of CUDA supported by the driver.
    The version is returned as (1000 major + 10 minor). For example,
    CUDA 9.2 would be represented by 9020. If no driver is installed,
    then 0 is returned as the driver version.

    This function automatically raises CUDARuntimeError with error message
    and status code.
    """
    status, version = runtime.phcDriverGetVersion()
    if status != runtime.Error_t.cudaSuccess:
        raise CUDARuntimeError(status)
    return version


def getDevice():
    """
    Get the current CUDA device
    """
    status, device = runtime.phcGetDevice()
    if status != runtime.Error_t.cudaSuccess:
        raise CUDARuntimeError(status)
    return device


def setDevice(device: int):
    """
    Set the current CUDA device
    Parameters
    ----------
    device : int
        The ID of the device to set as current
    """
    (status,) = runtime.phcSetDevice(device)
    if status != runtime.Error_t.cudaSuccess:
        raise CUDARuntimeError(status)


def runtimeGetVersion():
    """
    Returns the version number of the current CUDA Runtime instance.
    The version is returned as (1000 major + 10 minor). For example,
    CUDA 9.2 would be represented by 9020.

    This calls numbax.cuda.runtime.get_version() rather than cuda-python due to
    current limitations in cuda-python.
    """
    # TODO: Replace this with `cuda.cudart.cudaRuntimeGetVersion()` when the
    # limitation is fixed.
    major, minor = numbax.cuda.runtime.get_version()       # no numbax on HGPU
    return major * 1000 + minor * 10


def getDeviceCount():
    """
    Returns the number of devices with compute capability greater or
    equal to 2.0 that are available for execution.

    This function automatically raises CUDARuntimeError with error message
    and status code.
    """
    status, count = runtime.phcGetDeviceCount()
    if status != runtime.Error_t.cudaSuccess:
        raise CUDARuntimeError(status)
    return count


def getDeviceAttribute(attr: runtime.cudaDeviceAttr, device: int):
    """
    Returns information about the device.

    Parameters
    ----------
        attr : cudaDeviceAttr
            Device attribute to query
        device : int
            Device number to query

    This function automatically raises CUDARuntimeError with error message
    and status code.
    """
    status, value = runtime.phcDeviceGetAttribute(attr, device)
    if status != runtime.Error_t.cudaSuccess:
        raise CUDARuntimeError(status)
    return value


# no one called this function
# def getDeviceProperties(device: int):
#     """
#     Returns information about the compute-device.

#     Parameters
#     ----------
#         device : int
#             Device number to query

#     This function automatically raises CUDARuntimeError with error message
#     and status code.
#     """
#     # status, prop = cudart.cudaGetDeviceProperties(device)
#     status, prop = runtime.phcGetDeviceProperties(device)
#     if status != runtime.Error_t.cudaSuccess:
#         raise CUDARuntimeError(status)
#     return prop


def deviceGetName(device: int):
    """
    Returns an identifier string for the device.

    Parameters
    ----------
        device : int
            Device number to query

    This function automatically raises CUDARuntimeError with error message
    and status code.
    """

    status, device_name = runtime.phcDeviceGetName(256, device)
    if status != runtime.Error_t.cudaSuccess:
        raise CUDARuntimeError(status)
    return device_name.decode()
