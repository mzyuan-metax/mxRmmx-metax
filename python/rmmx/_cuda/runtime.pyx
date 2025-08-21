# Copyright (c) 2025 MetaX Integrated Circuits (Shanghai) Co., Ltd. All Rights Reserved.


from libc.stdlib cimport malloc, free, calloc

from enum import Enum

cimport cython  # NOQA

include '_runtime_extern.pxi'





@cython.embedsignature(True)
def pmcGetErrorName(error : Error_t):
    """ Returns the string representation of an error code enum name.

    Returns a string containing the name of an error code in the enum. If
    the error code is not recognized, "unrecognized error code" is
    returned.

    Parameters
    ----------
    error : Error_t
        Error code to convert to string

    Returns
    -------
    Error_t
        `char*` pointer to a NULL-terminated string
    None
        None


    """
    err = mcGetErrorName(<Error>error)
    return (Error_t.cudaSuccess, err)

@cython.embedsignature(True)
def pmcGetErrorString(error : Error_t):
    """ Returns the description string for an error code.

    Returns the description string for an error code. If the error code is
    not recognized, "unrecognized error code" is returned.

    Parameters
    ----------
    error : cudaError_t
        Error code to convert to string

    Returns
    -------
    cudaError_t
        `char*` pointer to a NULL-terminated string
    None
        None

    """
    err = mcGetErrorString(<Error>error)
    return (Error_t.cudaSuccess, err)



@cython.embedsignature(True)
def pmcDriverGetVersion():
    """ Returns the latest version of MGPU supported by the driver.

    Returns in `*driverVersion` the latest version of MGPU supported by the
    driver. The version is returned as (1000 * major + 10 * minor). For
    example, MGPU 9.2 would be represented by 9020. If no driver is
    installed, then 0 is returned as the driver version.

    This function automatically returns cudaErrorInvalidValue if
    `driverVersion` is NULL.

    Returns
    -------
    cudaError_t
        cudaSuccess
        cudaErrorInvalidValue
    driverVersion : int
        Returns the CUDA driver version.

    See Also
    --------
    cudaRuntimeGetVersion
    cuDriverGetVersion
    """
    cdef int driverVersion = 0
    err = mcDriverGetVersion(&driverVersion)
    return (Error_t(err), driverVersion)


@cython.embedsignature(True)
def pmcGetDeviceCount():
    """ Returns the number of compute-capable devices.

    Returns in `*count` the number of devices with compute capability
    greater or equal to 2.0 that are available for execution.

    Returns
    -------
    Error_t
        Success
    count : int
        Returns the number of devices with compute capability greater or
        equal to 2.0

    See Also

    """
    cdef int count = 0
    err = mcGetDeviceCount(&count)
    return (Error_t(err), count)

@cython.embedsignature(True)
def pmcGetDevice():
    """ Returns which device is currently being used.

    Returns in `*device` the current device for the calling host thread.

    Returns
    -------
    Error_t
        Success
        ErrorInvalidValue
    device : int
        Returns the device on which the active host thread executes the
        device code.

    """
    cdef int device = 0
    err = mcGetDevice(&device)
    return (Error_t(err), device)

@cython.embedsignature(True)
def pmcSetDevice(int device):
    """ Set device to be used for GPU executions.
    Parameters
    ----------
    device : int
        Device on which the active host thread should execute the device
        code.

    Returns
    -------
    Error_t
        Success
        ErrorInvalidDevice
        ErrorDeviceAlreadyInUse
    None
        None


    """
    err = mcSetDevice(device)
    return (Error_t(err),)


@cython.embedsignature(True)
def pmcDeviceGetName(int length, int device_id):
    """ Returns an identifer string for the device.

    Returns an ASCII string identifying the device `dev` in the NULL-
    terminated string pointed to by `name`. `length` specifies the maximum
    length of the string that may be returned.

    Parameters
    ----------
    length : int
        Maximum length of string to store in `name`
    device_id : int
        Device to get identifier string for

    Returns
    -------
    name : bytes
        Returned identifier string for the device

    """
    cdef char* name = <char*>calloc(1, length)
    err = mcDeviceGetName(name, length, device_id)
    return (Error_t(err), <bytes>name)

#@cython.embedsignature(True)
def pmcDeviceGetAttribute(attr , int device):
    """ Returns information about the device.

    Parameters
    ----------
    attr : DeviceAttr
        Device attribute to query
    device : int
        Device number to query

    Returns
    -------
    cudaError_t
        cudaSuccess
        cudaErrorInvalidDevice
        cudaErrorInvalidValue
    value : int
        Returned device attribute value


    """
    cdef int value = 0
    # cdef ccudart.DeviceAttr cattr = attr.value
    err = mcDeviceGetAttribute(&value, <DeviceAttr>attr.value, device)
    return (Error_t(err), value)

@cython.embedsignature(True)
def pmcRuntimeGetVersion():
    """ Returns the latest version of MGPU supported by the runtime.

    Returns
    -------
    cudaError_t
        cudaSuccess
        cudaErrorInvalidValue
    driverVersion : int
        Returns the CUDA driver version.

    See Also
    --------
    cudaRuntimeGetVersion
    cuDriverGetVersion
    """
    cdef int runtimeVersion = 0
    err = mcRuntimeGetVersion(&runtimeVersion)
    return (Error_t(err), runtimeVersion)

@cython.embedsignature(True)
def pmcDeviceSetLimit(limit , int value):
    err = mcDeviceSetLimit(<MCLimit>limit, value)
    return (Error_t(err), )