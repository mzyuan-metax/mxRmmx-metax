# =============================================================================
# Copyright (c) 2018-2021, NVIDIA CORPORATION.
#
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
# in compliance with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License
# is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied. See the License for the specific language governing permissions and limitations under
# the License.
# =============================================================================

cmake_minimum_required(VERSION 3.23.1 FATAL_ERROR)

if(NOT EXISTS ${CMAKE_CURRENT_BINARY_DIR}/RAPIDS.cmake)
    file(DOWNLOAD https://raw.githubusercontent.com/rapidsai/rapids-cmake/branch-23.02/RAPIDS.cmake ${CMAKE_CURRENT_BINARY_DIR}/RAPIDS.cmake)
endif()
include(${CMAKE_CURRENT_BINARY_DIR}/RAPIDS.cmake)

include(rapids-cmake)
include(rapids-cpm)
include(rapids-export)
include(rapids-find)

project(
  RMM
  VERSION 23.02.00
  LANGUAGES CXX)

# Write the version header
rapids_cmake_write_version_file(include/rmm/version_config.hpp)

# Set a default build type if none was specified
rapids_cmake_build_type(Release)

# build options
option(BUILD_TESTS "Configure CMake to build tests" ON)
option(BUILD_BENCHMARKS "Configure CMake to build (google) benchmarks" OFF)
set(RMM_LOGGING_LEVEL
    "INFO"
    CACHE STRING "Choose the logging level.")
set_property(CACHE RMM_LOGGING_LEVEL PROPERTY STRINGS "TRACE" "DEBUG" "INFO" "WARN" "ERROR"
                                              "CRITICAL" "OFF")

option(HGPU_BUILD "build project on hgpu" ON)
if(HGPU_BUILD)
  if(DEFINED ENV{HPCC_PATH})
    set(CUBRIDGE_PATH $ENV{HPCC_PATH}/tools/cu-bridge)
  else()
    message(FATAL_ERROR "Please set env parameter HPCC_PATH")
  endif()

  if(THRUST_PATH)
    set(THRUST_PATH_INC ${THRUST_PATH})
  elseif(DEFINED ENV{THRUST_PATH})
    set(THRUST_PATH_INC $ENV{THRUST_PATH})
  else()
    set(THRUST_PATH_INC $ENV{HPCC_PATH}/tools/cu-bridge/include)
  endif()

  if(NOT (EXISTS ${THRUST_PATH_INC}))
    message(FATAL_ERROR "THRUST_PATH='${THRUST_PATH_INC}' not exists or not specified")
  endif()

  set(CMAKE_MODULE_PATH="${CUBRIDGE_PATH}/cmake_module/hpcc")
endif()
# Set logging level. Must go before including gtests and benchmarks. Set the possible values of
# build type for cmake-gui
message(STATUS "RMM: RMM_LOGGING_LEVEL = '${RMM_LOGGING_LEVEL}'")

# cudart can be statically linked or dynamically linked the python ecosystem wants dynamic linking
option(CUDA_STATIC_RUNTIME "Statically link the CUDA runtime" OFF)

if(NOT HGPU_BUILD)
# find packages we depend on
rapids_find_package(
  CUDAToolkit REQUIRED
  BUILD_EXPORT_SET rmm-exports
  INSTALL_EXPORT_SET rmm-exports)
else()
  set(CUDAToolkit_INCLUDE_DIRS ${CUBRIDGE_PATH}/include/)
  set(CUDAToolkit_LIBRARY_DIR $ENV{HPCC_PATH}/lib)
endif()

rapids_cpm_init()
include(cmake/thirdparty/get_spdlog.cmake)

if(NOT HGPU_BUILD)
  include(cmake/thirdparty/get_thrust.cmake)
endif()

# library targets
add_library(rmm INTERFACE)
add_library(rmm::rmm ALIAS rmm)

target_include_directories(rmm INTERFACE "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
                                         "$<INSTALL_INTERFACE:include>")

if(HGPU_BUILD)
  target_include_directories(rmm INTERFACE "$<BUILD_INTERFACE:${THRUST_PATH_INC}>"
                                            "$<BUILD_INTERFACE:${CUBRIDGE_PATH}/include>"
                                            "$<BUILD_INTERFACE:${CUBRIDGE_PATH}/include/soft-link>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcc>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcr>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/htc>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcblas>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcfft>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcdnn>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcsolver>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcsparse>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hcrand>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/common>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/include/hctx>"
                                            "$<INSTALL_INTERFACE:include>"
                                            "$<INSTALL_INTERFACE:${CUBRIDGE_PATH}/include>"
                                            "$<INSTALL_INTERFACE:${CUBRIDGE_PATH}/include/soft-link>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcc>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcr>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/htc>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcblas>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcfft>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcdnn>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcsolver>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcsparse>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hcrand>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/common>"
                                            "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/include/hctx>"
                                            )
endif()

if(NOT HGPU_BUILD)
  if(CUDA_STATIC_RUNTIME)
    message(STATUS "RMM: Enabling static linking of cudart")
    target_link_libraries(rmm INTERFACE CUDA::cudart_static)
    target_compile_definitions(rmm INTERFACE RMM_STATIC_CUDART)
  else()
    target_link_libraries(rmm INTERFACE CUDA::cudart)
  endif()
else()
  target_link_libraries(rmm INTERFACE hcruntime)
  target_link_directories(rmm INTERFACE  "$<INSTALL_INTERFACE:$ENV{HPCC_PATH}/lib>"
                                            "$<BUILD_INTERFACE:$ENV{HPCC_PATH}/lib>")
endif()

# target_link_libraries(rmm INTERFACE rmm::Thrust)
target_link_libraries(rmm INTERFACE spdlog::spdlog_header_only)
target_link_libraries(rmm INTERFACE dl)
if(HGPU_BUILD)
  target_compile_options(rmm INTERFACE -std=c++17)
  target_compile_features(rmm INTERFACE cxx_std_17)
else()
  target_compile_features(rmm INTERFACE cxx_std_17 $<BUILD_INTERFACE:cuda_std_17>)
endif()

if(HGPU_BUILD)
  set(CMAKE_CUDA_COMPILER "${CUBRIDGE_PATH}/bin/cucc")
  set(CMAKE_LINKER "${CUBRIDGE_PATH}/bin/cucc")
  set(CMAKE_CUDA_LINK_EXECUTABLE "<CMAKE_LINKER> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
  set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_LINKER> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

  target_compile_definitions(rmm INTERFACE "HGPU_BUILD")
  # target_compile_definitions(rmm INTERFACE "RMM_DISABLE_CUDA_MALLOC_ASYNC") # async api is ok in HGPU first release.
endif()

if((BUILD_TESTS OR BUILD_BENCHMARKS) AND CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  include(rapids-cuda)
  rapids_cuda_init_architectures(RMM)
  if(HGPU_BUILD)
    set(CMAKE_MODULE_PATH "${CUBRIDGE_PATH}/cmake_module/hpcc")
  endif()
  enable_language(CUDA)

  # Since RMM only enables CUDA optionally we need to manually include the file that
  # rapids_cuda_init_architectures relies on `project` calling
  include("${CMAKE_PROJECT_RMM_INCLUDE}")
  message(STATUS "RMM: Building benchmarks with GPU Architectures: ${CMAKE_CUDA_ARCHITECTURES}")

  include(cmake/thirdparty/get_gtest.cmake)
endif()

# optionally build tests
if(BUILD_TESTS AND CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  include(CTest) # calls enable_testing()
  add_subdirectory(tests)
endif()

# optionally build benchmarks
if(BUILD_BENCHMARKS AND CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  include(${rapids-cmake-dir}/cpm/gbench.cmake)
  rapids_cpm_gbench()
  add_subdirectory(benchmarks)
endif()

include(CPack)

# optionally assemble Thrust pretty-printers
if(Thrust_SOURCE_DIR)
  configure_file(scripts/load-pretty-printers.in load-pretty-printers @ONLY)
endif()

# install export targets
install(TARGETS rmm EXPORT rmm-exports)
install(DIRECTORY include/rmm/ DESTINATION include/rmm)
install(FILES ${RMM_BINARY_DIR}/include/rmm/version_config.hpp DESTINATION include/rmm)

set(doc_string
    [=[
Provide targets for RMM: RAPIDS Memory Manager.

The goal of the [RMM](https://github.com/rapidsai/rmm) is to provide:

  A common interface that allows customizing device and host memory allocation
  A collection of implementations of the interface
  A collection of data structures that use the interface for memory allocation
]=])

if (NOT HGPU_BUILD)
set(code_string
    [=[
if(NOT TARGET rmm::Thrust)
  thrust_create_target(rmm::Thrust FROM_OPTIONS)
endif()
]=])
else()
set(code_string
    [=[

]=])
endif()

rapids_export(
  INSTALL rmm
  EXPORT_SET rmm-exports
  GLOBAL_TARGETS rmm
  NAMESPACE rmm::
  DOCUMENTATION doc_string
  FINAL_CODE_BLOCK code_string)

# build export targets
rapids_export(
  BUILD rmm
  EXPORT_SET rmm-exports
  GLOBAL_TARGETS rmm
  NAMESPACE rmm::
  DOCUMENTATION doc_string
  FINAL_CODE_BLOCK code_string)

# make documentation

add_custom_command(
  OUTPUT RMM_DOXYGEN
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/doxygen
  COMMAND doxygen Doxyfile
  VERBATIM
  COMMENT "Custom command for RMM doxygen docs")

add_custom_target(
  rmm_doc
  DEPENDS RMM_DOXYGEN
  COMMENT "Target for the custom command to build the RMM doxygen docs")
