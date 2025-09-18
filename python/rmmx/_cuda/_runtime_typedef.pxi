# Keep in sync with typenames exported in `runtime.pxd`.

cdef enum:
    hcMemcpyHostToHost     = 0     # Host-to-Host Copy
    hcMemcpyHostToDevice   = 1     # Host-to-Device Copy
    hcMemcpyDeviceToHost   = 2     # Device-to-Host Copy
    hcMemcpyDeviceToDevice = 3     # Device-to-Device Copy
    hcMemcpyDefault        = 4     # Runtime will automatically determine copy-kind based on virtual addresses.

cdef extern from *:
    ctypedef int Error 'hcError_t'
    ctypedef int DeviceAttr 'hcDeviceAttribute_t'
    ctypedef int MemoryKind 'hcMemcpyKind'
    ctypedef void* HCStream 'hcStream_t'
    ctypedef int HCLimit 'hcLimit_t'