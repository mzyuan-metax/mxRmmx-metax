cdef extern from "mcr/maca.h":
    cdef struct MCstream_st:
        pass
ctypedef MCstream_st* mcStream_t


cdef enum _mcError_t:
    mcSuccess                             = 0
    mcErrorInvalidValue                   = 1
    mcErrorMemoryAllocation               = 2
    mcErrorInitializationError            = 3
    mcErrorDeinitialized                  = 4
    mcErrorProfilerDisabled               = 5
    mcErrorProfilerNotInitialized         = 6
    mcErrorProfilerAlreadyStarted         = 7
    mcErrorProfilerAlreadyStopped         = 8
    mcErrorInvalidConfiguration           = 9
    mcErrorInvalidPitchValue              = 12
    mcErrorInvalidSymbol                  = 13
    mcErrorInvalidHostPointer             = 16 # Invalid Host Pointer
    mcErrorInvalidDevicePointer           = 17 # Invalid Device Pointer
    mcErrorInvalidTexture                 = 18
    mcErrorInvalidTextureBinding          = 19
    mcErrorInvalidChannelDescriptor       = 20
    mcErrorInvalidMemcpyDirection         = 21
    mcErrorAddressOfConstant              = 22
    mcErrorTextureFetchFailed             = 23
    mcErrorTextureNotBound                = 24
    mcErrorSynchronizationError           = 25
    mcErrorInvalidFilterSetting           = 26
    mcErrorInvalidNormSetting             = 27
    mcErrorMixedDeviceExecution           = 28
    mcErrorNotYetImplemented              = 31
    mcErrorMemoryValueTooLarge            = 32
    mcErrorStubLibrary                    = 34
    mcErrorInsufficientDriver             = 35
    mcErrorCallRequiresNewerDriver        = 36
    mcErrorInvalidSurface                 = 37
    mcErrorDuplicateVariableName          = 43
    mcErrorDuplicateTextureName           = 44
    mcErrorDuplicateSurfaceName           = 45
    mcErrorDevicesUnavailable             = 46
    mcErrorIncompatibleDriverContext      = 49
    mcErrorMissingConfiguration           = 52
    mcErrorPriorLaunchFailure             = 53
    mcErrorLaunchMaxDepthExceeded         = 65
    mcErrorLaunchFileScopedTex            = 66
    mcErrorLaunchFileScopedSurf           = 67
    mcErrorSyncDepthExceeded              = 68
    mcErrorLaunchPendingCountExceeded     = 69
    mcErrorInvalidDeviceFunction          = 98
    mcErrorNoDevice                       = 100
    mcErrorInvalidDevice                  = 101
    mcErrorDeviceNotLicensed              = 102
    mcErrorSoftwareValidityNotEstablished = 103
    mcErrorStartupFailure                 = 127
    mcErrorInvalidKernelImage             = 200
    mcErrorDeviceUninitialized            = 201
    mcErrorContextAlreadyCurrent          = 202
    mcErrorMapBufferObjectFailed          = 205
    mcErrorUnmapBufferObjectFailed        = 206
    mcErrorArrayIsMapped                  = 207
    mcErrorAlreadyMapped                  = 208
    mcErrorNoKernelImageForDevice         = 209
    mcErrorAlreadyAcquired                = 210
    mcErrorNotMapped                      = 211
    mcErrorNotMappedAsArray               = 212
    mcErrorNotMappedAsPointer             = 213
    mcErrorECCUncorrectable               = 214
    mcErrorUnsupportedLimit               = 215
    mcErrorDeviceAlreadyInUse             = 216
    mcErrorPeerAccessUnsupported          = 217
    mcErrorInvalidKernelFile              = 218
    mcErrorInvalidGraphicsContext         = 219
    mcErrorMxlinkUncorrectable            = 220
    mcErrorJitCompilerNotFound            = 221
    mcErrorUnsupportedKernelVersion       = 222
    mcErrorJitCompilationDisabled         = 223
    mcErrorUnsupportedExecAffinity        = 224
    mcErrorInvalidSource                  = 300
    mcErrorFileNotFound                   = 301
    mcErrorSharedObjectSymbolNotFound     = 302
    mcErrorSharedObjectInitFailed         = 303
    mcErrorOperatingSystem                = 304
    mcErrorInvalidResourceHandle          = 400
    mcErrorIllegalState                   = 401
    mcErrorSymbolNotFound                 = 500
    mcErrorNotReady                       = 600
    mcErrorIllegalAddress                 = 700
    mcErrorLaunchOutOfResources           = 701
    mcErrorLaunchTimeout                  = 702
    mcErrorLaunchIncompatibleTexturing    = 703
    mcErrorPeerAccessAlreadyEnabled       = 704
    mcErrorPeerAccessNotEnabled           = 705
    mcErrorSetOnActiveProcess             = 708
    mcErrorContextIsDestroyed             = 709
    mcErrorAssert                         = 710
    mcErrorTooManyPeers                   = 711
    mcErrorHostMemoryAlreadyRegistered    = 712
    mcErrorHostMemoryNotRegistered        = 713
    mcErrorHardwareStackError             = 714
    mcErrorIllegalInstruction             = 715
    mcErrorMisalignedAddress              = 716
    mcErrorInvalidAddressSpace            = 717
    mcErrorInvalidPc                      = 718
    mcErrorLaunchFailure                  = 719
    mcErrorCooperativeLaunchTooLarge      = 720
    mcErrorNotPermitted                   = 800
    mcErrorNotSupported                   = 801
    mcErrorSystemNotReady                 = 802
    mcErrorSystemDriverMismatch           = 803
    mcErrorCompatNotSupportedOnDevice     = 804
    mcErrorMpsConnectionFailed            = 805
    mcErrorMpsRpcFailure                  = 806
    mcErrorMpsServerNotReady              = 807
    mcErrorMpsMaxClientsReached           = 808
    mcErrorMpsMaxConnectionsReached       = 809
    mcErrorStreamCaptureUnsupported       = 900
    mcErrorStreamCaptureInvalidated       = 901
    mcErrorStreamCaptureMerge             = 902
    mcErrorStreamCaptureUnmatched         = 903
    mcErrorStreamCaptureUnjoined          = 904
    mcErrorStreamCaptureIsolation         = 905
    mcErrorStreamCaptureImplicit          = 906
    mcErrorCapturedEvent                  = 907
    mcErrorStreamCaptureWrongThread       = 908
    mcErrorTimeout                        = 909
    mcErrorGraphExecUpdateFailure         = 910
    mcErrorExternalDevice                 = 911
    mcErrorGraphExecUpdateCommandDisMatch = 912
    mcErrorGraphExecUpdateNodeTypeChanged = 913
    mcErrorUnknown                        = 999
    mcErrorDuplicateLoadModule            = 1003
    mcErrorModuleNotFound                 = 1004
    mcErrorDuplicateDevice                = 1005
    mcErrorDumpBCfile                     = 1008
    mcErrorRecompile                      = 1009
    mcErrorApplyRelocation                = 1010
    mcErrorFileSaveFailed                 = 1011
    mcErrorNoBitcodeForGPU                = 1012
    mcErrorInvalidKernel                  = 2000
    mcErrorDeviceNotFound                 = 2001
    mcErrorGetDeviceImageBase             = 2002
    mcErrorApiFailureBase                 = 10000
    mcErrorDockerDriverUnload             = 10001
    mcErrorDriverWarmReset                = 10002
    mcErrorDriverMismatch                 = 10003 # User mode component is not compatible
                                                   #  with kernel Mx driver
    mcErrorInvalidParameter = 10004               # XPU identifies input parameters invalid
    mcErrorInvalidHandle    = 10005               # XPU identifies handle parameter invalid
    mcErrorInvalidUnit      = 10006 # XPU identifies node or unit parameter invalid
    mcErrorNoMemory         = 10007 # No memory available
    mcErrorBufferTooSmall   = 10008 # A buffer needed to handle a request is too small
    mcErrorNotAddNbg        = 10009 # have not add nbg file
    mcErrorNotImplemented   = 10010 # XPU function is not implemented for this set of paramters
    mcErrorUnavailable      = 10011 # XPU function is not available currently
                                     #  on this node (but may be at a later time)
    mcErrorOutOfResources = 10012   # XPU function request exceeds
                                     #  the resources currently available.
    mcErrorKernelIoChannelNotOpened = 10013 # XPU driver path not opened
    mcErrorKernelCommunication      = 10014 # user-kernel mode communication failure
    mcErrorKernelAlreadyOpened      = 10015 # XPU driver path already opened
    mcErrormacaMMUUnvailable = 10016 # ATS/PRI 1.1 (Address Translation Services) not available
                                      # (IOMMU driver not installed or not-available)
    mcErrorWaitFailure              = 10017 # The wait operation failed
    mcErrorWaitTimeout              = 10018 # The wait operation timed out
    mcErrorInternal                 = 10019 # Internal error happened
    mcErrorCommitFailure            = 10020 # Commit command failed
    mcErrorMemoryAlreadyRegistered  = 10021 # Memory buffer already registered
    mcErrorMemoryNotRegistered      = 10022 # Memory buffer not registered
    mcErrorMemoryAlignment          = 10023 # Memory parameter not aligned
    mcErrorInitialized              = 10024 # device init
    mcErrorInvalidContext           = 10025 # The context is invalid
    mcErrorContextAlreadyInUse      = 10026 # The context is already in use
    mcErrorNotFound                 = 10027 # Not found error
    mcErrorContextIsDestroy         = 10028 # The context has been destroyed
    mcErrorNeedMoreInput            = 10029 # need more data to process
    mcErrorDriverFunctionLevelReset = 10030 # Function level reset
    mcErrorBusy                     = 10031 # queue busy
    mcErrorKernelExecTimeout        = 10032 # kernel execute timeout
    mcErrorMax


cpdef enum Error_t:
    cudaSuccess = _mcError_t.mcSuccess
    cudaErrorInvalidValue = _mcError_t.mcErrorInvalidValue
    cudaErrorMemoryAllocation = _mcError_t.mcErrorMemoryAllocation
    cudaErrorInitializationError = _mcError_t.mcErrorInitializationError
    cudaErrorCudartUnloading = _mcError_t.mcErrorDeinitialized
    cudaErrorProfilerDisabled = _mcError_t.mcErrorProfilerDisabled
    cudaErrorProfilerNotInitialized = _mcError_t.mcErrorProfilerNotInitialized
    cudaErrorProfilerAlreadyStarted = _mcError_t.mcErrorProfilerAlreadyStarted
    cudaErrorProfilerAlreadyStopped = _mcError_t.mcErrorProfilerAlreadyStopped
    cudaErrorInvalidConfiguration = _mcError_t.mcErrorInvalidConfiguration
    cudaErrorInvalidPitchValue = _mcError_t.mcErrorInvalidPitchValue
    cudaErrorInvalidSymbol = _mcError_t.mcErrorInvalidSymbol
    cudaErrorInvalidHostPointer = _mcError_t.mcErrorInvalidHostPointer
    cudaErrorInvalidDevicePointer = _mcError_t.mcErrorInvalidDevicePointer
    cudaErrorInvalidTexture = _mcError_t.mcErrorInvalidTexture
    cudaErrorInvalidTextureBinding = _mcError_t.mcErrorInvalidTextureBinding
    cudaErrorInvalidChannelDescriptor = _mcError_t.mcErrorInvalidChannelDescriptor
    cudaErrorInvalidMemcpyDirection = _mcError_t.mcErrorInvalidMemcpyDirection
    cudaErrorAddressOfConstant = _mcError_t.mcErrorAddressOfConstant
    cudaErrorTextureFetchFailed = _mcError_t.mcErrorTextureFetchFailed
    cudaErrorTextureNotBound = _mcError_t.mcErrorTextureNotBound
    cudaErrorSynchronizationError = _mcError_t.mcErrorSynchronizationError
    cudaErrorInvalidFilterSetting = _mcError_t.mcErrorInvalidFilterSetting
    cudaErrorInvalidNormSetting = _mcError_t.mcErrorInvalidNormSetting
    cudaErrorMixedDeviceExecution = _mcError_t.mcErrorMixedDeviceExecution
    cudaErrorNotYetImplemented = _mcError_t.mcErrorNotYetImplemented
    cudaErrorMemoryValueTooLarge = _mcError_t.mcErrorMemoryValueTooLarge
    cudaErrorStubLibrary = _mcError_t.mcErrorStubLibrary
    cudaErrorInsufficientDriver = _mcError_t.mcErrorInsufficientDriver
    cudaErrorCallRequiresNewerDriver = _mcError_t.mcErrorCallRequiresNewerDriver
    cudaErrorInvalidSurface = _mcError_t.mcErrorInvalidSurface
    cudaErrorDuplicateVariableName = _mcError_t.mcErrorDuplicateVariableName
    cudaErrorDuplicateTextureName = _mcError_t.mcErrorDuplicateTextureName
    cudaErrorDuplicateSurfaceName = _mcError_t.mcErrorDuplicateSurfaceName
    cudaErrorDevicesUnavailable = _mcError_t.mcErrorDevicesUnavailable
    cudaErrorIncompatibleDriverContext = _mcError_t.mcErrorIncompatibleDriverContext
    cudaErrorMissingConfiguration = _mcError_t.mcErrorMissingConfiguration
    cudaErrorPriorLaunchFailure = _mcError_t.mcErrorPriorLaunchFailure
    cudaErrorLaunchMaxDepthExceeded = _mcError_t.mcErrorLaunchMaxDepthExceeded
    cudaErrorLaunchFileScopedTex = _mcError_t.mcErrorLaunchFileScopedTex
    cudaErrorLaunchFileScopedSurf = _mcError_t.mcErrorLaunchFileScopedSurf
    cudaErrorSyncDepthExceeded = _mcError_t.mcErrorSyncDepthExceeded
    cudaErrorLaunchPendingCountExceeded = _mcError_t.mcErrorLaunchPendingCountExceeded
    cudaErrorInvalidDeviceFunction = _mcError_t.mcErrorInvalidDeviceFunction
    cudaErrorNoDevice = _mcError_t.mcErrorNoDevice
    cudaErrorInvalidDevice = _mcError_t.mcErrorInvalidDevice
    cudaErrorDeviceNotLicensed = _mcError_t.mcErrorDeviceNotLicensed
    cudaErrorSoftwareValidityNotEstablished = _mcError_t.mcErrorSoftwareValidityNotEstablished
    cudaErrorStartupFailure = _mcError_t.mcErrorStartupFailure
    cudaErrorInvalidKernelImage = _mcError_t.mcErrorInvalidKernelImage
    cudaErrorDeviceUninitialized = _mcError_t.mcErrorDeviceUninitialized
    cudaErrorMapBufferObjectFailed = _mcError_t.mcErrorMapBufferObjectFailed
    cudaErrorUnmapBufferObjectFailed = _mcError_t.mcErrorUnmapBufferObjectFailed
    cudaErrorArrayIsMapped = _mcError_t.mcErrorArrayIsMapped
    cudaErrorAlreadyMapped = _mcError_t.mcErrorAlreadyMapped
    cudaErrorNoKernelImageForDevice = _mcError_t.mcErrorNoKernelImageForDevice
    cudaErrorAlreadyAcquired = _mcError_t.mcErrorAlreadyAcquired
    cudaErrorNotMapped = _mcError_t.mcErrorNotMapped
    cudaErrorNotMappedAsArray = _mcError_t.mcErrorNotMappedAsArray
    cudaErrorNotMappedAsPointer = _mcError_t.mcErrorNotMappedAsPointer
    cudaErrorECCUncorrectable = _mcError_t.mcErrorECCUncorrectable
    cudaErrorUnsupportedLimit = _mcError_t.mcErrorUnsupportedLimit
    cudaErrorDeviceAlreadyInUse = _mcError_t.mcErrorDeviceAlreadyInUse
    cudaErrorPeerAccessUnsupported = _mcError_t.mcErrorPeerAccessUnsupported
    cudaErrorInvalidPtx = _mcError_t.mcErrorInvalidKernelFile
    cudaErrorInvalidGraphicsContext = _mcError_t.mcErrorInvalidGraphicsContext
    cudaErrorNvlinkUncorrectable = _mcError_t.mcErrorMxlinkUncorrectable
    cudaErrorJitCompilerNotFound = _mcError_t.mcErrorJitCompilerNotFound
    cudaErrorUnsupportedPtxVersion = _mcError_t.mcErrorUnsupportedKernelVersion
    cudaErrorJitCompilationDisabled = _mcError_t.mcErrorJitCompilationDisabled
    cudaErrorUnsupportedExecAffinity = _mcError_t.mcErrorUnsupportedExecAffinity
    cudaErrorInvalidSource = _mcError_t.mcErrorInvalidSource
    cudaErrorFileNotFound = _mcError_t.mcErrorFileNotFound
    cudaErrorSharedObjectSymbolNotFound = _mcError_t.mcErrorSharedObjectSymbolNotFound
    cudaErrorSharedObjectInitFailed = _mcError_t.mcErrorSharedObjectInitFailed
    cudaErrorOperatingSystem = _mcError_t.mcErrorOperatingSystem
    cudaErrorInvalidResourceHandle = _mcError_t.mcErrorInvalidResourceHandle
    cudaErrorIllegalState = _mcError_t.mcErrorIllegalState
    cudaErrorSymbolNotFound = _mcError_t.mcErrorSymbolNotFound
    cudaErrorNotReady = _mcError_t.mcErrorNotReady
    cudaErrorIllegalAddress = _mcError_t.mcErrorIllegalAddress
    cudaErrorLaunchOutOfResources = _mcError_t.mcErrorLaunchOutOfResources
    cudaErrorLaunchTimeout = _mcError_t.mcErrorLaunchTimeout
    cudaErrorLaunchIncompatibleTexturing = _mcError_t.mcErrorLaunchIncompatibleTexturing
    cudaErrorPeerAccessAlreadyEnabled = _mcError_t.mcErrorPeerAccessAlreadyEnabled
    cudaErrorPeerAccessNotEnabled = _mcError_t.mcErrorPeerAccessNotEnabled
    cudaErrorSetOnActiveProcess = _mcError_t.mcErrorSetOnActiveProcess
    cudaErrorContextIsDestroyed = _mcError_t.mcErrorContextIsDestroyed
    cudaErrorAssert = _mcError_t.mcErrorAssert
    cudaErrorTooManyPeers = _mcError_t.mcErrorTooManyPeers
    cudaErrorHostMemoryAlreadyRegistered = _mcError_t.mcErrorHostMemoryAlreadyRegistered
    cudaErrorHostMemoryNotRegistered = _mcError_t.mcErrorHostMemoryNotRegistered
    cudaErrorHardwareStackError = _mcError_t.mcErrorHardwareStackError
    cudaErrorIllegalInstruction = _mcError_t.mcErrorIllegalInstruction
    cudaErrorMisalignedAddress = _mcError_t.mcErrorMisalignedAddress
    cudaErrorInvalidAddressSpace = _mcError_t.mcErrorInvalidAddressSpace
    cudaErrorInvalidPc = _mcError_t.mcErrorInvalidPc
    cudaErrorLaunchFailure = _mcError_t.mcErrorLaunchFailure
    cudaErrorCooperativeLaunchTooLarge = _mcError_t.mcErrorCooperativeLaunchTooLarge
    cudaErrorNotPermitted = _mcError_t.mcErrorNotPermitted
    cudaErrorNotSupported = _mcError_t.mcErrorNotSupported
    cudaErrorSystemNotReady = _mcError_t.mcErrorSystemNotReady
    cudaErrorSystemDriverMismatch = _mcError_t.mcErrorSystemDriverMismatch
    cudaErrorCompatNotSupportedOnDevice = _mcError_t.mcErrorCompatNotSupportedOnDevice
    cudaErrorMpsConnectionFailed = _mcError_t.mcErrorMpsConnectionFailed
    cudaErrorMpsRpcFailure = _mcError_t.mcErrorMpsRpcFailure
    cudaErrorMpsServerNotReady = _mcError_t.mcErrorMpsServerNotReady
    cudaErrorMpsMaxClientsReached = _mcError_t.mcErrorMpsMaxClientsReached
    cudaErrorMpsMaxConnectionsReached = _mcError_t.mcErrorMpsMaxConnectionsReached
    cudaErrorStreamCaptureUnsupported = _mcError_t.mcErrorStreamCaptureUnsupported
    cudaErrorStreamCaptureInvalidated = _mcError_t.mcErrorStreamCaptureInvalidated
    cudaErrorStreamCaptureMerge = _mcError_t.mcErrorStreamCaptureMerge
    cudaErrorStreamCaptureUnmatched = _mcError_t.mcErrorStreamCaptureUnmatched
    cudaErrorStreamCaptureUnjoined = _mcError_t.mcErrorStreamCaptureUnjoined
    cudaErrorStreamCaptureIsolation = _mcError_t.mcErrorStreamCaptureIsolation
    cudaErrorStreamCaptureImplicit = _mcError_t.mcErrorStreamCaptureImplicit
    cudaErrorCapturedEvent = _mcError_t.mcErrorCapturedEvent
    cudaErrorStreamCaptureWrongThread = _mcError_t.mcErrorStreamCaptureWrongThread
    cudaErrorTimeout = _mcError_t.mcErrorTimeout
    cudaErrorGraphExecUpdateFailure = _mcError_t.mcErrorGraphExecUpdateFailure
    cudaErrorExternalDevice = _mcError_t.mcErrorExternalDevice
    cudaErrorUnknown = _mcError_t.mcErrorUnknown
    cudaErrorApiFailureBase = _mcError_t.mcErrorApiFailureBase


cdef enum mcDeviceAttribute_t:
    mcDeviceAttributeMaxThreadsPerBlock      #/< Maximum number of threads per block.
    mcDeviceAttributeMaxBlockDimX            #/< Maximum x-dimension of a block.
    mcDeviceAttributeMaxBlockDimY            #/< Maximum y-dimension of a block.
    mcDeviceAttributeMaxBlockDimZ            #/< Maximum z-dimension of a block.
    mcDeviceAttributeMaxGridDimX             #/< Maximum x-dimension of a grid.
    mcDeviceAttributeMaxGridDimY             #/< Maximum y-dimension of a grid.
    mcDeviceAttributeMaxGridDimZ             #/< Maximum z-dimension of a grid.
    mcDeviceAttributeMaxSharedMemoryPerBlock #/< Maximum shared memory available per block in
                                            #/< bytes.
    mcDeviceAttributeTotalConstantMemory     #/< Constant memory size in bytes.
    mcDeviceAttributeWarpSize                #/< Warp size in threads. Deprecated soon use
                                            #/< mcDeviceAttributeWaveSize instead.
    mcDeviceAttributeWaveSize                #/< Wave size in threads.
    mcDeviceAttributeMaxRegistersPerBlock    #/< Maximum number of 32-bit registers available to a
                                            #/< thread block. This number is shared by all thread
                                            #/< blocks simultaneously resident on a
                                            #/< multiprocessor.
    mcDeviceAttributeMaxRegistersPerMultiprocessor #/< Maximum number of 32-bit registers
                                                    #/< available to a multiprocessor
    mcDeviceAttributeClockRate                     #/< Peak clock frequency in kilohertz.
    mcDeviceAttributeMemoryClockRate               #/< Peak memory clock frequency in kilohertz.
    mcDeviceAttributeMemoryBusWidth                #/< Global memory bus width in bits.
    mcDeviceAttributeMultiProcessorCount           #/< Number of multiprocessors on the device.
    mcDeviceAttributeComputeMode                   #/< Compute mode that device is currently in.
    mcDeviceAttributeL2CacheSize #/< Size of L2 cache in bytes. 0 if the device doesn't have L2
                                #/< cache.
    mcDeviceAttributeMaxThreadsPerMultiProcessor #/< Maximum resident threads per
                                                #/< multiprocessor.
    mcDevAttrMaxBlocksPerMultiprocessor          #/< Maximum number of blocks per multiprocessor
    mcDeviceAttributeComputeCapabilityMajor      #/< Major compute capability version number.
    mcDeviceAttributeComputeCapabilityMinor      #/< Minor compute capability version number.
    mcDeviceAttributeConcurrentKernels           #/< Device can possibly execute multiple kernels
                                                #/< concurrently.
    mcDeviceAttributePciBusId                    #/< PCI Bus ID.
    mcDeviceAttributePciDeviceId                 #/< PCI Device ID.
    mcDeviceAttributeMaxSharedMemoryPerMultiprocessor #/< Maximum Shared Memory Per
                                                    #/< Multiprocessor.
    mcDeviceAttributeIsMultiGpuBoard                  #/< Multiple GPU devices.
    mcDeviceAttributeIntegrated                       #/< iGPU
    mcDeviceAttributeCooperativeLaunch                #/< Support cooperative launch
    mcDeviceAttributeCooperativeMultiDeviceLaunch     #/< Support cooperative launch on multiple
                                                    #/< devices
    mcDeviceAttributeMaxTexture1DWidth                #/< Maximum number of elements in 1D images
    mcDeviceAttributeMaxTexture2DWidth  #/< Maximum dimension width of 2D images in image elements
    mcDeviceAttributeMaxTexture2DHeight #/< Maximum dimension height of 2D images in image
                                        #/< elements
    mcDeviceAttributeMaxTexture3DWidth  #/< Maximum dimension width of 3D images in image elements
    mcDeviceAttributeMaxTexture3DHeight #/< Maximum dimensions height of 3D images in image
                                        #/< elements
    mcDeviceAttributeMaxTexture3DDepth  #/< Maximum dimensions depth of 3D images in image
                                        #/< elements

    mcDeviceAttributeHdpMemFlushCntl #/< Address of the HDP_MEM_COHERENCY_FLUSH_CNTL register
    mcDeviceAttributeHdpRegFlushCntl #/< Address of the HDP_REG_COHERENCY_FLUSH_CNTL register

    mcDeviceAttributeMaxPitch              #/< Maximum pitch in bytes allowed by memory copies
    mcDeviceAttributeTextureAlignment      #/< Alignment requirement for textures
    mcDeviceAttributeTexturePitchAlignment #/< Pitch alignment requirement for 2D texture
                                            #/< references bound to pitched memory;
    mcDeviceAttributeKernelExecTimeout     #/< Run time limit for kernels executed on the device
    mcDeviceAttributeCanMapHostMemory #/< Device can map host memory into device address space
    mcDeviceAttributeEccEnabled       #/< Device has ECC support enabled

    mcDeviceAttributeCooperativeMultiDeviceUnmatchedFunc      #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched functions
    mcDeviceAttributeCooperativeMultiDeviceUnmatchedGridDim   #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched grid
                                                            #/ dimensions
    mcDeviceAttributeCooperativeMultiDeviceUnmatchedBlockDim  #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched block
                                                            #/ dimensions
    mcDeviceAttributeCooperativeMultiDeviceUnmatchedSharedMem #/< Supports cooperative launch on
                                                            #/< multiple
                                                            #/ devices with unmatched shared
                                                            #/ memories
    mcDeviceAttributeAsicRevision  #/< Revision of the GPU in this device
    mcDeviceAttributeManagedMemory #/< Device supports allocating managed memory on this system
    mcDeviceAttributeDirectManagedMemAccessFromHost #/< Host can directly access managed memory
                                                    #/< on
                                                    #/ the device without migration
    mcDeviceAttributeConcurrentManagedAccess #/< Device can coherently access managed memory
                                            #/ concurrently with the CPU
    mcDeviceAttributePageableMemoryAccess    #/< Device supports coherently accessing pageable
                                            #/< memory
                                            #/ without calling mcHostRegister on it
    mcDeviceAttributePageableMemoryAccessUsesHostPageTables #/< Device accesses pageable memory
                                                            #/< via
                                                            #/ the host's page tables
    mcDeviceAttributeVirtualMemoryManagementSupported       #/< Device supports virtual memory
                                                            #/< management APIs
    mcDeviceAttributeHandleTypePosixFileDescriptorSupported #/< Device supports exporting memory
                                                            #/< to a posix file descriptor with
                                                            #/< mcMemExportToShareableHandle, if
                                                            #/< requested via mcMemCreate
    mcDeviceAttributeHandleTypeWin32HandleSupported #/< Device supports exporting memory to a
                                                    #/< Win32 NT handle with
                                                    #/< ::mcMemExportToShareableHandle, if
                                                    #/< requested via mcMemCreate
    mcDeviceAttributeGenericCompressionSupported    #/< Device supports compressible memory
                                                    #/< allocation via mcMemCreate
    mcDeviceAttributeCanUseStreamWaitValue #/< '1' if Device supports mcStreamWaitValue32() and
                                            #/< mcStreamWaitValue64()  '0' otherwise.
    mcDeviceAttributeCanUseStreamMemOps
    mcDeviceAttributeCanUseStreamWaitWaitValueNor
    mcDeviceAttributeCanFlushRemoteWrites
    mcDeviceAttributeMemoryPoolsSupported
    mcDeviceAttributeUnifiedAddressing #< Device shares a unified address space with the host
    mcDeviceAttributeMaxAccessPolicyWindowSize #/< The max value of mcAccessPolicyWindow bytes.
    mcDeviceAttributeMaxPersistingL2CacheSize  #/< Device's maximum l2 persisting setting bytes.
    mcDeviceAttributeGpuOverlap       #< Device can possibly copy memory and execute a kernel
                                    # concurrently. Deprecated. Use instead
                                    # CU_DEVICE_ATTRIBUTE_ASYNC_ENGINE_COUNT.
    mcDeviceAttributeAsyncEngineCount #< Number of asynchronous engines.
    mcDeviceAttributeMemoryPoolSupportedHandleTypes #< Bitmask of handle types supported with
                                                    # mempool based IPC
    mcDeviceAttributeTexture1DLinearWidth           #< Maximum 1D linear texture width
    mcDeviceAttributeTexture2DLinearWidth           #< Maximum 2D linear texture width
    mcDeviceAttributeTexture2DLinearHeight          #< Maximum 2D linear texture height
    mcDeviceAttributeTexture2DLinearPitch           #< Maximum 2D linear texture pitch in bytes
    mcDeviceAttributeHostNativeAtomicSupported
    mcDeviceAttributeMaxTexture1DLayeredWidth       #< Maximum 1D layered texture width
    mcDeviceAttributeMaxTexture1DLayeredLayers      #< Maximum layers in a 1D layered texture
    mcDeviceAttributeMaxTexture2DLayeredWidth       #< Maximum 2D layered texture width
    mcDeviceAttributeMaxTexture2DLayeredHeight      #< Maximum 1D layered texture height
    mcDeviceAttributeMaxTexture2DLayeredLayers      #< Maximum layers in a 2D layered texture
    mcDeviceAttributeSurfaceAligement
    mcDeviceAttributeComputePreemptionSupported
    mcDeviceAttributePciDomainId #/< PCI Domain ID.
    mcDeviceAttributeTccDriver
    mcDeviceAttributeUnknow
    mcDeviceAttributeMax


# class cudaDeviceAttr(Enum):
cpdef enum cudaDeviceAttr:
    cudaDevAttrMaxThreadsPerBlock = mcDeviceAttribute_t.mcDeviceAttributeMaxThreadsPerBlock
    cudaDevAttrMaxBlockDimX = mcDeviceAttribute_t.mcDeviceAttributeMaxBlockDimX
    cudaDevAttrMaxBlockDimY = mcDeviceAttribute_t.mcDeviceAttributeMaxBlockDimY
    cudaDevAttrMaxBlockDimZ = mcDeviceAttribute_t.mcDeviceAttributeMaxBlockDimZ
    cudaDevAttrMaxGridDimX = mcDeviceAttribute_t.mcDeviceAttributeMaxGridDimX
    cudaDevAttrMaxGridDimY = mcDeviceAttribute_t.mcDeviceAttributeMaxGridDimY
    cudaDevAttrMaxGridDimZ = mcDeviceAttribute_t.mcDeviceAttributeMaxGridDimZ
    cudaDevAttrMaxSharedMemoryPerBlock = mcDeviceAttribute_t.mcDeviceAttributeMaxSharedMemoryPerBlock
    cudaDevAttrTotalConstantMemory = mcDeviceAttribute_t.mcDeviceAttributeTotalConstantMemory
    cudaDevAttrWarpSize = mcDeviceAttribute_t.mcDeviceAttributeWarpSize
    cudaDevAttrMaxPitch = mcDeviceAttribute_t.mcDeviceAttributeMaxPitch
    cudaDevAttrMaxRegistersPerBlock = mcDeviceAttribute_t.mcDeviceAttributeMaxRegistersPerBlock
    cudaDevAttrClockRate = mcDeviceAttribute_t.mcDeviceAttributeClockRate
    cudaDevAttrTextureAlignment = mcDeviceAttribute_t.mcDeviceAttributeTextureAlignment
    cudaDevAttrGpuOverlap = mcDeviceAttribute_t.mcDeviceAttributeGpuOverlap
    cudaDevAttrMultiProcessorCount = mcDeviceAttribute_t.mcDeviceAttributeMultiProcessorCount
    cudaDevAttrKernelExecTimeout = mcDeviceAttribute_t.mcDeviceAttributeKernelExecTimeout
    cudaDevAttrIntegrated = mcDeviceAttribute_t.mcDeviceAttributeIntegrated
    cudaDevAttrCanMapHostMemory = mcDeviceAttribute_t.mcDeviceAttributeCanMapHostMemory
    cudaDevAttrComputeMode = mcDeviceAttribute_t.mcDeviceAttributeComputeMode
    cudaDevAttrMaxTexture1DWidth = mcDeviceAttribute_t.mcDeviceAttributeMaxTexture1DWidth
    cudaDevAttrMaxTexture2DWidth = mcDeviceAttribute_t.mcDeviceAttributeMaxTexture2DWidth
    cudaDevAttrMaxTexture2DHeight = mcDeviceAttribute_t.mcDeviceAttributeMaxTexture2DHeight
    cudaDevAttrMaxTexture3DWidth = mcDeviceAttribute_t.mcDeviceAttributeMaxTexture3DWidth
    cudaDevAttrMaxTexture3DHeight = mcDeviceAttribute_t.mcDeviceAttributeMaxTexture3DHeight
    cudaDevAttrMaxTexture3DDepth = mcDeviceAttribute_t.mcDeviceAttributeMaxTexture3DDepth
    cudaDevAttrMaxTexture2DLayeredWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLayeredHeight = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLayeredLayers = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrSurfaceAlignment = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrConcurrentKernels = mcDeviceAttribute_t.mcDeviceAttributeConcurrentKernels
    cudaDevAttrEccEnabled = mcDeviceAttribute_t.mcDeviceAttributeEccEnabled
    cudaDevAttrPciBusId = mcDeviceAttribute_t.mcDeviceAttributePciBusId
    cudaDevAttrPciDeviceId = mcDeviceAttribute_t.mcDeviceAttributePciDeviceId
    cudaDevAttrTccDriver = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMemoryClockRate = mcDeviceAttribute_t.mcDeviceAttributeMemoryClockRate
    cudaDevAttrGlobalMemoryBusWidth = mcDeviceAttribute_t.mcDeviceAttributeMemoryBusWidth
    cudaDevAttrL2CacheSize = mcDeviceAttribute_t.mcDeviceAttributeL2CacheSize
    cudaDevAttrMaxThreadsPerMultiProcessor = mcDeviceAttribute_t.mcDeviceAttributeMaxThreadsPerMultiProcessor
    cudaDevAttrAsyncEngineCount = mcDeviceAttribute_t.mcDeviceAttributeAsyncEngineCount
    cudaDevAttrUnifiedAddressing = mcDeviceAttribute_t.mcDeviceAttributeUnifiedAddressing
    cudaDevAttrMaxTexture1DLayeredWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture1DLayeredLayers = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DGatherWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DGatherHeight = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture3DWidthAlt = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture3DHeightAlt = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture3DDepthAlt = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrPciDomainId = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrTexturePitchAlignment = mcDeviceAttribute_t.mcDeviceAttributeTexturePitchAlignment
    cudaDevAttrMaxTextureCubemapWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTextureCubemapLayeredWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTextureCubemapLayeredLayers = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface1DWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DHeight = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface3DWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface3DHeight = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface3DDepth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface1DLayeredWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface1DLayeredLayers = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DLayeredWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DLayeredHeight = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurface2DLayeredLayers = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurfaceCubemapWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurfaceCubemapLayeredWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSurfaceCubemapLayeredLayers = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture1DLinearWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLinearWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLinearHeight = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DLinearPitch = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DMipmappedWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTexture2DMipmappedHeight = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrComputeCapabilityMajor = mcDeviceAttribute_t.mcDeviceAttributeComputeCapabilityMajor
    cudaDevAttrComputeCapabilityMinor = mcDeviceAttribute_t.mcDeviceAttributeComputeCapabilityMinor
    cudaDevAttrMaxTexture1DMipmappedWidth = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrStreamPrioritiesSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrGlobalL1CacheSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrLocalL1CacheSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxSharedMemoryPerMultiprocessor = mcDeviceAttribute_t.mcDeviceAttributeMaxSharedMemoryPerMultiprocessor
    cudaDevAttrMaxRegistersPerMultiprocessor = mcDeviceAttribute_t.mcDeviceAttributeMaxRegistersPerMultiprocessor
    cudaDevAttrManagedMemory = mcDeviceAttribute_t.mcDeviceAttributeManagedMemory
    cudaDevAttrIsMultiGpuBoard = mcDeviceAttribute_t.mcDeviceAttributeIsMultiGpuBoard
    cudaDevAttrMultiGpuBoardGroupID = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrHostNativeAtomicSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrSingleToDoublePrecisionPerfRatio = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrPageableMemoryAccess = mcDeviceAttribute_t.mcDeviceAttributePageableMemoryAccess
    cudaDevAttrConcurrentManagedAccess = mcDeviceAttribute_t.mcDeviceAttributeConcurrentManagedAccess
    cudaDevAttrComputePreemptionSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrCanUseHostPointerForRegisteredMem = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrReserved92 = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrReserved93 = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrReserved94 = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrCooperativeLaunch = mcDeviceAttribute_t.mcDeviceAttributeCooperativeLaunch
    cudaDevAttrCooperativeMultiDeviceLaunch = mcDeviceAttribute_t.mcDeviceAttributeCooperativeMultiDeviceLaunch
    cudaDevAttrMaxSharedMemoryPerBlockOptin = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrCanFlushRemoteWrites = mcDeviceAttribute_t.mcDeviceAttributeCanFlushRemoteWrites
    cudaDevAttrHostRegisterSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrPageableMemoryAccessUsesHostPageTables = mcDeviceAttribute_t.mcDeviceAttributePageableMemoryAccessUsesHostPageTables
    cudaDevAttrDirectManagedMemAccessFromHost = mcDeviceAttribute_t.mcDeviceAttributeDirectManagedMemAccessFromHost
    cudaDevAttrMaxBlocksPerMultiprocessor = mcDeviceAttribute_t.mcDevAttrMaxBlocksPerMultiprocessor
    cudaDevAttrMaxPersistingL2CacheSize = mcDeviceAttribute_t.mcDeviceAttributeMaxPersistingL2CacheSize
    cudaDevAttrMaxAccessPolicyWindowSize = mcDeviceAttribute_t.mcDeviceAttributeMaxAccessPolicyWindowSize
    cudaDevAttrReservedSharedMemoryPerBlock = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrSparseCudaArraySupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrHostRegisterReadOnlySupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrTimelineSemaphoreInteropSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMaxTimelineSemaphoreInteropSupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMemoryPoolsSupported = mcDeviceAttribute_t.mcDeviceAttributeMemoryPoolsSupported
    cudaDevAttrGPUDirectRDMASupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrGPUDirectRDMAFlushWritesOptions = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrGPUDirectRDMAWritesOrdering = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMemoryPoolSupportedHandleTypes = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrDeferredMappingCudaArraySupported = mcDeviceAttribute_t.mcDeviceAttributeUnknow
    cudaDevAttrMax = mcDeviceAttribute_t.mcDeviceAttributeMax



cdef enum mcLimit_t:
    mcLimitStackSize      # stack size in bytes of each GPU thread;
    mcLimitPrintfFifoSize # size in bytes of the shared FIFO used by the printf() device system
                           # call.
    mcLimitMallocHeapSize # size in bytes of the heap used by the malloc() and free() device
                           # system calls;
    mcLimitDevRuntimeSyncDepth # maximum grid depth at which a thread can isssue the device
                                # runtime call mcDeviceSynchronize() to wait on child grid
                                # launches to complete.
    mcLimitDevRuntimePendingLaunchCount # maximum number of outstanding device runtime launches.
    mcLimitMaxL2FetchGranularity        # L2 cache fetch granularity.
    mcLimitPersistingL2CacheSize        # Persisting L2 cache size in bytes
    mcLimitMax


cpdef enum cudaLimit:
    cudaLimitMallocHeapSize = mcLimit_t.mcLimitMallocHeapSize