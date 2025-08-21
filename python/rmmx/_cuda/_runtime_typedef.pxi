# Keep in sync with typenames exported in `runtime.pxd`.

cdef enum:
    mcMemcpyHostToHost     = 0     # Host-to-Host Copy
    mcMemcpyHostToDevice   = 1     # Host-to-Device Copy
    mcMemcpyDeviceToHost   = 2     # Device-to-Host Copy
    mcMemcpyDeviceToDevice = 3     # Device-to-Device Copy
    mcMemcpyDefault        = 4     # Runtime will automatically determine copy-kind based on virtual addresses.

cdef extern from *:
    ctypedef int Error 'mcError_t'
    ctypedef int DeviceAttr 'mcDeviceAttribute_t'
    ctypedef int MemoryKind 'mcMemcpyKind'
    ctypedef void* MCStream 'mcStream_t'
    ctypedef int MCLimit 'mcLimit_t'