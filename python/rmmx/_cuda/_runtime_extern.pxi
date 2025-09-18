

include '_runtime_typedef.pxi'

cdef extern from 'hcr/hc_runtime.h' nogil:
    int hcMemcpyAsync(void* dst, const void* src, size_t count,
                        MemoryKind kind, HCStream stream)
    const char* hcGetErrorName(Error error)
    const char* hcGetErrorString(Error error)
    # Initialization
    int hcDriverGetVersion(int* driverVersion)
    int hcDeviceGetAttribute(int* value, DeviceAttr attr, int device)

    int hcGetDeviceCount(int* count)
    int hcSetDevice(int device)
    int hcGetDevice(int* device)

    int hcDeviceGetName(char *name, int len, int device)
    int hcGetLastError()
    int hcRuntimeGetVersion(int* runtimeVersion)

    int hcDeviceSetLimit(HCLimit limit, size_t value)