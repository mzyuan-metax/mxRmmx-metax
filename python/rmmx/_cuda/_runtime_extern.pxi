

include '_runtime_typedef.pxi'

cdef extern from 'mcr/mc_runtime.h' nogil:
    int mcMemcpyAsync(void* dst, const void* src, size_t count,
                        MemoryKind kind, MCStream stream)
    const char* mcGetErrorName(Error error)
    const char* mcGetErrorString(Error error)
    # Initialization
    int mcDriverGetVersion(int* driverVersion)
    int mcDeviceGetAttribute(int* value, DeviceAttr attr, int device)

    int mcGetDeviceCount(int* count)
    int mcSetDevice(int device)
    int mcGetDevice(int* device)

    int mcDeviceGetName(char *name, int len, int device)
    int mcGetLastError()
    int mcRuntimeGetVersion(int* runtimeVersion)

    int mcDeviceSetLimit(MCLimit limit, size_t value)