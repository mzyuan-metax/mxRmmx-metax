cdef extern from "hcr/hpcc.h":
    cdef struct HCstream_st:
        pass
ctypedef HCstream_st* hcStream_t


cdef enum _hcError_t:
    hcSuccess                             = 0
    hcErrorInvalidValue                   = 1
    hcErrorMemoryAllocation               = 2
    hcErrorInitializationError            = 3
    hcErrorDeinitialized                  = 4
    hcErrorProfilerDisabled               = 5
    hcErrorProfilerNotInitialized         = 6
    hcErrorProfilerAlreadyStarted         = 7
    hcErrorProfilerAlreadyStopped         = 8
    hcErrorInvalidConfiguration           = 9
    hcErrorInvalidPitchValue              = 12
    hcErrorInvalidSymbol                  = 13
    hcErrorInvalidHostPointer             = 16 # Invalid Host Pointer
    hcErrorInvalidDevicePointer           = 17 # Invalid Device Pointer
    hcErrorInvalidTexture                 = 18
    hcErrorInvalidTextureBinding          = 19
    hcErrorInvalidChannelDescriptor       = 20
    hcErrorInvalidMemcpyDirection         = 21
    hcErrorAddressOfConstant              = 22
    hcErrorTextureFetchFailed             = 23
    hcErrorTextureNotBound                = 24
    hcErrorSynchronizationError           = 25
    hcErrorInvalidFilterSetting           = 26
    hcErrorInvalidNormSetting             = 27
    hcErrorMixedDeviceExecution           = 28
    hcErrorNotYetImplemented              = 31
    hcErrorMemoryValueTooLarge            = 32
    hcErrorStubLibrary                    = 34
    hcErrorInsufficientDriver             = 35
    hcErrorCallRequiresNewerDriver        = 36
    hcErrorInvalidSurface                 = 37
    hcErrorDuplicateVariableName          = 43
    hcErrorDuplicateTextureName           = 44
    hcErrorDuplicateSurfaceName           = 45
    hcErrorDevicesUnavailable             = 46
    hcErrorIncompatibleDriverContext      = 49
    hcErrorMissingConfiguration           = 52
    hcErrorPriorLaunchFailure             = 53
    hcErrorLaunchMaxDepthExceeded         = 65
    hcErrorLaunchFileScopedTex            = 66
    hcErrorLaunchFileScopedSurf           = 67
    hcErrorSyncDepthExceeded              = 68
    hcErrorLaunchPendingCountExceeded     = 69
    hcErrorInvalidDeviceFunction          = 98
    hcErrorNoDevice                       = 100
    hcErrorInvalidDevice                  = 101
    hcErrorDeviceNotLicensed              = 102
    hcErrorSoftwareValidityNotEstablished = 103
    hcErrorStartupFailure                 = 127
    hcErrorInvalidKernelImage             = 200
    hcErrorDeviceUninitialized            = 201
    hcErrorContextAlreadyCurrent          = 202
    hcErrorMapBufferObjectFailed          = 205
    hcErrorUnmapBufferObjectFailed        = 206
    hcErrorArrayIsMapped                  = 207
    hcErrorAlreadyMapped                  = 208
    hcErrorNoKernelImageForDevice         = 209
    hcErrorAlreadyAcquired                = 210
    hcErrorNotMapped                      = 211
    hcErrorNotMappedAsArray               = 212
    hcErrorNotMappedAsPointer             = 213
    hcErrorECCUncorrectable               = 214
    hcErrorUnsupportedLimit               = 215
    hcErrorDeviceAlreadyInUse             = 216
    hcErrorPeerAccessUnsupported          = 217
    hcErrorInvalidKernelFile              = 218
    hcErrorInvalidGraphicsContext         = 219
    hcErrorMxlinkUncorrectable            = 220
    hcErrorJitCompilerNotFound            = 221
    hcErrorUnsupportedKernelVersion       = 222
    hcErrorJitCompilationDisabled         = 223
    hcErrorUnsupportedExecAffinity        = 224
    hcErrorInvalidSource                  = 300
    hcErrorFileNotFound                   = 301
    hcErrorSharedObjectSymbolNotFound     = 302
    hcErrorSharedObjectInitFailed         = 303
    hcErrorOperatingSystem                = 304
    hcErrorInvalidResourceHandle          = 400
    hcErrorIllegalState                   = 401
    hcErrorSymbolNotFound                 = 500
    hcErrorNotReady                       = 600
    hcErrorIllegalAddress                 = 700
    hcErrorLaunchOutOfResources           = 701
    hcErrorLaunchTimeout                  = 702
    hcErrorLaunchIncompatibleTexturing    = 703
    hcErrorPeerAccessAlreadyEnabled       = 704
    hcErrorPeerAccessNotEnabled           = 705
    hcErrorSetOnActiveProcess             = 708
    hcErrorContextIsDestroyed             = 709
    hcErrorAssert                         = 710
    hcErrorTooManyPeers                   = 711
    hcErrorHostMemoryAlreadyRegistered    = 712
    hcErrorHostMemoryNotRegistered        = 713
    hcErrorHardwareStackError             = 714
    hcErrorIllegalInstruction             = 715
    hcErrorMisalignedAddress              = 716
    hcErrorInvalidAddressSpace            = 717
    hcErrorInvalidPc                      = 718
    hcErrorLaunchFailure                  = 719
    hcErrorCooperativeLaunchTooLarge      = 720
    hcErrorNotPermitted                   = 800
    hcErrorNotSupported                   = 801
    hcErrorSystemNotReady                 = 802
    hcErrorSystemDriverMismatch           = 803
    hcErrorCompatNotSupportedOnDevice     = 804
    hcErrorMpsConnectionFailed            = 805
    hcErrorMpsRpcFailure                  = 806
    hcErrorMpsServerNotReady              = 807
    hcErrorMpsMaxClientsReached           = 808
    hcErrorMpsMaxConnectionsReached       = 809
    hcErrorStreamCaptureUnsupported       = 900
    hcErrorStreamCaptureInvalidated       = 901
    hcErrorStreamCaptureMerge             = 902
    hcErrorStreamCaptureUnmatched         = 903
    hcErrorStreamCaptureUnjoined          = 904
    hcErrorStreamCaptureIsolation         = 905
    hcErrorStreamCaptureImplicit          = 906
    hcErrorCapturedEvent                  = 907
    hcErrorStreamCaptureWrongThread       = 908
    hcErrorTimeout                        = 909
    hcErrorGraphExecUpdateFailure         = 910
    hcErrorExternalDevice                 = 911
    hcErrorGraphExecUpdateCommandDisMatch = 912
    hcErrorGraphExecUpdateNodeTypeChanged = 913
    hcErrorUnknown                        = 999
    hcErrorDuplicateLoadModule            = 1003
    hcErrorModuleNotFound                 = 1004
    hcErrorDuplicateDevice                = 1005
    hcErrorDumpBCfile                     = 1008
    hcErrorRecompile                      = 1009
    hcErrorApplyRelocation                = 1010
    hcErrorFileSaveFailed                 = 1011
    hcErrorNoBitcodeForGPU                = 1012
    hcErrorInvalidKernel                  = 2000
    hcErrorDeviceNotFound                 = 2001
    hcErrorGetDeviceImageBase             = 2002
    hcErrorApiFailureBase                 = 10000
    hcErrorDockerDriverUnload             = 10001
    hcErrorDriverWarmReset                = 10002
    hcErrorDriverMismatch                 = 10003 # User mode component is not compatible
                                                   #  with kernel Mx driver
    hcErrorInvalidParameter = 10004               # XPU identifies input parameters invalid
    hcErrorInvalidHandle    = 10005               # XPU identifies handle parameter invalid
    hcErrorInvalidUnit      = 10006 # XPU identifies node or unit parameter invalid
    hcErrorNoMemory         = 10007 # No memory available
    hcErrorBufferTooSmall   = 10008 # A buffer needed to handle a request is too small
    hcErrorNotAddNbg        = 10009 # have not add nbg file
    hcErrorNotImplemented   = 10010 # XPU function is not implemented for this set of paramters
    hcErrorUnavailable      = 10011 # XPU function is not available currently
                                     #  on this node (but may be at a later time)
    hcErrorOutOfResources = 10012   # XPU function request exceeds
                                     #  the resources currently available.
    hcErrorKernelIoChannelNotOpened = 10013 # XPU driver path not opened
    hcErrorKernelCommunication      = 10014 # user-kernel mode communication failure
    hcErrorKernelAlreadyOpened      = 10015 # XPU driver path already opened
    hcErrormacaMMUUnvailable = 10016 # ATS/PRI 1.1 (Address Translation Services) not available
                                      # (IOMMU driver not installed or not-available)
    hcErrorWaitFailure              = 10017 # The wait operation failed
    hcErrorWaitTimeout              = 10018 # The wait operation timed out
    hcErrorInternal                 = 10019 # Internal error happened
    hcErrorCommitFailure            = 10020 # Commit command failed
    hcErrorMemoryAlreadyRegistered  = 10021 # Memory buffer already registered
    hcErrorMemoryNotRegistered      = 10022 # Memory buffer not registered
    hcErrorMemoryAlignment          = 10023 # Memory parameter not aligned
    hcErrorInitialized              = 10024 # device init
    hcErrorInvalidContext           = 10025 # The context is invalid
    hcErrorContextAlreadyInUse      = 10026 # The context is already in use
    hcErrorNotFound                 = 10027 # Not found error
    hcErrorContextIsDestroy         = 10028 # The context has been destroyed
    hcErrorNeedMoreInput            = 10029 # need more data to process
    hcErrorDriverFunctionLevelReset = 10030 # Function level reset
    hcErrorBusy                     = 10031 # queue busy
    hcErrorKernelExecTimeout        = 10032 # kernel execute timeout
    hcErrorMax


cpdef enum Error_t:
    cudaSuccess = _hcError_t.hcSuccess
    cudaErrorInvalidValue = _hcError_t.hcErrorInvalidValue
    cudaErrorMemoryAllocation = _hcError_t.hcErrorMemoryAllocation
    cudaErrorInitializationError = _hcError_t.hcErrorInitializationError
    cudaErrorCudartUnloading = _hcError_t.hcErrorDeinitialized
    cudaErrorProfilerDisabled = _hcError_t.hcErrorProfilerDisabled
    cudaErrorProfilerNotInitialized = _hcError_t.hcErrorProfilerNotInitialized
    cudaErrorProfilerAlreadyStarted = _hcError_t.hcErrorProfilerAlreadyStarted
    cudaErrorProfilerAlreadyStopped = _hcError_t.hcErrorProfilerAlreadyStopped
    cudaErrorInvalidConfiguration = _hcError_t.hcErrorInvalidConfiguration
    cudaErrorInvalidPitchValue = _hcError_t.hcErrorInvalidPitchValue
    cudaErrorInvalidSymbol = _hcError_t.hcErrorInvalidSymbol
    cudaErrorInvalidHostPointer = _hcError_t.hcErrorInvalidHostPointer
    cudaErrorInvalidDevicePointer = _hcError_t.hcErrorInvalidDevicePointer
    cudaErrorInvalidTexture = _hcError_t.hcErrorInvalidTexture
    cudaErrorInvalidTextureBinding = _hcError_t.hcErrorInvalidTextureBinding
    cudaErrorInvalidChannelDescriptor = _hcError_t.hcErrorInvalidChannelDescriptor
    cudaErrorInvalidMemcpyDirection = _hcError_t.hcErrorInvalidMemcpyDirection
    cudaErrorAddressOfConstant = _hcError_t.hcErrorAddressOfConstant
    cudaErrorTextureFetchFailed = _hcError_t.hcErrorTextureFetchFailed
    cudaErrorTextureNotBound = _hcError_t.hcErrorTextureNotBound
    cudaErrorSynchronizationError = _hcError_t.hcErrorSynchronizationError
    cudaErrorInvalidFilterSetting = _hcError_t.hcErrorInvalidFilterSetting
    cudaErrorInvalidNormSetting = _hcError_t.hcErrorInvalidNormSetting
    cudaErrorMixedDeviceExecution = _hcError_t.hcErrorMixedDeviceExecution
    cudaErrorNotYetImplemented = _hcError_t.hcErrorNotYetImplemented
    cudaErrorMemoryValueTooLarge = _hcError_t.hcErrorMemoryValueTooLarge
    cudaErrorStubLibrary = _hcError_t.hcErrorStubLibrary
    cudaErrorInsufficientDriver = _hcError_t.hcErrorInsufficientDriver
    cudaErrorCallRequiresNewerDriver = _hcError_t.hcErrorCallRequiresNewerDriver
    cudaErrorInvalidSurface = _hcError_t.hcErrorInvalidSurface
    cudaErrorDuplicateVariableName = _hcError_t.hcErrorDuplicateVariableName
    cudaErrorDuplicateTextureName = _hcError_t.hcErrorDuplicateTextureName
    cudaErrorDuplicateSurfaceName = _hcError_t.hcErrorDuplicateSurfaceName
    cudaErrorDevicesUnavailable = _hcError_t.hcErrorDevicesUnavailable
    cudaErrorIncompatibleDriverContext = _hcError_t.hcErrorIncompatibleDriverContext
    cudaErrorMissingConfiguration = _hcError_t.hcErrorMissingConfiguration
    cudaErrorPriorLaunchFailure = _hcError_t.hcErrorPriorLaunchFailure
    cudaErrorLaunchMaxDepthExceeded = _hcError_t.hcErrorLaunchMaxDepthExceeded
    cudaErrorLaunchFileScopedTex = _hcError_t.hcErrorLaunchFileScopedTex
    cudaErrorLaunchFileScopedSurf = _hcError_t.hcErrorLaunchFileScopedSurf
    cudaErrorSyncDepthExceeded = _hcError_t.hcErrorSyncDepthExceeded
    cudaErrorLaunchPendingCountExceeded = _hcError_t.hcErrorLaunchPendingCountExceeded
    cudaErrorInvalidDeviceFunction = _hcError_t.hcErrorInvalidDeviceFunction
    cudaErrorNoDevice = _hcError_t.hcErrorNoDevice
    cudaErrorInvalidDevice = _hcError_t.hcErrorInvalidDevice
    cudaErrorDeviceNotLicensed = _hcError_t.hcErrorDeviceNotLicensed
    cudaErrorSoftwareValidityNotEstablished = _hcError_t.hcErrorSoftwareValidityNotEstablished
    cudaErrorStartupFailure = _hcError_t.hcErrorStartupFailure
    cudaErrorInvalidKernelImage = _hcError_t.hcErrorInvalidKernelImage
    cudaErrorDeviceUninitialized = _hcError_t.hcErrorDeviceUninitialized
    cudaErrorMapBufferObjectFailed = _hcError_t.hcErrorMapBufferObjectFailed
    cudaErrorUnmapBufferObjectFailed = _hcError_t.hcErrorUnmapBufferObjectFailed
    cudaErrorArrayIsMapped = _hcError_t.hcErrorArrayIsMapped
    cudaErrorAlreadyMapped = _hcError_t.hcErrorAlreadyMapped
    cudaErrorNoKernelImageForDevice = _hcError_t.hcErrorNoKernelImageForDevice
    cudaErrorAlreadyAcquired = _hcError_t.hcErrorAlreadyAcquired
    cudaErrorNotMapped = _hcError_t.hcErrorNotMapped
    cudaErrorNotMappedAsArray = _hcError_t.hcErrorNotMappedAsArray
    cudaErrorNotMappedAsPointer = _hcError_t.hcErrorNotMappedAsPointer
    cudaErrorECCUncorrectable = _hcError_t.hcErrorECCUncorrectable
    cudaErrorUnsupportedLimit = _hcError_t.hcErrorUnsupportedLimit
    cudaErrorDeviceAlreadyInUse = _hcError_t.hcErrorDeviceAlreadyInUse
    cudaErrorPeerAccessUnsupported = _hcError_t.hcErrorPeerAccessUnsupported
    cudaErrorInvalidPtx = _hcError_t.hcErrorInvalidKernelFile
    cudaErrorInvalidGraphicsContext = _hcError_t.hcErrorInvalidGraphicsContext
    cudaErrorNvlinkUncorrectable = _hcError_t.hcErrorMxlinkUncorrectable
    cudaErrorJitCompilerNotFound = _hcError_t.hcErrorJitCompilerNotFound
    cudaErrorUnsupportedPtxVersion = _hcError_t.hcErrorUnsupportedKernelVersion
    cudaErrorJitCompilationDisabled = _hcError_t.hcErrorJitCompilationDisabled
    cudaErrorUnsupportedExecAffinity = _hcError_t.hcErrorUnsupportedExecAffinity
    cudaErrorInvalidSource = _hcError_t.hcErrorInvalidSource
    cudaErrorFileNotFound = _hcError_t.hcErrorFileNotFound
    cudaErrorSharedObjectSymbolNotFound = _hcError_t.hcErrorSharedObjectSymbolNotFound
    cudaErrorSharedObjectInitFailed = _hcError_t.hcErrorSharedObjectInitFailed
    cudaErrorOperatingSystem = _hcError_t.hcErrorOperatingSystem
    cudaErrorInvalidResourceHandle = _hcError_t.hcErrorInvalidResourceHandle
    cudaErrorIllegalState = _hcError_t.hcErrorIllegalState
    cudaErrorSymbolNotFound = _hcError_t.hcErrorSymbolNotFound
    cudaErrorNotReady = _hcError_t.hcErrorNotReady
    cudaErrorIllegalAddress = _hcError_t.hcErrorIllegalAddress
    cudaErrorLaunchOutOfResources = _hcError_t.hcErrorLaunchOutOfResources
    cudaErrorLaunchTimeout = _hcError_t.hcErrorLaunchTimeout
    cudaErrorLaunchIncompatibleTexturing = _hcError_t.hcErrorLaunchIncompatibleTexturing
    cudaErrorPeerAccessAlreadyEnabled = _hcError_t.hcErrorPeerAccessAlreadyEnabled
    cudaErrorPeerAccessNotEnabled = _hcError_t.hcErrorPeerAccessNotEnabled
    cudaErrorSetOnActiveProcess = _hcError_t.hcErrorSetOnActiveProcess
    cudaErrorContextIsDestroyed = _hcError_t.hcErrorContextIsDestroyed
    cudaErrorAssert = _hcError_t.hcErrorAssert
    cudaErrorTooManyPeers = _hcError_t.hcErrorTooManyPeers
    cudaErrorHostMemoryAlreadyRegistered = _hcError_t.hcErrorHostMemoryAlreadyRegistered
    cudaErrorHostMemoryNotRegistered = _hcError_t.hcErrorHostMemoryNotRegistered
    cudaErrorHardwareStackError = _hcError_t.hcErrorHardwareStackError
    cudaErrorIllegalInstruction = _hcError_t.hcErrorIllegalInstruction
    cudaErrorMisalignedAddress = _hcError_t.hcErrorMisalignedAddress
    cudaErrorInvalidAddressSpace = _hcError_t.hcErrorInvalidAddressSpace
    cudaErrorInvalidPc = _hcError_t.hcErrorInvalidPc
    cudaErrorLaunchFailure = _hcError_t.hcErrorLaunchFailure
    cudaErrorCooperativeLaunchTooLarge = _hcError_t.hcErrorCooperativeLaunchTooLarge
    cudaErrorNotPermitted = _hcError_t.hcErrorNotPermitted
    cudaErrorNotSupported = _hcError_t.hcErrorNotSupported
    cudaErrorSystemNotReady = _hcError_t.hcErrorSystemNotReady
    cudaErrorSystemDriverMismatch = _hcError_t.hcErrorSystemDriverMismatch
    cudaErrorCompatNotSupportedOnDevice = _hcError_t.hcErrorCompatNotSupportedOnDevice
    cudaErrorMpsConnectionFailed = _hcError_t.hcErrorMpsConnectionFailed
    cudaErrorMpsRpcFailure = _hcError_t.hcErrorMpsRpcFailure
    cudaErrorMpsServerNotReady = _hcError_t.hcErrorMpsServerNotReady
    cudaErrorMpsMaxClientsReached = _hcError_t.hcErrorMpsMaxClientsReached
    cudaErrorMpsMaxConnectionsReached = _hcError_t.hcErrorMpsMaxConnectionsReached
    cudaErrorStreamCaptureUnsupported = _hcError_t.hcErrorStreamCaptureUnsupported
    cudaErrorStreamCaptureInvalidated = _hcError_t.hcErrorStreamCaptureInvalidated
    cudaErrorStreamCaptureMerge = _hcError_t.hcErrorStreamCaptureMerge
    cudaErrorStreamCaptureUnmatched = _hcError_t.hcErrorStreamCaptureUnmatched
    cudaErrorStreamCaptureUnjoined = _hcError_t.hcErrorStreamCaptureUnjoined
    cudaErrorStreamCaptureIsolation = _hcError_t.hcErrorStreamCaptureIsolation
    cudaErrorStreamCaptureImplicit = _hcError_t.hcErrorStreamCaptureImplicit
    cudaErrorCapturedEvent = _hcError_t.hcErrorCapturedEvent
    cudaErrorStreahcaptureWrongThread = _hcError_t.hcErrorStreamCaptureWrongThread
    cudaErrorTimeout = _hcError_t.hcErrorTimeout
    cudaErrorGraphExecUpdateFailure = _hcError_t.hcErrorGraphExecUpdateFailure
    cudaErrorExternalDevice = _hcError_t.hcErrorExternalDevice
    cudaErrorUnknown = _hcError_t.hcErrorUnknown
    cudaErrorApiFailureBase = _hcError_t.hcErrorApiFailureBase


cdef enum hcDeviceAttribute_t:
    hcDeviceAttributeMaxThreadsPerBlock      #/< Maximum number of threads per block.
    hcDeviceAttributeMaxBlockDimX            #/< Maximum x-dimension of a block.
    hcDeviceAttributeMaxBlockDimY            #/< Maximum y-dimension of a block.
    hcDeviceAttributeMaxBlockDimZ            #/< Maximum z-dimension of a block.
    hcDeviceAttributeMaxGridDimX             #/< Maximum x-dimension of a grid.
    hcDeviceAttributeMaxGridDimY             #/< Maximum y-dimension of a grid.
    hcDeviceAttributeMaxGridDimZ             #/< Maximum z-dimension of a grid.
    hcDeviceAttributeMaxSharedMemoryPerBlock #/< Maximum shared memory available per block in
                                            #/< bytes.
    hcDeviceAttributeTotalConstantMemory     #/< Constant memory size in bytes.
    hcDeviceAttributeWarpSize                #/< Warp size in threads. Deprecated soon use
                                            #/< hcDeviceAttributeWaveSize instead.
    hcDeviceAttributeWaveSize                #/< Wave size in threads.
    hcDeviceAttributeMaxRegistersPerBlock    #/< Maximum number of 32-bit registers available to a
                                            #/< thread block. This number is shared by all thread
                                            #/< blocks simultaneously resident on a
                                            #/< multiprocessor.
    hcDeviceAttributeMaxRegistersPerMultiprocessor #/< Maximum number of 32-bit registers
                                                    #/< available to a multiprocessor
    hcDeviceAttributeClockRate                     #/< Peak clock frequency in kilohertz.
    hcDeviceAttributeMemoryClockRate               #/< Peak memory clock frequency in kilohertz.
    hcDeviceAttributeMemoryBusWidth                #/< Global memory bus width in bits.
    hcDeviceAttributeMultiProcessorCount           #/< Number of multiprocessors on the device.
    hcDeviceAttributeComputeMode                   #/< Compute mode that device is currently in.
    hcDeviceAttributeL2CacheSize #/< Size of L2 cache in bytes. 0 if the device doesn't have L2
                                #/< cache.
    hcDeviceAttributeMaxThreadsPerMultiProcessor #/< Maximum resident threads per
                                                #/< multiprocessor.
    hcDevAttrMaxBlocksPerMultiprocessor          #/< Maximum number of blocks per multiprocessor
    hcDeviceAttributeComputeCapabilityMajor      #/< Major compute capability version number.
    hcDeviceAttributeComputeCapabilityMinor      #/< Minor compute capability version number.
    hcDeviceAttributeConcurrentKernels           #/< Device can possibly execute multiple kernels
                                                #/< concurrently.
    hcDeviceAttributePciBusId                    #/< PCI Bus ID.
    hcDeviceAttributePciDeviceId                 #/< PCI Device ID.
    hcDeviceAttributeMaxSharedMemoryPerMultiprocessor #/< Maximum Shared Memory Per
                                                    #/< Multiprocessor.
    hcDeviceAttributeIsMultiGpuBoard                  #/< Multiple GPU devices.
    hcDeviceAttributeIntegrated                       #/< iGPU
    hcDeviceAttributeCooperativeLaunch                #/< Support cooperative launch
    hcDeviceAttributeCooperativeMultiDeviceLaunch     #/< Support cooperative launch on multiple
                                                    #/< devices
    hcDeviceAttributeMaxTexture1DWidth                #/< Maximum number of elements in 1D images
    hcDeviceAttributeMaxTexture2DWidth  #/< Maximum dimension width of 2D images in image elements
    hcDeviceAttributeMaxTexture2DHeight #/< Maximum dimension height of 2D images in image
                                        #/< elements
    hcDeviceAttributeMaxTexture3DWidth  #/< Maximum dimension width of 3D images in image elements
    hcDeviceAttributeMaxTexture3DHeight #/< Maximum dimensions height of 3D images in image
                                        #/< elements
    hcDeviceAttributeMaxTexture3DDepth  #/< Maximum dimensions depth of 3D images in image
                                        #/< elements

    hcDeviceAttributeHdpMemFlushCntl #/< Address of the HDP_MEM_COHERENCY_FLUSH_CNTL register
    hcDeviceAttributeHdpRegFlushCntl #/< Address of the HDP_REG_COHERENCY_FLUSH_CNTL register

    hcDeviceAttributeMaxPitch              #/< Maximum pitch in bytes allowed by memory copies
    hcDeviceAttributeTextureAlignment      #/< Alignment requirement for textures
    hcDeviceAttributeTexturePitchAlignment #/< Pitch alignment requirement for 2D texture
                                            #/< references bound to pitched memory;
    hcDeviceAttributeKernelExecTimeout     #/< Run time limit for kernels executed on the device
    hcDeviceAttributeCanMapHostMemory #/< Device can map host memory into device address space
    hcDeviceAttributeEccEnabled       #/< Device has ECC support enabled

    hcDeviceAttributeCooperativeMultiDeviceUnmatchedFunc      #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched functions
    hcDeviceAttributeCooperativeMultiDeviceUnmatchedGridDim   #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched grid
                                                            #/ dimensions
    hcDeviceAttributeCooperativeMultiDeviceUnmatchedBlockDim  #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched block
                                                            #/ dimensions
    hcDeviceAttributeCooperativeMultiDeviceUnmatchedSharedMem #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched shared
                                                            #/ memories
    hcDeviceAttributeAsicRevision  #/< Revision of the GPU in this device
    hcDeviceAttributeManagedMemory #/< Device supports allocating managed memory on this system
    hcDeviceAttributeDirectManagedMemAccessFromHost #/< Host can directly access managed memory
                                                    #/< on
                                                    #/ the device without migration
    hcDeviceAttributeConcurrentManagedAccess #/< Device can coherently access managed memory
                                            #/ concurrently with the CPU
    hcDeviceAttributePageableMemoryAccess    #/< Device supports coherently accessing pageable
                                            #/< memory
                                            #/ without calling hcHostRegister on it
    hcDeviceAttributePageableMemoryAccessUsesHostPageTables #/< Device accesses pageable memory
                                                            #/< via
                                                            #/ the host's page tables
    hcDeviceAttributeVirtualMemoryManagementSupported       #/< Device supports virtual memory
                                                            #/< management APIs
    hcDeviceAttributeHandleTypePosixFileDescriptorSupported #/< Device supports exporting memory
                                                            #/< to a posix file descriptor with
                                                            #/< hcMemExportToShareableHandle, if
                                                            #/< requested via hcMehcreate
    hcDeviceAttributeHandleTypeWin32HandleSupported #/< Device supports exporting memory to a
                                                    #/< Win32 NT handle with
                                                    #/< ::hcMemExportToShareableHandle, if
                                                    #/< requested via hcMehcreate
    hcDeviceAttributeGenericCompressionSupported    #/< Device supports compressible memory
                                                    #/< allocation via hcMehcreate
    hcDeviceAttributeCanUseStreamWaitValue #/< '1' if Device supports hcStreamWaitValue32() and
                                            #/< hcStreamWaitValue64()  '0' otherwise.
    hcDeviceAttributeCanUseStreamMemOps
    hcDeviceAttributeCanUseStreamWaitWaitValueNor
    hcDeviceAttributeCanFlushRemoteWrites
    hcDeviceAttributeMemoryPoolsSupported
    hcDeviceAttributeUnifiedAddressing #< Device shares a unified address space with the host
    hcDeviceAttributeMaxAccessPolicyWindowSize #/< The max value of hcAccessPolicyWindow bytes.
    hcDeviceAttributeMaxPersistingL2CacheSize  #/< Device's maximum l2 persisting setting bytes.
    hcDeviceAttributeGpuOverlap       #< Device can possibly copy memory and execute a kernel
                                    # concurrently. Deprecated. Use instead
                                    # CU_DEVICE_ATTRIBUTE_ASYNC_ENGINE_COUNT.
    hcDeviceAttributeAsyncEngineCount #< Number of asynchronous engines.
    hcDeviceAttributeMemoryPoolSupportedHandleTypes #< Bitmask of handle types supported with
                                                    # mempool based IPC
    hcDeviceAttributeTexture1DLinearWidth           #< Maximum 1D linear texture width
    hcDeviceAttributeTexture2DLinearWidth           #< Maximum 2D linear texture width
    hcDeviceAttributeTexture2DLinearHeight          #< Maximum 2D linear texture height
    hcDeviceAttributeTexture2DLinearPitch           #< Maximum 2D linear texture pitch in bytes
    hcDeviceAttributeHostNativeAtomicSupported
    hcDeviceAttributeMaxTexture1DLayeredWidth       #< Maximum 1D layered texture width
    hcDeviceAttributeMaxTexture1DLayeredLayers      #< Maximum layers in a 1D layered texture
    hcDeviceAttributeMaxTexture2DLayeredWidth       #< Maximum 2D layered texture width
    hcDeviceAttributeMaxTexture2DLayeredHeight      #< Maximum 1D layered texture height
    hcDeviceAttributeMaxTexture2DLayeredLayers      #< Maximum layers in a 2D layered texture
    hcDeviceAttributeSurfaceAligement
    hcDeviceAttributeComputePreemptionSupported
    hcDeviceAttributePciDomainId #/< PCI Domain ID.
    hcDeviceAttributeTccDriver
    hcDeviceAttributeUnknow
    hcDeviceAttributeMax


# class cudaDeviceAttr(Enum):
cpdef enum cudaDeviceAttr:
    cudaDevAttrMaxThreadsPerBlock = hcDeviceAttribute_t.hcDeviceAttributeMaxThreadsPerBlock
    cudaDevAttrMaxBlockDimX = hcDeviceAttribute_t.hcDeviceAttributeMaxBlockDimX
    cudaDevAttrMaxBlockDimY = hcDeviceAttribute_t.hcDeviceAttributeMaxBlockDimY
    cudaDevAttrMaxBlockDimZ = hcDeviceAttribute_t.hcDeviceAttributeMaxBlockDimZ
    cudaDevAttrMaxGridDimX = hcDeviceAttribute_t.hcDeviceAttributeMaxGridDimX
    cudaDevAttrMaxGridDimY = hcDeviceAttribute_t.hcDeviceAttributeMaxGridDimY
    cudaDevAttrMaxGridDimZ = hcDeviceAttribute_t.hcDeviceAttributeMaxGridDimZ
    cudaDevAttrMaxSharedMemoryPerBlock = hcDeviceAttribute_t.hcDeviceAttributeMaxSharedMemoryPerBlock
    cudaDevAttrTotalConstantMemory = hcDeviceAttribute_t.hcDeviceAttributeTotalConstantMemory
    cudaDevAttrWarpSize = hcDeviceAttribute_t.hcDeviceAttributeWarpSize
    cudaDevAttrMaxPitch = hcDeviceAttribute_t.hcDeviceAttributeMaxPitch
    cudaDevAttrMaxRegistersPerBlock = hcDeviceAttribute_t.hcDeviceAttributeMaxRegistersPerBlock
    cudaDevAttrClockRate = hcDeviceAttribute_t.hcDeviceAttributeClockRate
    cudaDevAttrTextureAlignment = hcDeviceAttribute_t.hcDeviceAttributeTextureAlignment
    cudaDevAttrGpuOverlap = hcDeviceAttribute_t.hcDeviceAttributeGpuOverlap
    cudaDevAttrMultiProcessorCount = hcDeviceAttribute_t.hcDeviceAttributeMultiProcessorCount
    cudaDevAttrKernelExecTimeout = hcDeviceAttribute_t.hcDeviceAttributeKernelExecTimeout
    cudaDevAttrIntegrated = hcDeviceAttribute_t.hcDeviceAttributeIntegrated
    cudaDevAttrCanMapHostMemory = hcDeviceAttribute_t.hcDeviceAttributeCanMapHostMemory
    cudaDevAttrComputeMode = hcDeviceAttribute_t.hcDeviceAttributeComputeMode
    cudaDevAttrMaxTexture1DWidth = hcDeviceAttribute_t.hcDeviceAttributeMaxTexture1DWidth
    cudaDevAttrMaxTexture2DWidth = hcDeviceAttribute_t.hcDeviceAttributeMaxTexture2DWidth
    cudaDevAttrMaxTexture2DHeight = hcDeviceAttribute_t.hcDeviceAttributeMaxTexture2DHeight
    cudaDevAttrMaxTexture3DWidth = hcDeviceAttribute_t.hcDeviceAttributeMaxTexture3DWidth
    cudaDevAttrMaxTexture3DHeight = hcDeviceAttribute_t.hcDeviceAttributeMaxTexture3DHeight
    cudaDevAttrMaxTexture3DDepth = hcDeviceAttribute_t.hcDeviceAttributeMaxTexture3DDepth
    cudaDevAttrMaxTexture2DLayeredWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLayeredHeight = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLayeredLayers = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrSurfaceAlignment = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrConcurrentKernels = hcDeviceAttribute_t.hcDeviceAttributeConcurrentKernels
    cudaDevAttrEccEnabled = hcDeviceAttribute_t.hcDeviceAttributeEccEnabled
    cudaDevAttrPciBusId = hcDeviceAttribute_t.hcDeviceAttributePciBusId
    cudaDevAttrPciDeviceId = hcDeviceAttribute_t.hcDeviceAttributePciDeviceId
    cudaDevAttrTccDriver = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMemoryClockRate = hcDeviceAttribute_t.hcDeviceAttributeMemoryClockRate
    cudaDevAttrGlobalMemoryBusWidth = hcDeviceAttribute_t.hcDeviceAttributeMemoryBusWidth
    cudaDevAttrL2CacheSize = hcDeviceAttribute_t.hcDeviceAttributeL2CacheSize
    cudaDevAttrMaxThreadsPerMultiProcessor = hcDeviceAttribute_t.hcDeviceAttributeMaxThreadsPerMultiProcessor
    cudaDevAttrAsyncEngineCount = hcDeviceAttribute_t.hcDeviceAttributeAsyncEngineCount
    cudaDevAttrUnifiedAddressing = hcDeviceAttribute_t.hcDeviceAttributeUnifiedAddressing
    cudaDevAttrMaxTexture1DLayeredWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture1DLayeredLayers = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DGatherWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DGatherHeight = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture3DWidthAlt = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture3DHeightAlt = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture3DDepthAlt = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrPciDomainId = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrTexturePitchAlignment = hcDeviceAttribute_t.hcDeviceAttributeTexturePitchAlignment
    cudaDevAttrMaxTextureCubemapWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTextureCubemapLayeredWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTextureCubemapLayeredLayers = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface1DWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DHeight = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface3DWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface3DHeight = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface3DDepth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface1DLayeredWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface1DLayeredLayers = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DLayeredWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DLayeredHeight = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DLayeredLayers = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurfaceCubemapWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurfaceCubemapLayeredWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSurfaceCubemapLayeredLayers = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture1DLinearWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLinearWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLinearHeight = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLinearPitch = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DMipmappedWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DMipmappedHeight = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrComputeCapabilityMajor = hcDeviceAttribute_t.hcDeviceAttributeComputeCapabilityMajor
    cudaDevAttrComputeCapabilityMinor = hcDeviceAttribute_t.hcDeviceAttributeComputeCapabilityMinor
    cudaDevAttrMaxTexture1DMipmappedWidth = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrStreamPrioritiesSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrGlobalL1CacheSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrLocalL1CacheSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxSharedMemoryPerMultiprocessor = hcDeviceAttribute_t.hcDeviceAttributeMaxSharedMemoryPerMultiprocessor
    cudaDevAttrMaxRegistersPerMultiprocessor = hcDeviceAttribute_t.hcDeviceAttributeMaxRegistersPerMultiprocessor
    cudaDevAttrManagedMemory = hcDeviceAttribute_t.hcDeviceAttributeManagedMemory
    cudaDevAttrIsMultiGpuBoard = hcDeviceAttribute_t.hcDeviceAttributeIsMultiGpuBoard
    cudaDevAttrMultiGpuBoardGroupID = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrHostNativeAtomicSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrSingleToDoublePrecisionPerfRatio = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrPageableMemoryAccess = hcDeviceAttribute_t.hcDeviceAttributePageableMemoryAccess
    cudaDevAttrConcurrentManagedAccess = hcDeviceAttribute_t.hcDeviceAttributeConcurrentManagedAccess
    cudaDevAttrComputePreemptionSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrCanUseHostPointerForRegisteredMem = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrReserved92 = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrReserved93 = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrReserved94 = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrCooperativeLaunch = hcDeviceAttribute_t.hcDeviceAttributeCooperativeLaunch
    cudaDevAttrCooperativeMultiDeviceLaunch = hcDeviceAttribute_t.hcDeviceAttributeCooperativeMultiDeviceLaunch
    cudaDevAttrMaxSharedMemoryPerBlockOptin = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrCanFlushRemoteWrites = hcDeviceAttribute_t.hcDeviceAttributeCanFlushRemoteWrites
    cudaDevAttrHostRegisterSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrPageableMemoryAccessUsesHostPageTables = hcDeviceAttribute_t.hcDeviceAttributePageableMemoryAccessUsesHostPageTables
    cudaDevAttrDirectManagedMemAccessFromHost = hcDeviceAttribute_t.hcDeviceAttributeDirectManagedMemAccessFromHost
    cudaDevAttrMaxBlocksPerMultiprocessor = hcDeviceAttribute_t.hcDevAttrMaxBlocksPerMultiprocessor
    cudaDevAttrMaxPersistingL2CacheSize = hcDeviceAttribute_t.hcDeviceAttributeMaxPersistingL2CacheSize
    cudaDevAttrMaxAccessPolicyWindowSize = hcDeviceAttribute_t.hcDeviceAttributeMaxAccessPolicyWindowSize
    cudaDevAttrReservedSharedMemoryPerBlock = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrSparseCudaArraySupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrHostRegisterReadOnlySupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrTimelineSemaphoreInteropSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMaxTimelineSemaphoreInteropSupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMemoryPoolsSupported = hcDeviceAttribute_t.hcDeviceAttributeMemoryPoolsSupported
    cudaDevAttrGPUDirectRDMASupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrGPUDirectRDMAFlushWritesOptions = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrGPUDirectRDMAWritesOrdering = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMemoryPoolSupportedHandleTypes = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrDeferredMappingCudaArraySupported = hcDeviceAttribute_t.hcDeviceAttributeUnknow
    cudaDevAttrMax = hcDeviceAttribute_t.hcDeviceAttributeMax



cdef enum hcLimit_t:
    hcLimitStackSize      # stack size in bytes of each GPU thread;
    hcLimitPrintfFifoSize # size in bytes of the shared FIFO used by the printf() device system
                           # call.
    hcLimitMallocHeapSize # size in bytes of the heap used by the malloc() and free() device
                           # system calls;
    hcLimitDevRuntimeSyncDepth # maximum grid depth at which a thread can isssue the device
                                # runtime call hcDeviceSynchronize() to wait on child grid
                                # launches to complete.
    hcLimitDevRuntimePendingLaunchCount # maximum number of outstanding device runtime launches.
    hcLimitMaxL2FetchGranularity        # L2 cache fetch granularity.
    hcLimitPersistingL2CacheSize        # Persisting L2 cache size in bytes
    hcLimitMax


cpdef enum cudaLimit:
    cudaLimitMallocHeapSize = hcLimit_t.hcLimitMallocHeapSize